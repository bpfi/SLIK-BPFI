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
using System.Data.SqlClient;
using System.Configuration;

public partial class module_finance_fasilitaskredit : BasePage
{
    private static string TABLE_NAME = "KREDIT";

    protected void Page_Load(object sender, EventArgs e)
    {
        LoadDataDropdownList();
        LoadDataDropdownList2();
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
    private void LoadDataDropdownList()
    {
        try
        {
            string constr = ConfigurationManager.ConnectionStrings["Test2"].ToString(); // connection string
            SqlConnection con = new SqlConnection(constr);
            con.Open();

            SqlCommand com = new SqlCommand("select * from MASTER_DATI_REF", con); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            da.Fill(ds);  // fill dataset
            txtKD_KAB.DataTextField = ds.Tables[0].Columns["NAMA"].ToString(); // text field name of table dispalyed in dropdown
            txtKD_KAB.DataValueField = ds.Tables[0].Columns["DATI2"].ToString();             // to retrive specific  textfield name 
            txtKD_KAB.DataSource = ds.Tables[0];      //assigning datasource to the dropdownlist
            txtKD_KAB.DataBind();  //binding 
            con.Close();
        }
        catch (Exception err)
        {
            //lblResults.Text = "Error reading list of names. ";
            //lblResults.Text += err.Message;
            // The Code below Shows the Alert Box
            // Response.Write("<script>alert('No Image Selected!')</script>");

        }
    }
    private void LoadDataDropdownList2()
    {
        try
        {
            string constr2 = ConfigurationManager.ConnectionStrings["Test2"].ToString(); // connection string
            SqlConnection con2 = new SqlConnection(constr2);
            con2.Open();

            SqlCommand com2 = new SqlCommand("select * from MASTER_SEKTOR_EKONOMI_REF", con2); // table name 
            SqlDataAdapter da2 = new SqlDataAdapter(com2);
            DataSet ds2 = new DataSet();
            da2.Fill(ds2);  // fill dataset
            txtKD_SEKTOR_EKONOMI.DataTextField = ds2.Tables[0].Columns["SEKTOR"].ToString(); // text field name of table dispalyed in dropdown
            txtKD_SEKTOR_EKONOMI.DataValueField = ds2.Tables[0].Columns["KODE"].ToString();             // to retrive specific  textfield name 
            txtKD_SEKTOR_EKONOMI.DataSource = ds2.Tables[0];      //assigning datasource to the dropdownlist
            txtKD_SEKTOR_EKONOMI.DataBind();  //binding 
            con2.Close();
        }
        catch (Exception err)
        {
            //lblResults.Text = "Error reading list of names. ";
            //lblResults.Text += err.Message;
            // The Code below Shows the Alert Box
            // Response.Write("<script>alert('No Image Selected!')</script>");

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
            _ht["p_no_rekening_fasilitas"] = Request.Params["no_rekening_fasilitas"];
            _ht["p_no_akad_awal"] = Request.Params["no_akad_awal"];
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

            Shared.ShowSuccessGritter(this, string.Format("fasilitaskredit.aspx?action=edit&cif={0}&no_akad_awal={1}&no_rekening_fasilitas={2}&date={3}", txtCIF.Text,txtNO_AKAD_AWAL.Text,txtNO_REKENING_FASILITAS.Text,lblcredate.Text));

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
        Response.Redirect(string.Format("fasilitaskreditlist.aspx"));
    }
}
