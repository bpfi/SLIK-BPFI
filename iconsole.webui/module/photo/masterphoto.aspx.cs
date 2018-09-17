using System;
using System.Data;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iConsole.DataAccessLayer;
using MPF23.Shared.Mapper;
using MPF23.XUI.Control;

public partial class module_photo_masterphoto : BasePage
{
    private static string TABLE_NAME = "MASTER_PHOTO";
    private static string TABLE_NAME_DETAIL = "MASTER_QUESTION_CHOICES";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
           
            if (Request.Params["action"].Equals("edit"))
            {
                LoadData();
               // BindQuestionChoice();

               // btnDeleteQuestionChoice.OnClientClick = "return confirm('Delete selected data?');";
        
                txtCode.ReadOnly = true;
                btnCancel.Text = "<i class='icon-remove'></i>Back";
            }
            /*if (Request.Params["action"].Equals("add"))
            {
                btnAddQuestionChoice.Visible = false;
                btnDeleteQuestionChoice.Visible = false;
            }*/
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
            
            _ht["p_code"] = txtCode.Text;
            
            Shared.ApplyDefaultProp(_ht);
            
            if (Request.Params["action"].Equals("add"))
            {
                _dal.Insert(TABLE_NAME, _ht);
            }
            else
                _dal.Update(TABLE_NAME, _ht);

            //Shared.ShowSuccessGritter(this, string.Format("masterphoto.aspx?action=edit&code={0}", txtCode.Text));
            Shared.ShowSuccessGritter(this, string.Format("masterphotolist.aspx"));
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
        Response.Redirect(string.Format("masterphotolist.aspx"));
    }

    protected void cbShowPass_CheckedChanged(object sender, EventArgs e)
    {
        if (sender != null)
        {
            if (((CheckBox)sender).Checked)
            {
                txtDescription.TextMode = TextBoxMode.SingleLine;
            }
            else
            {
                txtDescription.TextMode = TextBoxMode.Password;
            }
        }
    }

    #region Question Choice

  /*  private void BindQuestionChoice()
    {
        GeneralDAL _dal = null;
        Hashtable _ht = null;

        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            _ht["p_keywords"] = txtSearch.Text;
            _ht["p_code_question"] = txtCode.Text;

            gvwListQuestionChoice.DataSource = _dal.GetRows(TABLE_NAME_DETAIL, _ht);
            gvwListQuestionChoice.DataBind();
        }
        catch (Exception ex)
        {
            Shared.ShowErrorDialog(this, ex);
        }
    }

    private void DeleteDataQuestionChoice(string id)
    {
        GeneralDAL _dal = null;
        Hashtable _ht = null;

        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            _ht["p_id"] = id;

            _dal.Delete(TABLE_NAME_DETAIL, _ht);
        }
        catch (Exception ex)
        {
            Shared.ShowErrorDialog(this, ex);
        }
    }

    protected void btnSearchQuestionChoice_Click(object sender, EventArgs e)
    {
        if (Request.Params["action"].Equals("edit"))
            BindQuestionChoice();
    }
  
    protected void gvwListQuestionChoice_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwListQuestionChoice.PageIndex = e.NewPageIndex;
        BindQuestionChoice();
    }

    protected void gvwListQuestionChoice_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        Response.Redirect(string.Format("masterquestionchoice.aspx?action=edit&code={0}&id={1} " , txtCode.Text, gvwListQuestionChoice.SelectedDataKey[0].ToString()));
    }
   
    protected void chbCheckedAll_CheckedChanged(object sender, EventArgs e)
    {
        foreach (GridViewRow gvr in gvwListQuestionChoice.Rows)
        {
            CheckBox cbSelect = gvr.FindControl("chbChecked") as CheckBox;
            cbSelect.Checked = ((CheckBox)sender).Checked;
        }
    }

    protected void btnAddQuestionChoice_Click(object sender, EventArgs e)
    {
        Response.Redirect("masterquestionchoice.aspx?action=add&code=" + txtCode.Text);
    }

    protected void btnDeleteQuestionChoice_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in gvwListQuestionChoice.Rows)
        {
            CheckBox chb = (CheckBox)row.Cells[1].Controls[1];
            if (chb.Checked)
            {
                DeleteDataQuestionChoice(gvwListQuestionChoice.DataKeys[row.RowIndex][0].ToString());
            }
        }

        BindQuestionChoice();
    }
*/
    #endregion

}
