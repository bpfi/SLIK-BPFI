using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iConsole.DataAccessLayer;
using System.Collections;

using System.Data;
using MPF23.Shared.Mapper;


public partial class module_location_locationuserinfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            txtStartDate.Text = DateTime.Today.AddMonths(-3).ToString("dd/MM/yyyy");
            txtEndDate.Text = DateTime.Today.ToString("dd/MM/yyyy");
            lblUserName.Text = Request.Params["emp_name"];
            BindData();
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("locationuserinfolist.aspx");
    }

    protected void btnRefresh_Click(object sender, EventArgs e)
    {
        BindData();
    }


    private void BindData()
    {
        GeneralDAL _dal = null;
        Hashtable _ht = null;

        DataTable _dt = null;

        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            _ht["p_keywords"] = "";
            _ht["p_emp_code"] = Request.Params["emp_code"];
            _ht["p_start_date"] = Shared.ConvertToDateTime(txtStartDate.Text);
            _ht["p_end_date"] = Shared.ConvertToDateTime(txtEndDate.Text);

            _dt = _dal.GetRows("", "xsp_employee_geotag_log_getrows_sort_by_date", _ht);

            rptMarkers.DataSource = _dt;
            rptMarkers.DataBind();
        }
        catch (Exception ex)
        {
            Shared.ShowErrorDialog(this, ex);
        }
    }
}
