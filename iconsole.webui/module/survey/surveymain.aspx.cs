using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iConsole.DataAccessLayer;
using MPF23.Shared.Mapper;

public partial class module_survey_surveymain : BasePage
{
    private static string TABLE_NAME = "SURVEY_MAIN";
    private static string TABLE_NAME_SURVEY = "SURVEY_PHOTO";
    private static string TABLE_NAME_QUESTION = "SURVEY_QUESTION_ANSWER";
    private static string TABLE_NAME_ADDITIONAL = "SURVEY_QUESTION_ADDITIONAL_ANSWER";

    public string IS_PICKED_DEVICE = "0";
    public string IS_SYNC_DEVICE = "0";
    public string IS_SYNC_PRODUCTION = "0";
    public string From_Production;
    public string Picked_Device;
    public string Sync_Device;
    public string Sync_Production;

    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();

        if (!Page.IsPostBack)
        {
            lblTrxNo.Text = Request.Params["trx_no"];
           
            if (Request.Params["action"].Equals("edit"))
            {
                LoadData();

                BindSurveyPhoto();
                BindQuestion();
                BindAdditional();

                lblTrxNo.Enabled = false;
                btnCancel.Text = "<i class='icon-remove'></i>Back";
            }
        }
    }

    private void LoadData()
    {
        GeneralDAL _dal = null;
        Hashtable _ht = null;
        //System.Diagnostics.Debugger.Break();
        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            _ht["p_trx_no"] = Request.Params["trx_no"];
            DataRow _dr = _dal.GetRow(TABLE_NAME, _ht);

            IS_PICKED_DEVICE = _dr.ItemArray[12].ToString();
            IS_SYNC_DEVICE = _dr.ItemArray[13].ToString();
            IS_SYNC_PRODUCTION = _dr.ItemArray[14].ToString();
            From_Production = _dr.ItemArray[18].ToString();
            Picked_Device = _dr.ItemArray[19].ToString();
            Sync_Device = _dr.ItemArray[20].ToString();
            Sync_Production = _dr.ItemArray[21].ToString();

            DBToUI.Map(this.Controls, _dr);
        }
        catch (Exception ex)
        {
            Shared.ShowErrorDialog(this, ex);
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect(string.Format("surveymainlist.aspx"));
    }

    #region Survey Photo

        private void BindSurveyPhoto()
        {
            GeneralDAL _dal = null;
            Hashtable _ht = null;

            try
            {
                _dal = new GeneralDAL();
                _ht = new Hashtable();

                _ht["p_keywords"] = txtSearchSurveyPhoto.Text;
                _ht["p_trx_no"] = lblTrxNo.Text;
                gvwListSurveyPhoto.DataSource = _dal.GetRows(TABLE_NAME_SURVEY, _ht);
                gvwListSurveyPhoto.DataBind();
            }
            catch (Exception ex)
            {
                Shared.ShowErrorDialog(this, ex);
            }
        }

        protected void btnSearchSurveyPhoto_Click(object sender, EventArgs e)
        {
            if (Request.Params["action"].Equals("edit"))
                BindSurveyPhoto();
        }

        protected void gvwListSurveyPhoto_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvwListSurveyPhoto.PageIndex = e.NewPageIndex;
            BindSurveyPhoto();
        }

        protected void gvwListSurveyPhoto_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect(string.Format("surveyphoto.aspx?action=edit&trx_no={0}&id={1}", lblTrxNo.Text, gvwListSurveyPhoto.SelectedDataKey[0].ToString()));
        }

        protected void chbCheckedAll_CheckedChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow gvr in gvwListSurveyPhoto.Rows)
            {
                CheckBox cbSelect = gvr.FindControl("chbChecked") as CheckBox;
                cbSelect.Checked = ((CheckBox)sender).Checked;
            }
        }

        protected void imgBtnViewImage_Click(object sender, EventArgs e)
        {
            ImageButton imgBtn = (ImageButton)sender;
            GridViewRow row = (GridViewRow)imgBtn.Parent.Parent;
            Response.Redirect(string.Format("viewimage.aspx?photo_id={0}&trx_no={1}&action={2}", gvwListSurveyPhoto.DataKeys[row.RowIndex][0], Request.Params["trx_no"], Request.Params["action"]));
        }
        
    #endregion

    #region Question
        private void BindQuestion()
        {
            GeneralDAL _dal = null;
            Hashtable _ht = null;

            try
            {
                _dal = new GeneralDAL();
                _ht = new Hashtable();

                _ht["p_keywords"] = txtQuestionSearch.Text;
                _ht["p_trx_no"] = lblTrxNo.Text;
                gvwQuestion.DataSource = _dal.GetRows(TABLE_NAME_QUESTION, _ht);
                gvwQuestion.DataBind();
            }
            catch (Exception ex)
            {
                Shared.ShowErrorDialog(this, ex);
            }
        }

        protected void gvwQuestion_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvwQuestion.PageIndex = e.NewPageIndex;
            BindQuestion();
        }

        protected void btnSearchQuestion_Click(object sender, EventArgs e)
        {
            if (Request.Params["action"].Equals("edit"))
                BindQuestion();
        }        

        protected void gvwQuestion_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Response.Redirect(string.Format("collectionresults.aspx?action=edit&id={0}&trx_no={1}&filter_status={2}&filter_result={3}", gvwResults.SelectedDataKey[0].ToString(), Request.Params["trx_no"], Request.Params["filter_status"], Request.Params["filter_result"]));
        }
    #endregion

    #region Additional

        private void BindAdditional()
        {
            GeneralDAL _dal = null;
            Hashtable _ht = null;

            try
            {
                _dal = new GeneralDAL();
                _ht = new Hashtable();

                _ht["p_keywords"] = txtSearchAdditional.Text;
                _ht["p_trx_no"] = lblTrxNo.Text;

                gvwQuestionAdditional.DataSource = _dal.GetRows(TABLE_NAME_ADDITIONAL, _ht);
                gvwQuestionAdditional.DataBind();
            }
            catch (Exception ex)
            {
                Shared.ShowErrorDialog(this, ex);
            }
        }

        protected void btnSearchQuestionAdditional_Click(object sender, EventArgs e)
        {
            if (Request.Params["action"].Equals("edit"))
                BindAdditional();
        }  

        protected void gvwQuestionAdditional_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvwQuestionAdditional.PageIndex = e.NewPageIndex;
            BindAdditional();
        }

        protected void gvwQuestionAdditional_SelectedIndexChanged(object sender, EventArgs e)
        {
         //   Response.Redirect(string.Format("collectionresults.aspx?action=edit&id={0}&trx_no={1}&filter_status={2}&filter_result={3}", gvwResults.SelectedDataKey[0].ToString(), Request.Params["trx_no"], Request.Params["filter_status"], Request.Params["filter_result"]));
        }

    #endregion 
}
