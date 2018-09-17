using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iConsole.DataAccessLayer;
using MPF23.Shared.Mapper;
using System.Data;
using System.Collections;

public partial class module_staff_employeedevice : BasePage
{
    private static string TABLE_NAME = "EMPLOYEE_DEVICE";

    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();

        btnLookUpDevice.Attributes["href"] = String.Format("javascript:fnShowDialog('../../lookup/generic.aspx?code=ED&acol_0={0}&bcol_1={1}');", txtDeviceCode.ClientID,lblIMEI.ClientID);
        //btnLookUpDevice.Attributes["href"] = String.Format("javascript:fnShowDialog('../../lookup/genericwithparameter.aspx?code=ED&acol_0={0}&bcol_1={1}&parc_employee_code={2}');", txtDeviceCode.ClientID, lblIMEI.ClientID, txtEmployeeCode.ClientID);
        
        if (!Page.IsPostBack)
        {
            txtIdEMPDevice.Text = Request.Params["id"];
            txtEmployeeCode.Text = Request.Params["emp_code"];

            if (Request.Params["action"].Equals("edit"))
            {
                
                LoadData();

                txtIdEMPDevice.Enabled = false;
                btnCancelEMPdevice.Text = "<i class='icon-remove'></i>Back";
                txtEmployeeCode.Enabled = false;
                txtLastDate.Enabled = false;

            }
            if (Request.Params["action"].Equals("add"))
            {
                txtLastDate.Visible = false;
            }

        }
    }

    private void LoadData()
    {
        GeneralDAL _dal = null;
        Hashtable _ht = null;
        
        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            _ht["p_id"] = txtIdEMPDevice.Text;
            _ht["p_employee_code"] = txtEmployeeCode.Text;
            _ht["p_emp_name"] = lblEMPName.Text;
            
            DataRow _dr = _dal.GetRow(TABLE_NAME, _ht);
            
            DBToUI.Map(this.Controls, _dr);

        }
        catch (Exception ex)
        {
            Shared.ShowErrorDialog(this, ex);
        }
    }

    private void SaveData()
    {
        GeneralDAL _dal = null;
        Hashtable _ht = null;

        int inextId = 0;
        
        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            MPF23.Shared.Mapper.UIToDB.Map(this.Controls, _ht);
            Shared.ApplyDefaultProp(_ht);


            _ht["p_id"] = Request.Params["id"];
            _ht["p_device_code"] = txtDeviceCode.Text;
            _ht["p_employee_code"] = Request.Params["emp_code"];

            if (Request.Params["action"].Equals("add"))
            {
                _dal.Insert(TABLE_NAME, _ht, ref  inextId);

                txtIdEMPDevice.Text = inextId.ToString();
            }

            else
                _dal.Update(TABLE_NAME, _ht);

            Shared.ShowSuccessGritter(this, string.Format("employeedevice.aspx?action=edit&id={0}&emp_code={1}", txtIdEMPDevice.Text,txtEmployeeCode.Text));

        }
        catch (Exception ex)
        {
            Shared.ShowErrorDialog(this, ex);
        }
    }

    protected void btnSaveEMPdevice_Click(object sender, EventArgs e)
    {
        SaveData();
    }

    protected void btnCancelEMPdevice_Click(object sender, EventArgs e)
    {
        Response.Redirect(string.Format("employeemain.aspx?action=edit&emp_code={0}", txtEmployeeCode.Text));
    }

    
}
