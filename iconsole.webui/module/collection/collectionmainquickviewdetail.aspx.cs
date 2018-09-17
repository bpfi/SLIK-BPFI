using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iConsole.DataAccessLayer;
using System.Collections;
using MPF23.XUI.Control;

public partial class module_collection_collectionmainquickviewdetail : BasePageList
{
    private static string TABLE_NAME = "COLLECTION_MAIN";
    private static string FILTER = "";

    protected void Page_Init(object sender, EventArgs e)
    {
        PAGE_LIST = "COLLECTION_MAIN";
        NEXT_PAGE = "collectionmainquickviewdetail.aspx";
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();
        if (!Page.IsPostBack)
        {
            if (Request.Params["filter"] == "totalcollection")
                lblFilterQuickView.Text = "Total Collection";
            else if (Request.Params["filter"] == "paidamount")
                lblFilterQuickView.Text = "Total Paid";
            else if (Request.Params["filter"] == "unpaidamount")
                lblFilterQuickView.Text = "Total Unpaid";

            BindDataColletion();
        }
    }

    private void BindDataColletion()
    {
        GeneralDAL _dal = null;
        Hashtable _ht = null;

        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            _ht["p_keywords"] = "";
            _ht["p_console_status"] = "ALL";
            _ht["p_result_status"] = "ALL";

            gvwList.DataSource = _dal.GetRows(TABLE_NAME, _ht);
            gvwList.DataBind();
        }
        catch (Exception ex)
        {
            Shared.ShowErrorDialog(this, ex);
        }
    }

    private void DeleteDataColletion(string trx_no)
    {
        GeneralDAL _dal = null;
        Hashtable _ht = null;

        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            _ht["p_trx_no"] = trx_no;

            _dal.Delete(TABLE_NAME, _ht);
        }
        catch (Exception ex)
        {
            Shared.ShowErrorDialog(this, ex);
        }
    }

    protected void gvwList_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwList.PageIndex = e.NewPageIndex;
        BindDataColletion();
    }

    protected void btnAddCollection_Click(object sender, EventArgs e)
    {
        Response.Redirect("collectionmain.aspx?action=add");
    }

    protected void btnDeleteCollection_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in gvwList.Rows)
        {
            CheckBox chb = (CheckBox)row.Cells[1].Controls[1];
            if (chb.Checked)
            {
                DeleteDataColletion(gvwList.DataKeys[row.RowIndex][0].ToString());
            }
        }

        BindDataColletion();
    }

    protected void btnSearchCollection_Click(object sender, EventArgs e)
    {
        BindDataColletion();
    }

    protected override void SelectedIndexChanged(object sender, EventArgs e)
    {
        base.SelectedIndexChanged(sender, e);
        Response.Redirect(string.Format("collectionmain.aspx?action=edit&trx_no={0}&filter_status={1}&filter_result={2}", gvwList.SelectedDataKey[0].ToString(), "ALL", "ALL"));
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
