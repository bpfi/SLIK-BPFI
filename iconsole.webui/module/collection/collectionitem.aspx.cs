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


public partial class module_collection_collectionitem : BasePage
{
    private static string TABLE_NAME_ITEM = "COLLECTION_ITEM";

    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();
        
        if (!Page.IsPostBack)
        {

            //txtTRXNo.Text = Request.Params["trx_no"];
            //txtTRXCode.Text = Request.Params["trx_code"];
            if (Request.Params["action"].Equals("edit"))
            {
                LoadData();
                txtTRXNo.Enabled = false;
                btnCancelItem.Text = "<i class='icon-remove'></i>Back";
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

            _ht["p_trx_no"] = Request.Params["trx_no"];
            _ht["p_trx_code"] = Request.Params["trx_code"];

            DataRow _dr = _dal.GetRow(TABLE_NAME_ITEM, _ht);

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

            if (Request.Params["action"].Equals("add"))
            {
                _dal.Insert(TABLE_NAME_ITEM, _ht);
            }

            else
                _dal.Update(TABLE_NAME_ITEM, _ht);

            Shared.ShowSuccessGritter(this, string.Format("collectionitem.aspx?action=edit&trx_no={0}&trx_code={1}", txtTRXNo.Text, txtTRXCode.Text));
        }
        catch (Exception ex)
        {
            Shared.ShowErrorDialog(this, ex);
        }
    }

    protected void btnSaveItem_Click(object sender, EventArgs e)
    {
        SaveData();
    }

    protected void btnCancelItem_Click(object sender, EventArgs e)
    {
        Response.Redirect(string.Format("collectionmain.aspx?action=edit&trx_no={0}", txtTRXNo.Text));
    } 
}
