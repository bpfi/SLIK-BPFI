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
    private DataTable _dt = null;
    public string VIDEO_URL;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindData();
            if (_dt.Rows.Count == 1)
            {
                lblResultView.Text = _dt.Rows[0][1].ToString() + " ( " + _dt.Rows[0][3].ToString() + " )";
                string baseUrl = Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/');
                VIDEO_URL = string.Format("{0}/{1}/{2}/{3}", baseUrl , System.Configuration.ConfigurationSettings.AppSettings["CollectionResultsLink"], _dt.Rows[0][1].ToString().Replace("/", "-"), _dt.Rows[0][8].ToString());
            }
        }
    }

    private void BindData()
    {
        GeneralDAL _dal = null;
        Hashtable _ht = null;

        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            _ht["p_id"] = Request.Params["result_id"];

            _dt = _dal.GetRows("", "xsp_collection_results_getrow_attachment", _ht);

            attachment.DataSource = _dt;
            attachment.DataBind();
        }
        catch (Exception ex)
        {
            Shared.ShowErrorDialog(this, ex);
        }
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect(string.Format("collectionmain.aspx?trx_no={0}&action={1}&filter_status={2}&filter_result={3}", Request.Params["trx_no"], Request.Params["action"], Request.Params["filter_status"], Request.Params["filter_result"]));
    }

}