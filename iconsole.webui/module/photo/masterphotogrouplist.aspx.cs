using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iConsole.DataAccessLayer;
                                        
public partial class module_photo_masterphotogrouplist : BasePageList
{
    private static string TABLE_NAME = "MASTER_PHOTO_GROUP";

    protected void Page_Init(object sender, EventArgs e)
    {
        PAGE_LIST = "MASTER_PHOTO_GROUP";
        NEXT_PAGE = "masterphotogroupmain.aspx";
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();

        if (!Page.IsPostBack)
        {
            BindDataGroup();
            btnDeleteGroup.OnClientClick = "return confirm('Delete selected data?');";
        }
    }

    private void BindDataGroup()
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

    private void DeleteDataGroup(string groupcode)
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

    protected void gvwListGroup_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwList.PageIndex = e.NewPageIndex;
        BindDataGroup();
    }

    protected void btnAddGroup_Click(object sender, EventArgs e)
    {
        Response.Redirect("masterphotogroup.aspx?action=add");
    }

    protected void btnDeleteGroup_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in gvwList.Rows)
        {
            CheckBox chb = (CheckBox)row.Cells[1].Controls[1];
            if (chb.Checked)
            {
                DeleteDataGroup(gvwList.DataKeys[row.RowIndex][0].ToString());
            }
        }

        BindDataGroup();
    }

    protected void btnSearchGroup_Click(object sender, EventArgs e)
    {
        BindDataGroup();
    }

    protected override void SelectedIndexChanged(object sender, EventArgs e)
    {
        base.SelectedIndexChanged(sender, e);
        Response.Redirect("masterphotogroup.aspx?action=edit&code=" + gvwList.SelectedDataKey[0].ToString());
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
