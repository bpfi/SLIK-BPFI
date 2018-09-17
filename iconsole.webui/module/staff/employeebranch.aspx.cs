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


public partial class module_staff_employeebranch : BasePage
{
    private static string TABLE_NAME = "EMPLOYEE_BRANCH";

    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();
        btnLookUpBranchCode.Attributes["href"] = String.Format("javascript:fnShowDialog('../../lookup/generic.aspx?code=EB&acol_0={0}&bcol_1={1}');", txtBranchCode.ClientID, lblDescription.ClientID);
        if (!Page.IsPostBack)
        {

            txtEmployeeCode.Text = Request.Params["emp_code"];
            txtBranchCode.Text = Request.Params["branch_code"];
            if (Request.Params["action"].Equals("edit"))
            {
                LoadData();
                txtEmployeeCode.Enabled = false;
                btnCancelEMPBranch.Text = "<i class='icon-remove'></i>Back";
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

            _ht["p_emp_code"] = Request.Params["emp_code"];
            _ht["p_branch_code"] = Request.Params["branch_code"];

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
        string sNextEmpCode = string.Empty;
        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            MPF23.Shared.Mapper.UIToDB.Map(this.Controls, _ht);
            Shared.ApplyDefaultProp(_ht);

            _ht["branch_code"] = Request.Params["branch_code"];

            if (Request.Params["action"].Equals("add"))
            {
                _dal.Insert(TABLE_NAME, _ht, ref sNextEmpCode);
                txtEmployeeCode.Text = sNextEmpCode;
            }

            else
                _dal.Update(TABLE_NAME, _ht);

            Shared.ShowSuccessGritter(this, string.Format("employeebranch.aspx?action=edit&emp_code={0}&branch_code={1} ", txtEmployeeCode.Text, txtBranchCode.Text));
        }
        catch (Exception ex)
        {
            Shared.ShowErrorDialog(this, ex);
        }
    }

    protected void btnSaveEMPBranch_Click(object sender, EventArgs e)
    {
        SaveData();
    }

    protected void btnCancelEMPBranch_Click(object sender, EventArgs e)
    {
        Response.Redirect(string.Format("employeemain.aspx?action=edit&emp_code={0}", txtEmployeeCode.Text));
    }
}
