using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iConsole.DataAccessLayer;
using MPF23.XUI.Control;

public partial class module_collection_collectionmainlist : BasePageList
{
    private static string TABLE_NAME = "COLLECTION_MAIN";
    private static string FILTER_STATUS = "All";
    private static string FILTER_RESULT = "All";

    protected void Page_Init(object sender, EventArgs e)
    {
        PAGE_LIST = "COLLECTION_MAIN";
        NEXT_PAGE = "collectionmainlist.aspx";
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();

        if (!Page.IsPostBack)
        {
            if (Request.Params["filter_status"] != null)
                FILTER_STATUS = Request.Params["filter_status"].ToString();
            else
                FILTER_STATUS = "All";

            if (Request.Params["filter_result"] != null)
                FILTER_RESULT = Request.Params["filter_result"].ToString();
            else
                FILTER_RESULT = "All";

            ddlFilterStatus.SelectedValue = FILTER_STATUS;
            dllFilterResult.SelectedValue = FILTER_RESULT;

            ddlFilterResult_Init();

            BindDataColletion();
        }
        else
        {
            FILTER_STATUS = ddlFilterStatus.SelectedValue;
            FILTER_RESULT = dllFilterResult.SelectedValue;
        }
    }

    private void BindDataColletion()
    {
        GeneralDAL _dal = null;
        Hashtable _ht = null;
        
        FILTER_STATUS = Request.Params["param"].ToString();
        if (FILTER_STATUS == "All" || FILTER_STATUS == "1")
        {
            lblFilterConsole.Visible = false;
            ddlFilterStatus.Visible = false;
        }
        else if (FILTER_STATUS == "2" || FILTER_STATUS == "3" || FILTER_STATUS == "4")
        {
            lblFilterConsole.Visible = false;
            ddlFilterStatus.Visible = false;

            lblFilterResult.Visible = true;
            dllFilterResult.Visible = true;
        }

        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            _ht["p_keywords"] = txtSearch.Text;
            _ht["p_console_status"] = FILTER_STATUS;
            _ht["p_result_status"] = FILTER_RESULT;

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

    protected void gvwListCollection_PageIndexChanging(object sender, GridViewPageEventArgs e)
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
        Response.Redirect(string.Format("collectionmain.aspx?action=edit&trx_no={0}&filter_status={1}&filter_result={2}", gvwList.SelectedDataKey[0].ToString(), FILTER_STATUS, FILTER_RESULT));
    }

    protected void chbCheckedAll_CheckedChanged(object sender, EventArgs e)
    {
        foreach (GridViewRow gvr in gvwList.Rows)
        {
            CheckBox cbSelect = gvr.FindControl("chbChecked") as CheckBox;
            cbSelect.Checked = ((CheckBox)sender).Checked;
        }
    }

    protected void ddlFilterStatus_Changed(object sender, EventArgs e)
    {
        XUIDropDownList ddl = (XUIDropDownList)sender;
        FILTER_STATUS = ddlFilterStatus.SelectedValue;
        ddlFilterResult_Init();
        BindDataColletion();
    }

    protected void ddlFilterResult_Changed(object sender, EventArgs e)
    {
        XUIDropDownList ddl = (XUIDropDownList)sender;
        FILTER_RESULT = dllFilterResult.SelectedValue;
        BindDataColletion();
    }

    protected void ddlFilterResult_Init()
    {
        if (FILTER_STATUS == "All" || FILTER_STATUS == "1")
        {
            FILTER_RESULT = "All";
            FILTER_RESULT = dllFilterResult.SelectedValue;
            dllFilterResult.Visible = false;
            lblFilterResult.Visible = false;
        }
        else
        {
            dllFilterResult.Visible = true;
            lblFilterResult.Visible = true;
        }
    }
}