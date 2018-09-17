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


public partial class module_commonmst_mastertype : BasePage
{
    private static string TABLE_NAME = "MASTER_TYPE";

    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();
        if (!Page.IsPostBack)
        {
            txtCode.Text = Request.Params["code"];
            txtMerkCode.Text = Request.Params["merek_code"];
            if (Request.Params["action"].Equals("edit"))
            {
                LoadData();
                txtMerkCode.Enabled=false;
                txtCode.Enabled = false;
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

            _ht["p_code"] = Request.Params["code"];
            _ht["p_merek_code"] = Request.Params["merek_code"];
            
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
            _ht["p_merek_code"] = txtMerkCode.Text;

            if (Request.Params["action"].Equals("add"))
            {
                _dal.Insert(TABLE_NAME, _ht);
            }

            else
                _dal.Update(TABLE_NAME, _ht);
            Shared.ShowSuccessGritter(this, string.Format("mastertype.aspx?action=edit&merek_code={0}&code={1}", txtMerkCode.Text,txtCode.Text));

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
        Response.Redirect(string.Format("mastermerek.aspx?action=edit&merek_code={0}", txtMerkCode.Text));
    }

    
}
