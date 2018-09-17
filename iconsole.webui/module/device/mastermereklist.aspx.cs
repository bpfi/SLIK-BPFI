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

public partial class module_commonmst_mastermereklist : BasePageList
{
    private static string TABLE_NAME = "MASTER_MEREK";

    protected void Page_Init(object sender, EventArgs e)
    {
        PAGE_LIST = "MASTER_MEREK";
        NEXT_PAGE = "mastermerek.aspx";
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();

        if (!Page.IsPostBack)
        {
            BindDataMerek();

            btnDeleteMerek.OnClientClick = "return confirm('Delete selected data?');";
        }
    }

    private void BindDataMerek()
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

    private void DeleteDataMerek(string groupcode)
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

    protected void gvwListMerek_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwList.PageIndex = e.NewPageIndex;
        BindDataMerek();
    }

    protected void btnAddMerek_Click(object sender, EventArgs e)
    {
        Response.Redirect("mastermerek.aspx?action=add");
    }

    protected void btnDeleteMerek_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in gvwList.Rows)
        {
            CheckBox chb = (CheckBox)row.Cells[1].Controls[1];
            if (chb.Checked)
            {
                DeleteDataMerek(gvwList.DataKeys[row.RowIndex][0].ToString());
            }
        }

        BindDataMerek();
    }

    protected void btnSearchMerek_Click(object sender, EventArgs e)
    {
        BindDataMerek();
    }

    protected override void SelectedIndexChanged(object sender, EventArgs e)
    {
        base.SelectedIndexChanged(sender, e);
        Response.Redirect("mastermerek.aspx?action=edit&merek_code=" + gvwList.SelectedDataKey[0].ToString());
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
