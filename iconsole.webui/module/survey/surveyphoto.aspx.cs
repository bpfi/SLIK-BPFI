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

public partial class module_survey_surveyphoto : BasePage
{
    public static string TABLE_NAME = "SURVEY_PHOTO";

    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();
        if (!Page.IsPostBack)
        {
          

            txtTrxNo.Text = Request.Params["trx_no"];
            txtId.Text = Request.Params["id"];

            if (Request.Params["action"].Equals("edit"))
            {
                LoadData();
                txtId.Enabled = false;
                txtTrxNo.ReadOnly = true;
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

            _ht["p_id"] = Request.Params["id"];
            _ht["p_trx_no"] = Request.Params["trx_no"];
         
            DataRow _dr = _dal.GetRow(TABLE_NAME, _ht);

            DBToUI.Map(this.Controls, _dr);
        }
        catch (Exception ex)
        {
            Shared.ShowErrorDialog(this, ex);
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {

        Response.Redirect(string.Format("surveymain.aspx?action=edit&trx_no={0}", txtTrxNo.Text));
    }

}
