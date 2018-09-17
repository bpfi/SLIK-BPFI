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

public partial class module_question_masterquestiongroupmain : BasePage
{
    private static string TABLE_NAME = "MASTER_QUESTION_GROUP";
    private static string TABLE_NAME_DETAIL = "MASTER_QUESTION_GROUP_DETAIL";

    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();

        if (!Page.IsPostBack)
        {
            if (Request.Params["action"].Equals("edit"))
            {
                LoadData();
                BindGroupRole();
                txtCode.Enabled = false;
                btnCancel.Text = "<i class='icon-remove'></i>Back";
            }
            if (Request.Params["action"].Equals("add"))
            {
                btnAddGroupRole.Visible = false;
                btnDeleteGroupRole.Visible = false;
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
            if (Request.Params["action"].Equals("add"))
            {
                _dal.Insert(TABLE_NAME, _ht);
            }

            else
                _dal.Update(TABLE_NAME, _ht);

            Shared.ShowSuccessGritter(this, string.Format("masterquestiongroupmain.aspx?action=edit&code={0}", txtCode.Text));

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
        Response.Redirect(string.Format("masterquestiongrouplist.aspx"));
    }

    #region Group Role Sec

    private void BindGroupRole()
    {
        GeneralDAL _dal = null;
        Hashtable _ht = null;

        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            _ht["p_keywords"] = txtSearch.Text;
            _ht["p_group_code"] = Request.Params["code"];

            gvwListGroupRole.DataSource = _dal.GetRows(TABLE_NAME_DETAIL, _ht);
            gvwListGroupRole.DataBind();
        }
        catch (Exception ex)
        {
            Shared.ShowErrorDialog(this, ex);
        }
    }

    protected void btnSearchGroupRole_Click(object sender, EventArgs e)
    {
        if (Request.Params["action"].Equals("edit"))
            BindGroupRole();
    }

    protected void gvwListGroupRole_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwListGroupRole.PageIndex = e.NewPageIndex;
        BindGroupRole();
    }

    protected void gvwListGroupRole_SelectedIndexChanged(object sender, EventArgs e)
    {

        Response.Redirect(string.Format("masterquestiongroupdetail.aspx?action=edit&code_question={0}&group_code={1}", txtCode.Text, gvwListGroupRole.SelectedDataKey[1].ToString()));
    }

    protected void chbCheckedAll_CheckedChanged(object sender, EventArgs e)
    {
        foreach (GridViewRow gvr in gvwListGroupRole.Rows)
        {
            CheckBox cbSelect = gvr.FindControl("chbChecked") as CheckBox;
            cbSelect.Checked = ((CheckBox)sender).Checked;
        }
    }

    protected void btnAddGroupRole_Click(object sender, EventArgs e)
    {
        Response.Redirect("masterquestiongroupdetail.aspx?action=add&code=" + txtCode.Text);
    }

    protected void btnDeleteGroupRole_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in gvwListGroupRole.Rows)
        {
            CheckBox chb = (CheckBox)row.Cells[1].Controls[1];
            if (chb.Checked)
            {
                DeleteDataGroupRole(gvwListGroupRole.DataKeys[row.RowIndex][0].ToString());
            }
        }
        BindGroupRole();
    }

    private void DeleteDataGroupRole(string generalcodecode)
    {
        GeneralDAL _dal = null;
        Hashtable _ht = null;
        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();
            _ht["p_code_question"] = generalcodecode;
            _dal.Delete(TABLE_NAME_DETAIL, _ht);
        }
        catch (Exception ex)
        {
            Shared.ShowErrorDialog(this, ex);
        }
    }
    #endregion
}