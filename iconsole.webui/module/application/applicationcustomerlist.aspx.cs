using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iConsole.DataAccessLayer;
using System.Collections;

public partial class module_application_applicationcustomerlist :BasePageList
{
    private static string TABLE_NAME = "APPLICATION_CUSTOMER";

    protected void Page_Init(object sender, EventArgs e)
    {
        PAGE_LIST = "APPLICATION_CUSTOMER";
        NEXT_PAGE = "applicationcustomer.aspx";
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();

        if (!Page.IsPostBack)
        {
            BindApplicationCustomer();
            btnDeleteApplicationCustomer.OnClientClick = "return confirm('Delete selected data?');";
        }
    }

    private void BindApplicationCustomer()
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

    private void DeleteApplicationCustomer(string no)
    {
        GeneralDAL _dal = null;
        Hashtable _ht = null;
        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            _ht["p_application_no"] = no;

            _dal.Delete(TABLE_NAME, _ht);
        }
        catch (Exception ex)
        {
            Shared.ShowErrorDialog(this, ex);
        }
    }

    protected void gvwListApplicationCustomer_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwList.PageIndex = e.NewPageIndex;
        BindApplicationCustomer();
    }

    protected void btnAddApplicationCustomer_Click(object sender, EventArgs e)
    {
        Response.Redirect("applicationcustomer.aspx?action=add");
    }

    protected void btnDeleteApplicationCustomer_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in gvwList.Rows)
        {
            CheckBox chb = (CheckBox)row.Cells[1].Controls[1];
            if (chb.Checked)
            {
                DeleteApplicationCustomer(gvwList.DataKeys[row.RowIndex][0].ToString());
            }
        }
        BindApplicationCustomer();
    }

    protected void btnSearchApplicationCustomer_Click(object sender, EventArgs e)
    {
        BindApplicationCustomer();
    }

    protected override void SelectedIndexChanged(object sender, EventArgs e)
    {
        base.SelectedIndexChanged(sender, e);
        Response.Redirect("applicationcustomer.aspx?action=edit&app_no=" + gvwList.SelectedDataKey[0].ToString());
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
