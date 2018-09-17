using System;
using System.Data;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using iConsole.DataAccessLayer;
using MPF23.Shared.Mapper;

public partial class module_commonmst_mastermenu : BasePage
{
    private static string TABLE_MENU = "MASTER_MENU";
    
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();
        btnLookupMenu.Attributes["href"] = String.Format("javascript:fnShowDialog('../../lookup/generic.aspx?code=MN&acol_0={0}&bcol_1={1}');", txtParentId.ClientID, lblMenuName.ClientID);
        btnLookUpRoleCode.Attributes["href"] = String.Format("javascript:fnShowDialog('../../lookup/generic.aspx?code=MRS&acol_0={0}&bcol_1={1}');", txtRoleCode.ClientID, lblName.ClientID);

        if (!Page.IsPostBack)
        {

            if (Request.Params["action"].Equals("edit"))
            {
                LoadData();
                txtId.Enabled = false;
                btnCancelMenu.Text = "<i class='icon-remove'></i>Back";
                txtId.Text = Request.Params["id"];
                //txtParentId.Text = Request.Params["parent_id"];
                txtCode.Enabled = false;
            }
            if (Request.Params["action"].Equals("add"))
            {
                txtId.Enabled = false;
                
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

            _ht["p_id"] = Request.Params["id"];

            DataRow _dr = _dal.GetRow(TABLE_MENU, _ht);

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
        
        int iNextID = 0;
        
        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            MPF23.Shared.Mapper.UIToDB.Map(this.Controls, _ht);
            Shared.ApplyDefaultProp(_ht);

            Shared.ApplyDefaultProp(_ht);

            if (Request.Params["action"].Equals("add"))
            {
                _dal.Insert(TABLE_MENU, _ht, ref iNextID);
                 txtId.Text = iNextID.ToString();
            }

            else
                _dal.Update(TABLE_MENU, _ht);

            Shared.ShowSuccessGritter(this, string.Format("mastermenu.aspx?action=edit&id={0}", txtId.Text));

        }
        catch (Exception ex)
        {
            Shared.ShowErrorDialog(this, ex);
        }
    }

    protected void btnSaveMenu_Click(object sender, EventArgs e)
    {
        SaveData();
    }

    protected void btnCancelMenu_Click(object sender, EventArgs e)
    {
        Response.Redirect(string.Format("mastermenulist.aspx"));
    }
}
