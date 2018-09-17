using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iConsole.DataAccessLayer;
using System.Collections;
using System.Data;

public partial class module_location_locationcurrentlylist : BasePage
{
    public string BASE_URL = "";
 
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();

        if (!Page.IsPostBack)
        {
            BASE_URL = Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/');
            BindData();
        }
    }

    protected void btnRefresh_Click(object sender, EventArgs e)
    {
        BindData();
    } 

    private void BindData()
    {
        GeneralDAL _dal = null;
        Hashtable _ht = null;

        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            _ht["p_keywords"] = "";
            _ht["p_position"] = ddlPosition.SelectedValue;

            rptMarkers.DataSource = _dal.GetRows("", "xsp_employee_geotag_log_getrows_by_position", _ht);
            rptMarkers.DataBind();
        }
        catch (Exception ex)
        {
            Shared.ShowErrorDialog(this, ex);
        }
    }

}