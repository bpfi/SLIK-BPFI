using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iConsole.DataAccessLayer;
using System.Collections;
using MPF23.XUI.Control;
using System.Data;

public partial class module_location_locationuser : BasePageList
{
    //private static string TABLE_NAME = "MASTER_USER_MAIN";
    private static string FILTER_POSITION = "ALL";
    private DataTable _dt = null;

    protected void Page_Init(object sender, EventArgs e)
    {
        PAGE_LIST = "LOCATIONUSERLIST";
        NEXT_PAGE = "locationuserlist.aspx";
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();

        if (!Page.IsPostBack)
        {
            if (Request.Params["FILTER_POSITION"] != null)
                FILTER_POSITION = Request.Params["FILTER_POSITION"].ToString();
            else
                FILTER_POSITION = "All";

            ddlFilterPosition.SelectedValue = FILTER_POSITION;

            BindLocationUserList();
        }
        else
        {
            FILTER_POSITION = ddlFilterPosition.SelectedValue;
        }
    }

    private void BindLocationUserList()
    {
        GeneralDAL _dal = null;
        Hashtable _ht = null;

        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            _ht["p_keywords"] = txtSearch.Text;
            _ht["p_position"] = FILTER_POSITION;

            _dt = _dal.GetRows("", "xsp_master_user_main_getrows_position", _ht);

            gvwList.DataSource = _dt;
            gvwList.DataBind();

            //gvwListLocationUser.DataSource = _dal.GetRows(TABLE_NAME, _ht);
            //gvwListLocationUser.DataBind();
        }
        catch (Exception ex)
        {
            Shared.ShowErrorDialog(this, ex);
        }
    }

    protected void btnSearchLocationUser_Click(object sender, EventArgs e)
    {
        BindLocationUserList();
    }

    protected void gvwListLocationUser_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwList.PageIndex = e.NewPageIndex;
        BindLocationUserList();
    }

    protected override void SelectedIndexChanged(object sender, EventArgs e)
    {
        base.SelectedIndexChanged(sender, e);
        Response.Redirect(string.Format("locationuserinfo.aspx?action=edit&emp_code={0}&emp_name={1}", gvwList.SelectedDataKey[0], gvwList.SelectedDataKey[1]));
    }

    protected void ddlFilterPosisi_Changed(object sender, EventArgs e)
    {
        XUIDropDownList ddl = (XUIDropDownList)sender;
        FILTER_POSITION = ddlFilterPosition.SelectedValue;
        BindLocationUserList();
    }
}