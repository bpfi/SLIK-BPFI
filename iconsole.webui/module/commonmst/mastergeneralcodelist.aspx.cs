using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iConsole.DataAccessLayer;

public partial class module_commonmst_mastergeneralcodelist : BasePageList
{
    private static string TABLE_NAME = "MASTER_GENERAL_CODE";

    protected void Page_Init(object sender, EventArgs e)
    {
        PAGE_LIST = "MASTER_GENERAL_CODE";
        NEXT_PAGE = "mastergeneralcode.aspx";
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();

        if (!Page.IsPostBack)
        {
            BindDataGeneralCode();
            btnDeleteGeneralCode.OnClientClick = "return confirm('Delete selected data?');";
        }
    }

    private void BindDataGeneralCode()
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

    private void DeleteDataGeneralCode(string generalcodecode)
    {
        GeneralDAL _dal = null;
        Hashtable _ht = null;

        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            _ht["p_code"] = generalcodecode;

            _dal.Delete(TABLE_NAME, _ht);
        }
        catch (Exception ex)
        {
            Shared.ShowErrorDialog(this, ex);
        }
    }

    protected void gvwListGeneralCode_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwList.PageIndex = e.NewPageIndex;
        BindDataGeneralCode();
    }

    protected void btnAddGeneralCode_Click(object sender, EventArgs e)
    {
        Response.Redirect("mastergeneralcode.aspx?action=add");
    }

    protected void btnDeleteGeneralCode_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in gvwList.Rows)
        {
            CheckBox chb = (CheckBox)row.Cells[1].Controls[1];
            if (chb.Checked)
            {
                DeleteDataGeneralCode(gvwList.DataKeys[row.RowIndex][0].ToString());
            }
        }

        BindDataGeneralCode();
    }

    protected void btnSearchGeneralCode_Click(object sender, EventArgs e)
    {
        BindDataGeneralCode();
    }

    protected override void SelectedIndexChanged(object sender, EventArgs e)
    {
        base.SelectedIndexChanged(sender, e);
        Response.Redirect("mastergeneralcode.aspx?action=edit&code=" + gvwList.SelectedDataKey[0].ToString());
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