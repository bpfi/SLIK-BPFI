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
using System.Configuration;
using System.Data.SqlClient;

public partial class module_debitur_badanusaha : BasePage
{
    private static string TABLE_NAME = "DEBITUR_BADAN_USAHA";
    //Testing
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadDataDropdownList();
        LoadDataDropdownList2();
        LoadInit();
        //btnLookupPostCode.Attributes["href"] = String.Format("javascript:fnShowDialog('../../lookup/generic.aspx?code=MZC&acol_0={0}&bcol_1={1}');", txtPostCode.ClientID, lblPostCodeDescription.ClientID);

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
            string constr = ConfigurationManager.ConnectionStrings["Test"].ToString(); // connection string
            SqlConnection con = new SqlConnection(constr);
            con.Open();

            SqlCommand com = new SqlCommand("select * from MASTER_DATI_REF", con); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            da.Fill(ds);  // fill dataset
            txtKODE_SANDI_KOTA.DataTextField = ds.Tables[0].Columns["NAMA"].ToString(); // text field name of table dispalyed in dropdown
            txtKODE_SANDI_KOTA.DataValueField = ds.Tables[0].Columns["DATI2"].ToString();             // to retrive specific  textfield name 
            txtKODE_SANDI_KOTA.DataSource = ds.Tables[0];      //assigning datasource to the dropdownlist
            txtKODE_SANDI_KOTA.DataBind();  //binding 
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
            txtKODE_BIDANG_USAHA.DataTextField = ds2.Tables[0].Columns["SEKTOR"].ToString(); // text field name of table dispalyed in dropdown
            txtKODE_BIDANG_USAHA.DataValueField = ds2.Tables[0].Columns["KODE"].ToString();             // to retrive specific  textfield name 
            txtKODE_BIDANG_USAHA.DataSource = ds2.Tables[0];      //assigning datasource to the dropdownlist
            txtKODE_BIDANG_USAHA.DataBind();  //binding 
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
            _ht["p_nomor_identitas"] = Request.Params["nomor_identitas"];
            _ht["p_nama_badan_usaha"] = Request.Params["nama_badan_usaha"];
            _ht["p_cre_date"] = Request.Params["cre_date"];

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

            Shared.ShowSuccessGritter(this, string.Format("badanusaha.aspx?action=edit&cif={0}&nomor_identitas={1}&cre_date={2}&nama_badan_usaha={3}", txtCIF.Text,txtNOMOR_IDENTITAS.Text,lblcredate.Text,txtNAMA_BADAN_USAHA.Text));

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
        Response.Redirect(string.Format("badanusahalist.aspx"));
    }
}
