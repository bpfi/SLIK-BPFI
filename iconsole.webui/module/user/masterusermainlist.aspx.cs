using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iConsole.DataAccessLayer;

public partial class module_user_masterusermainlist : BasePageList
{
    private static string TABLE_NAME = "MASTER_USER_MAIN";

    protected void Page_Init(object sender, EventArgs e)
    {
        PAGE_LIST = "MASTER_USER_MAIN";
        NEXT_PAGE = "masterusermain.aspx";
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();

        if (!Page.IsPostBack)
        {
            BindDataUser();
        }
    }

    private void BindDataUser()
    {
        GeneralDAL _dal = null;
        Hashtable _ht = null;

        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            _ht["p_keywords"] = txtSearch.Text;

            gvwListUser.DataSource = _dal.GetRows(TABLE_NAME, _ht);
            gvwListUser.DataBind();
        }
        catch (Exception ex)
        {
            Shared.ShowErrorDialog(this, ex);
        }
    }

    private void DeleteDataUser(string id)
    {
        GeneralDAL _dal = null;
        Hashtable _ht = null;

        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            _ht["p_id"] = id;

            _dal.Delete(TABLE_NAME, _ht);
        }
        catch (Exception ex)
        {
            Shared.ShowErrorDialog(this, ex);
        }
    }

    protected void gvwListUser_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwListUser.PageIndex = e.NewPageIndex;
        BindDataUser();
    }

    protected void btnSearchUser_Click(object sender, EventArgs e)
    {
        BindDataUser();
    }

    protected override void SelectedIndexChanged(object sender, EventArgs e)
    {
        base.SelectedIndexChanged(sender, e);
        Response.Redirect("masterusermain.aspx?action=edit&id=" + gvwListUser.SelectedDataKey[0].ToString());
    }

    protected void chbCheckedAll_CheckedChanged(object sender, EventArgs e)
    {
        foreach (GridViewRow gvr in gvwListUser.Rows)
        {
            CheckBox cbSelect = gvr.FindControl("chbChecked") as CheckBox;
            cbSelect.Checked = ((CheckBox)sender).Checked;
        }
    }
}
