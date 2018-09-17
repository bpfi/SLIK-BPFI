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

public partial class module_user_masterusermaingroupsec : BasePage
{
    private static string TABLE_NAME = "MASTER_USER_MAIN_GROUP_SEC";

    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();
        btnLookUpUserGroupsecCode.Attributes["href"] = String.Format("javascript:fnShowDialog('../../lookup/generic.aspx?code=USEC&acol_0={0}&bcol_1={1}');", txtUserGroupsecCode.ClientID, lblName.ClientID);
        if (!Page.IsPostBack)
        {
            txtUser.Text = Request.Params["uid"];
            if (Request.Params["action"].Equals("edit"))
            {
                LoadData();
                txtUser.Enabled = false;
                btnCancelUserGroupsec.Text = "<i class='icon-remove'></i>Back";
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

            _ht["p_uid"] = Request.Params["uid"];

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
            _ht["p_uid"] = Request.Params["uid"];
            if (Request.Params["action"].Equals("add"))
            {
                _dal.Insert(TABLE_NAME, _ht);
            }
            else
                _dal.Update(TABLE_NAME, _ht);

            Shared.ShowSuccessGritter(this, string.Format("masterusermain.aspx?action=edit&id={0}", txtUser.Text));
        }
        catch (Exception ex)
        {
            Shared.ShowErrorDialog(this, ex);
        }
    }

    protected void btnSaveUserGroupsec_Click(object sender, EventArgs e)
    {
        SaveData();
    }

    protected void btnCancelUserGroupsec_Click(object sender, EventArgs e)
    {
        Response.Redirect(string.Format("masterusermain.aspx?action=edit&id={0}", txtUser.Text));
    }

}
