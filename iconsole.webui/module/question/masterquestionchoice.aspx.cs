using System;
using System.Data;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iConsole.DataAccessLayer;
using MPF23.Shared.Mapper;

public partial class module_question_masterquestionchoice : BasePage
{
    private static string TABLE_NAME = "MASTER_QUESTION_CHOICES";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            txtCode.Text = Request.Params["code"];
         
            if (Request.Params["action"].Equals("edit"))
            {
                LoadData();

                txtId.ReadOnly = true;

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

            _ht["p_id"] = Request.Params["id"];
            _ht["p_code_question"] = Request.Params["code"];

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

        int inextId = 0;

        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            MPF23.Shared.Mapper.UIToDB.Map(this.Controls, _ht);
            Shared.ApplyDefaultProp(_ht);

            _ht["p_code_question"] = txtCode.Text;

            if (Request.Params["action"].Equals("add"))
            {
                _dal.Insert(TABLE_NAME, _ht, ref inextId);
                txtId.Text = inextId.ToString();
            }

            else
                _dal.Update(TABLE_NAME, _ht);

            Shared.ShowSuccessGritter(this, string.Format("masterquestionchoice.aspx?action=edit&code={0}&id={1}", txtCode.Text, txtId.Text));
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
        Response.Redirect(string.Format("masterquestion.aspx?action=edit&code={0}",txtCode.Text));
    }

}
