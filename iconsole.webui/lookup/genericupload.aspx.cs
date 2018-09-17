using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using iConsole.DataAccessLayer;


public partial class lookup_genericupload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Form.Attributes.Add("enctype", "multipart/form-data");
        if (!Page.IsPostBack)
        {
            for (int i = 1; i <= 12; i++)
            {
                ddlBulan.Items.Add(i.ToString());
            }

            for (int i = 2000; i <= 3000; i++)
            {
                ddlTahun.Items.Add(i.ToString());
            }

            ddlTahun.Text = "2018";
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        List<string> listItem = new List<string>();
        string errorRow = "";
        string errorCif = "";
        GeneralDAL _dal = null;
        Hashtable _ht = null;

        if (FileUploadControl.HasFile)
        {
            string fileExt = System.IO.Path.GetExtension(FileUploadControl.FileName);

            if (fileExt == ".etlerr" || fileExt == ".log")
            {
                StreamReader reader = new StreamReader(FileUploadControl.FileContent);
                do
                {
                    listItem.Add(reader.ReadLine());
                } while (reader.Peek() != -1);
                reader.Close();

                foreach (string item in listItem)
                {
                    if (item.Split('|')[0] == "RECORD")
                    {
                        errorRow = item.Split('|')[1];
                        errorCif = item.Split('|')[2];
                        try
                        {
                            _dal = new GeneralDAL();
                            _ht = new Hashtable();

                            //var date = Convert.ToDateTime(txtStartdate.Text);
                            _ht["p_row_number"] = errorRow;
                            _ht["p_dateMonth"] = ddlBulan.SelectedItem.Value;
                            _ht["p_dateYear"] = ddlTahun.SelectedItem.Value;
                            _ht["p_cif"] = errorCif;
                            _dal.Update(Request.Params["table"], _ht);

                            string script = Shared.GenerateLookUpClearString(ClientQueryString);
                            ScriptManager.RegisterStartupScript(this, GetType(), "fn2", script, true);
                        }
                        catch (Exception ex)
                        {
                            lblError.Text = ex.Message;
                        }
                    }
                }
            }
            else
            {
                lblError.Text = "Only .txt files allowed!";
            }
        }
        else
        {
            lblError.Text = "You have not specified a file.";
        }
    }
}