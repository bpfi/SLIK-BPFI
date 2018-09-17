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

public partial class module_finance_penjamin : BasePage
{
    private static string TABLE_NAME = "PENJAMIN";

    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();

        if (!Page.IsPostBack)
        {
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

            _ht["p_cif"] = Request.Params["cif"];
            _ht["p_no_identitas_penjamin"] = Request.Params["no_identitas_penjamin"];
            _ht["p_no_rekening"] = Request.Params["no_rekening"];
            _ht["p_cre_date"] = Request.Params["date"];

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
            //Shared.ApplyDefaultProp(_ht);

            _dal.Update(TABLE_NAME, _ht,"row");

            Shared.ShowSuccessGritter(this, string.Format("penjamin.aspx?action=edit&cif={0}&no_identitas_penjamin={1}&no_rekening={2}&date={3}", txtCIF.Text,txtNO_IDENTITAS_PENJAMIN.Text,txtNO_REKENING.Text,txtCRE_DATE.Text));

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
        Response.Redirect(string.Format("penjaminlist.aspx"));
    }
}
