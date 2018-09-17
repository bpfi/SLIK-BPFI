using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using iConsole.DataAccessLayer;


public partial class lookup_genericsinkronisasi : System.Web.UI.Page
{
    private string TABLE_NAME = "MASTER_COLUMN";
    private string TABLE_HEADER = "HEADER";

    protected void Message(string msg)
    {
        lblError.Text = msg;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            for (int i = 1; i <= 12; i++)
            {
                if(i.ToString().Length == 1)
                    ddlBulan.Items.Add("0"+i.ToString());
                else
                    ddlBulan.Items.Add(i.ToString());
            }

            for (int i = 2000; i <= 3000; i++)
            {
                ddlTahun.Items.Add(i.ToString());
            }

            ddlTahun.Text = "2018";
        }
    }
    protected string TarikXSP()
    {
        string xsp = string.Empty;
        GeneralDAL _dal = null;
        Hashtable _ht = null;
        DataRow dr = null;

        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            _ht["p_id"] = Request.Params["code"];

            dr = _dal.GetRow(TABLE_NAME, _ht);
            xsp = dr[3].ToString();
        }
        catch (Exception ex)
        {
            Message(ex.Message);
            xsp = string.Empty;
        }

        return xsp;
    }

    protected DataTable TarikData(string SPNAME)
    {
        GeneralDAL _dal = null;
        Hashtable _ht = null;
        DataTable dt = null;

        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();
            dt = new DataTable();

            _ht["p_dateMonth"] = ddlBulan.SelectedItem.Text;
            _ht["p_dateYear"] = ddlTahun.SelectedItem.Text;
            _ht["p_user"] = Shared.CurrentUID;
            _ht["p_ip"] = Shared.CurrentIPAddress;

            dt = _dal.GetTarikData(SPNAME, _ht);
        }
        catch (Exception ex)
        {
            Message(ex.Message);
            dt = null;
        }

        return dt;
    }

    protected bool SaveData(DataTable dtParam)
    {
        bool issuccess= true;
        string xsp = string.Empty;
        DataTable dt = null;
        GeneralDAL _dal = null;
        Hashtable _ht = null;
        SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationSettings.AppSettings["ConnectionString"]);

        try
        {
            dt = dtParam;
            using (var command = new SqlCommand("xsp_" + Request.Params["table"] + "_insert") { CommandType = CommandType.StoredProcedure })
            {
                command.Parameters.Add(new SqlParameter("@dt", dt));
                command.Connection = conn;
                conn.Open();
                command.ExecuteNonQuery();
                conn.Close();
            }

            _dal = new GeneralDAL();
            _ht = new Hashtable();

            _ht["p_tahun"] = ddlBulan.SelectedItem.Text;
            _ht["p_bulan"] = ddlBulan.SelectedItem.Text;
            _ht["p_code_segmen"] = Request.Params["code"]; //;
            _ht["p_jumlah_data_file"] = dt.Rows.Count;
            _ht["p_jumlah_data_segmen"] = dt.Rows.Count;
            _ht["p_cre_ip"] = Shared.CurrentIPAddress;
            _ht["p_cre_by"] = Shared.CurrentUID;
            _ht["p_cre_date"] = DateTime.Now;
            _ht["p_mod_date"] = DateTime.Now;
            _ht["p_mod_ip"] = Shared.CurrentIPAddress;
            _ht["p_mod_by"] = Shared.CurrentUID;

            _dal.Update(TABLE_HEADER, _ht);
        }
        catch (Exception ex)
        {
            Message(ex.Message);
            xsp = string.Empty;
            issuccess = false;
            conn.Close();
        }
        
        return issuccess;
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string SPName = TarikXSP();
        DataTable dt = new DataTable();

        if (SPName != null || SPName != string.Empty)
            dt = TarikData(SPName);

        if (dt != null)
        {
            if (SaveData(dt))
            {
                string script = Shared.GenerateLookUpClearString(ClientQueryString);
                ScriptManager.RegisterStartupScript(this, GetType(), "fn2", script, true);
            }
        }
    }
}