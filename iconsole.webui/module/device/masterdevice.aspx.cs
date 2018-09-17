using System;
using System.Data;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iConsole.DataAccessLayer;
using MPF23.Shared.Mapper;

public partial class module_commonmst_masterdevice : BasePage
{
    private static string TABLE_NAME = "MASTER_DEVICE";
   
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();
        btnLookUpMerk.Attributes["href"] = String.Format("javascript:fnShowDialog('../../lookup/generic.aspx?code=MRK&acol_0={0}&bcol_1={1}');", txtMerkCode.ClientID, lblMerkDescription.ClientID);
        btnLookUpType.Attributes["href"] = String.Format("javascript:fnShowDialog('../../lookup/genericwithparameter.aspx?code=TY&acol_0={0}&bcol_1={1}&parc_merek_code={2}');",  txtTypeCode.ClientID , lblTypeDescription.ClientID, txtMerkCode.ClientID);

        if (!Page.IsPostBack)
        {

            txtDeviceCode.Text = Request.Params["code"];
            if (Request.Params["action"].Equals("edit"))
            {
                LoadData();
                txtDeviceCode.Enabled = false;
                btnCancel.Text = "<i class='icon-remove'></i>Back";
            }
            if (Request.Params["action"].Equals("add"))
            {
                btnChangeStatus.Visible = false;
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

            _ht["p_code"] = Request.Params["code"];

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
        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            MPF23.Shared.Mapper.UIToDB.Map(this.Controls, _ht);
            Shared.ApplyDefaultProp(_ht);

            _ht["p_code"] = txtDeviceCode.Text;

            Shared.ApplyDefaultProp(_ht);

            btnChangeStatus.Enabled = false;

            if (Request.Params["action"].Equals("add"))
            {
                _dal.Insert(TABLE_NAME, _ht);
            }

            else
                _dal.Update(TABLE_NAME, _ht);

            Shared.ShowSuccessGritter(this, string.Format("masterdevice.aspx?action=edit&code={0}", txtDeviceCode.Text));

        }
        catch (Exception ex)
        {
            Shared.ShowErrorDialog(this, ex);
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        SaveData();
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect(string.Format("masterdevicelist.aspx"));
    }

    protected void btnChangeStatus_Click(object sender, EventArgs e)
    {
        GeneralDAL _dal = null;
        Hashtable _ht = null;

        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            _ht["p_code"] = Request.Params["code"];
            Shared.ApplyDefaultProp(_ht);

            _dal.ExecRawSP("xsp_master_device_update_status", _ht); // untuk megeksekusi sp selain dari 5 sp pokok

            Shared.ShowSuccessGritter(this, string.Format("masterdevice.aspx?action=edit&code={0}", txtDeviceCode.Text));
        }
        catch (Exception ex)
        {
            Shared.ShowErrorDialog(this, ex);
        }
    }

}
