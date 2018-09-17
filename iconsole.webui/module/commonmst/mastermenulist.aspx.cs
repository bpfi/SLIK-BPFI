using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iConsole.DataAccessLayer;

public partial class module_commonmst_mastermenulist : BasePageList
{
    private static string TABLE_MENU = "MASTER_MENU";    
    
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();

        if (!Page.IsPostBack)
        {
            BindDataMenu();
            btnDeleteMenu.OnClientClick = "return confirm('Delete selected data?');";
        }
    }

    protected void Page_Init(object sender, EventArgs e)
    {
        PAGE_LIST = "MASTER_MENU";
        NEXT_PAGE = "mastermenu.aspx";
    }

    private void BindDataMenu()
    {
        GeneralDAL _dal = null;
        Hashtable _ht = null;

        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            _ht["p_keywords"] = txtSearch.Text;

            gvwList.DataSource = _dal.GetRows(TABLE_MENU, _ht);
            gvwList.DataBind();
        }
        catch (Exception ex)
        {
            Shared.ShowErrorDialog(this, ex);
        }
    }

    private void DeleteDataMenu(string id)
    {
        GeneralDAL _dal = null;
        Hashtable _ht = null;

        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            _ht["p_id"] = id;

            _dal.Delete(TABLE_MENU, _ht);
        }
        catch (Exception ex)
        {
            Shared.ShowErrorDialog(this, ex);
        }
    }

    protected void gvwListMenu_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwList.PageIndex = e.NewPageIndex;
        BindDataMenu();
    }

    protected void btnAddMenu_Click(object sender, EventArgs e)
    {
        Response.Redirect("mastermenu.aspx?action=add");
    }

    protected void btnDeleteMenu_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in gvwList.Rows)
        {
            CheckBox chb = (CheckBox)row.Cells[1].Controls[1];
            if (chb.Checked)
            {
                DeleteDataMenu(gvwList.DataKeys[row.RowIndex][0].ToString());
            }
        }

        BindDataMenu();
    }

    protected void btnSearchMenu_Click(object sender, EventArgs e)
    {
        BindDataMenu();
    }

    protected override void SelectedIndexChanged(object sender, EventArgs e)
    {
        base.SelectedIndexChanged(sender, e);
        Response.Redirect("mastermenu.aspx?action=edit&id=" + gvwList.SelectedDataKey[0].ToString());
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
