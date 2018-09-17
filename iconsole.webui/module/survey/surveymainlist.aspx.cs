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
using MPF23.XUI.Control;

public partial class module_survey_surveymainlist : BasePageList
{
    private static string TABLE_NAME = "SURVEY_MAIN";
    private static string FILTER_STATUS = "All";
    private static string FILTER_SURVEY = "All";

    protected void Page_Init(object sender, EventArgs e)
    {
        PAGE_LIST = "SURVEY_MAIN";
        NEXT_PAGE = "surveymain.aspx";
    }

    protected void ddlFilterStatus_Changed(object sender, EventArgs e)
    {
        XUIDropDownList ddl = (XUIDropDownList)sender;
        FILTER_STATUS = ddlFilterStatus.SelectedValue;
        ddlFilterSurvey_Init();
        BindDataSurveyMain();
    }

    protected void ddlFilterSurvey_Changed(object sender, EventArgs e)
    {
        XUIDropDownList ddl = (XUIDropDownList)sender;
        FILTER_SURVEY = dllFilterSurvey.SelectedValue;
        BindDataSurveyMain();
    }

    protected void ddlFilterSurvey_Init()
    {
        if (FILTER_STATUS == "All" || FILTER_STATUS == "1")
        {
            FILTER_SURVEY = "All";
            FILTER_SURVEY = dllFilterSurvey.SelectedValue;
            dllFilterSurvey.Visible = false;
            lblFilterSurvey.Visible = false;   
        }
        else
        {
            dllFilterSurvey.Visible = true;
            lblFilterSurvey.Visible = true; 
        }
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

            if (Request.Params["filter_survey"] != null)
                FILTER_SURVEY = Request.Params["filter_survey"].ToString();
            else
                FILTER_SURVEY = "All";

            //System.Diagnostics.Debugger.Break();
            ddlFilterStatus.SelectedValue = FILTER_STATUS;
            dllFilterSurvey.SelectedValue = FILTER_SURVEY;

            ddlFilterSurvey_Init();

            BindDataSurveyMain();
        }
        else
        {
            FILTER_STATUS = ddlFilterStatus.SelectedValue;
            FILTER_SURVEY = dllFilterSurvey.SelectedValue;
        }
    }

    private void BindDataSurveyMain()
    {
        GeneralDAL _dal = null;
        Hashtable _ht = null;

        FILTER_STATUS = Request.Params["param"].ToString();
        if (FILTER_STATUS == "All" || FILTER_STATUS == "1")
        {
            ddlFilterStatus.Visible = false;
            lblFilterConsole.Visible = false;
        }
        else if (FILTER_STATUS == "2" || FILTER_STATUS == "3" || FILTER_STATUS == "4")
        {
            ddlFilterStatus.Visible = false;
            lblFilterConsole.Visible = false;

            lblFilterSurvey.Visible = true;
            dllFilterSurvey.Visible = true;
        }                                           

        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            _ht["p_keywords"] = txtSearch.Text;
            _ht["p_console_status"] = FILTER_STATUS;
            _ht["p_survey_status"] = FILTER_SURVEY;
            
            gvwList.DataSource = _dal.GetRows(TABLE_NAME, _ht);
            gvwList.DataBind();
        }
        catch (Exception ex)
        {
            Shared.ShowErrorDialog(this, ex);
        }
    }

    protected void gvwListSurveyMain_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwList.PageIndex = e.NewPageIndex;
        BindDataSurveyMain();
    }

    protected void btnSearchSurveyMain_Click(object sender, EventArgs e)
    {
        BindDataSurveyMain();
    }

    protected override void SelectedIndexChanged(object sender, EventArgs e)
    {
        base.SelectedIndexChanged(sender, e);
        Response.Redirect("surveymain.aspx?action=edit&trx_no=" + gvwList.SelectedDataKey[0].ToString());
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
