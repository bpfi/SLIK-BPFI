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

public partial class module_commonmst_mastergeneralsubcode : BasePage
{
    private static string TABLE_NAME = "MASTER_GENERAL_SUBCODE";


    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();

        if (!Page.IsPostBack)
        {
            txtGeneralCode.Text = Request.Params["general_code"];
            if (Request.Params["action"].Equals("edit"))
            {
                LoadData();
                txtGeneralCode.ReadOnly = true;
                txtCode.Enabled = false;
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
            _ht["p_general_code"] = Request.Params["general_code"];
            _ht["p_code"] = Request.Params["subcode"];

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
            _ht["p_general_code"] = Request.Params["general_code"];

            if (Request.Params["action"].Equals("add"))
            {
                _dal.Insert(TABLE_NAME, _ht);
            }

            else
                _dal.Update(TABLE_NAME, _ht);
            Shared.ShowSuccessGritter(this, string.Format("mastergeneralsubcode.aspx?action=edit&general_code={0}&subcode={1}", txtGeneralCode.Text, txtCode.Text));

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

    protected void btnChangeStatus_Click(object sender, EventArgs e)
    {
        GeneralDAL _dal = null;
        Hashtable _ht = null;
        try
        {
            _dal =  new GeneralDAL();
            _ht = new Hashtable();

            _ht["p_code"] = Request.Params["subcode"];
            Shared.ApplyDefaultProp(_ht);

            _dal.ExecRawSP("xsp_master_general_subcode_update_status" , _ht);
            Shared.ShowSuccessGritter(this, string.Format("mastergeneralsubcode.aspx?action=edit&general_code={0}&subcode={1}", txtGeneralCode.Text, txtCode.Text));
       }
       catch (Exception ex)
        {
            Shared.ShowErrorDialog(this,ex);
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
    

        Response.Redirect(string.Format("mastergeneralcode.aspx?action=edit&code={0}", txtGeneralCode.Text));
    }

    
}
