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

public partial class module_commonsec_mastergrouprole : BasePage
{
    private static string TABLE_NAME = "MASTER_GROUP_ROLE_SEC";

    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();
        btnLookUpRoleCode.Attributes["href"] = String.Format("javascript:fnShowDialog('../../lookup/generic.aspx?code=GRC&acol_0={0}&bcol_1={1}');", txtRoleCode.ClientID, lblName.ClientID);

        if (!Page.IsPostBack)
        {
            txtGroupCode.Text = Request.Params["group_code"];
            txtRoleCode.Text = Request.Params["role_code"];
            
            if (Request.Params["action"].Equals("edit"))
            {
                LoadData();
              
                btnCancel.Text = "<i class='icon-remove'></i>Back";

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

            _ht["p_group_code"] = Request.Params["group_code"];
            _ht["p_role_code"] = Request.Params["role_code"];
            

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

            _ht["p_group_code"] = txtGroupCode.Text;
            _ht["p_role_code"] = txtRoleCode.Text;
            
            
            if (Request.Params["action"].Equals("add"))
            {
                _dal.Insert(TABLE_NAME, _ht);
            }

            else
                _dal.Update(TABLE_NAME, _ht);
          
            Shared.ShowSuccessGritter(this, string.Format("mastergrouprole.aspx?action=edit&group_code={0}&role_code={1}", txtGroupCode.Text, txtRoleCode.Text));

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
        Response.Redirect(string.Format("mastergroupsec.aspx?action=edit&code={0}",txtGroupCode.Text));
    }

}
