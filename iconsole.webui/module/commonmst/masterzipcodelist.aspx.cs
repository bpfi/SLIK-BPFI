using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iConsole.DataAccessLayer;
using System.Collections;

public partial class module_commonmst_masterzipcodelist : BasePageList
{
    private static string TABLE_NAME = "MASTER_ZIP_CODE";

    protected void Page_Init(object sender, EventArgs e)
    {
        PAGE_LIST = "MASTER_ZIP_CODE";
        NEXT_PAGE = "masterzipcodelist.aspx";
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();

        if (!Page.IsPostBack)
        {
            BindDataZipCode();
            btnDeleteZipCode.OnClientClick = "return confirm('Delete selected data?');";
        }
    }

    private void BindDataZipCode()
    {
        GeneralDAL _dal = null;
        Hashtable _ht = null;

        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            _ht["p_keywords"] = txtSearch.Text;

            gvwList.DataSource = _dal.GetRows(TABLE_NAME, _ht);
            gvwList.DataBind();
        }
        catch (Exception ex)
        {
            Shared.ShowErrorDialog(this, ex);
        }
    }

    private void DeleteDataZipCode(string groupcode)
    {
        GeneralDAL _dal = null;
        Hashtable _ht = null;

        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            _ht["p_code"] = groupcode;

            _dal.Delete(TABLE_NAME, _ht);
        }
        catch (Exception ex)
        {
            Shared.ShowErrorDialog(this, ex);
        }
    }

    protected void gvwListZipCode_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwList.PageIndex = e.NewPageIndex;
        BindDataZipCode();
    }

    protected void btnAddZipCode_Click(object sender, EventArgs e)
    {
        Response.Redirect("masterzipcode.aspx?action=add");
    }

    protected void btnDeleteZipCode_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in gvwList.Rows)
        {
            CheckBox chb = (CheckBox)row.Cells[1].Controls[1];
            if (chb.Checked)
            {
                DeleteDataZipCode(gvwList.DataKeys[row.RowIndex][0].ToString());
            }
        }

        BindDataZipCode();
    }

    protected void btnSearchZipCode_Click(object sender, EventArgs e)
    {
        BindDataZipCode();
    }

    protected override void SelectedIndexChanged(object sender, EventArgs e)
    {
        base.SelectedIndexChanged(sender, e);
        Response.Redirect("masterzipcode.aspx?action=edit&code=" + gvwList.SelectedDataKey[0].ToString());
    }

    protected void chbCheckedAll_CheckedChanged(object sender, EventArgs e)
    {
        foreach (GridViewRow gvr in gvwList.Rows)
        {
            CheckBox cbSelect = gvr.FindControl("chbChecked") as CheckBox;
            cbSelect.Checked = ((CheckBox)sender).Checked;
        }
    }
  }