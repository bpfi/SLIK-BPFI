using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iConsole.DataAccessLayer;

public partial class widget_masternotificationlist : BasePageList
{
    private static string TABLE_NAME = "MASTER_NOTIFICATION";

    protected void Page_Init(object sender, EventArgs e)
    {
        PAGE_LIST = "MASTER_NOTIFICATION";
        NEXT_PAGE = "masternotification.aspx";
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();

        if (!Page.IsPostBack)
        {
            BindDataNotification();
            btnDeleteNotification.OnClientClick = "return confirm('Delete selected data?');";
        }
    }

    private void BindDataNotification()
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

    private void DeleteDataNotification(string notificationcode)
    {
        GeneralDAL _dal = null;
        Hashtable _ht = null;

        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            _ht["p_code"] = notificationcode;

            _dal.Delete(TABLE_NAME, _ht);
        }
        catch (Exception ex)
        {
            Shared.ShowErrorDialog(this, ex);
        }
    }

    protected void gvwListNotification_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwList.PageIndex = e.NewPageIndex;
        BindDataNotification();
    }

    protected void btnAddNotification_Click(object sender, EventArgs e)
    {
        Response.Redirect("masternotification.aspx?action=add");
    }

    protected void btnDeleteNotification_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in gvwList.Rows)
        {
            CheckBox chb = (CheckBox)row.Cells[1].Controls[1];
            if (chb.Checked)
            {
                DeleteDataNotification(gvwList.DataKeys[row.RowIndex][0].ToString());
            }
        }

        BindDataNotification();
    }

    protected void btnSearchNotification_Click(object sender, EventArgs e)
    {
        BindDataNotification();
    }

    protected override void SelectedIndexChanged(object sender, EventArgs e)
    {
        base.SelectedIndexChanged(sender, e);
        Response.Redirect("masternotification.aspx?action=edit&code=" + gvwList.SelectedDataKey[0].ToString());
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
