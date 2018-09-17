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
    private string TRX_NO;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindData();
            if (_dt.Rows.Count == 1)
            {
                TRX_NO = _dt.Rows[0][2].ToString();
                lblRemark.Text = _dt.Rows[0][7].ToString();
                lblPhotoView.Text = _dt.Rows[0][2].ToString() + " ( " + _dt.Rows[0][6].ToString() + " )";
                string baseUrl = Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/');
                string PathAttachment = string.Format("{0}/{1}/{2}/{3}", baseUrl, System.Configuration.ConfigurationSettings.AppSettings["SurveyPhotoLink"], _dt.Rows[0][2].ToString().Replace("/", "-"), _dt.Rows[0][3].ToString());
                viewImage.ImageUrl = PathAttachment;
                viewImage.DataBind();
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

            _ht["p_id"] = Request.Params["photo_id"];

            _dt = _dal.GetRows("", "xsp_survey_photo_getrow", _ht);

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
        Response.Redirect(string.Format("surveymain.aspx?trx_no={0}&action={1}", Request.Params["trx_no"], Request.Params["action"]));
    }
}