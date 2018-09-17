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

public partial class module_collection_collectionmain : BasePage
{
    private static string TABLE_NAME_MAIN = "COLLECTION_MAIN";
    private static string TABLE_NAME_ITEM = "COLLECTION_ITEM";
    private static string TABLE_NAME_RESULTS = "COLLECTION_RESULTS";
    private decimal dItemTotal = 0;

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
            if (Request.Params["action"].Equals("edit"))
            {
                LoadDataCollection();
                BindItem();
                BindResults();

                lblTrxNo.Enabled = false;
                //txtLastLoginDate.Enabled = false;
                btnCollectionCancel.Text = "<i class='icon-remove'></i>Back";
            }
            else
            {
                lblAgreemmentNo.Text = "0";
            }
        }
    }

    private void LoadDataCollection()
    {
        GeneralDAL _dal = null;
        Hashtable _ht = null;

        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            _ht["p_trx_no"] = Request.Params["trx_no"];

            DataRow _dr = _dal.GetRow(TABLE_NAME_MAIN, _ht);

            IS_PICKED_DEVICE = _dr.ItemArray[14].ToString();
            IS_SYNC_DEVICE = _dr.ItemArray[15].ToString();
            IS_SYNC_PRODUCTION = _dr.ItemArray[16].ToString();
            From_Production = _dr.ItemArray[19].ToString();
            Picked_Device = _dr.ItemArray[20].ToString();
            Sync_Device = _dr.ItemArray[21].ToString();
            Sync_Production = _dr.ItemArray[22].ToString();

            DBToUI.Map(this.Controls, _dr);
        }
        catch (Exception ex)
        {
            Shared.ShowErrorDialog(this, ex);
        }
    }

    private void SaveDataCollection()
    {
        GeneralDAL _dal = null;
        Hashtable _ht = null;

        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            MPF23.Shared.Mapper.UIToDB.Map(this.Controls, _ht);
            Shared.ApplyDefaultProp(_ht);

            _ht["p_trx_no"] = lblTrxNo.Text;

            Shared.ApplyDefaultProp(_ht);

            if (Request.Params["action"].Equals("add"))
            {
                _dal.Insert(TABLE_NAME_MAIN, _ht);
            }

            else
                _dal.Update(TABLE_NAME_MAIN, _ht);

            Shared.ShowSuccessGritter(this, string.Format("collectionmain.aspx?action=edit&trxNo={0}", lblTrxNo.Text));
        }
        catch (Exception ex)
        {
            Shared.ShowErrorDialog(this, ex);
        }
    }

    protected void btnCollectionSave_Click(object sender, EventArgs e)
    {
        SaveDataCollection();
    }

    protected void btnCollectionCancel_Click(object sender, EventArgs e)
    {
        if(Request.Params["action"].Equals("edit"))
            Response.Redirect(string.Format("collectionmainlist.aspx?filter_status={0}&filter_result={1}", Request.Params["filter_status"], Request.Params["filter_result"]));
        else
            Response.Redirect(string.Format("collectionmainlist.aspx"));
    }

    #region Collection Item

        private void BindItem()
        {
            GeneralDAL _dal = null;
            Hashtable _ht = null;

            try
            {
                _dal = new GeneralDAL();
                _ht = new Hashtable();

                _ht["p_keywords"] = txtSearchItem.Text;
                _ht["p_trx_no"] = lblTrxNo.Text;
                gvwListItem.DataSource = _dal.GetRows(TABLE_NAME_ITEM, _ht);
                gvwListItem.DataBind();
            }
            catch (Exception ex)
            {
                Shared.ShowErrorDialog(this, ex);
            }
        }
        
        protected void btnSearchItem_Click(object sender, EventArgs e)
        {
            if (Request.Params["action"].Equals("edit"))
                BindItem();
        }

        private void DeleteDataItem(string trx_no)
        {
            GeneralDAL _dal = null;
            Hashtable _ht = null;

            try
            {
                _dal = new GeneralDAL();
                _ht = new Hashtable();

                _ht["p_trx_no"] = trx_no;

                _dal.Delete(TABLE_NAME_ITEM, _ht);
            }
            catch (Exception ex)
            {
                Shared.ShowErrorDialog(this, ex);
            }
        }

        protected void btnDeleteItem_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in gvwListItem.Rows)
            {
                CheckBox chb = (CheckBox)row.Cells[1].Controls[1];
                if (chb.Checked)
                {
                    DeleteDataItem(gvwListItem.DataKeys[row.RowIndex][0].ToString());
                }
            }

            BindItem();
        }

        protected void btnAddItem_Click(object sender, EventArgs e)
        {
            Response.Redirect("collectionitem.aspx?action=add&trx_no=" + lblTrxNo.Text);
        }

        protected void gvwListItem_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvwListItem.PageIndex = e.NewPageIndex;
            BindItem();
        }

        protected void gvwListItem_OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                dItemTotal = dItemTotal + decimal.Parse(e.Row.Cells[4].Text);
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[3].Text = "Total";
                e.Row.Cells[3].HorizontalAlign = HorizontalAlign.Left;
                e.Row.Cells[4].Text = dItemTotal.ToString("N2");
            }
        }

        protected void gvwListItem_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect(string.Format("collectionitem.aspx?action=edit&trx_no={0}&trx_code={1}", lblTrxNo.Text, gvwListItem.SelectedDataKey[1].ToString()));
        }

    #endregion

    #region Collection Results

        private void BindResults()
        {
            GeneralDAL _dal = null;
            Hashtable _ht = null;

            try
            {
                _dal = new GeneralDAL();
                _ht = new Hashtable();

                _ht["p_keywords"] = txtResultsSearch.Text;
                _ht["p_trx_no"] = lblTrxNo.Text;
                gvwResults.DataSource = _dal.GetRows(TABLE_NAME_RESULTS, _ht);
                gvwResults.DataBind();
            }
            catch (Exception ex)
            {
                Shared.ShowErrorDialog(this, ex);
            }
        }

        protected void btnSearchResults_Click(object sender, EventArgs e)
        {
            if (Request.Params["action"].Equals("edit"))
                BindResults();
        }

        protected void gvwResults_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvwResults.PageIndex = e.NewPageIndex;
            BindResults();
        }
        
        protected void gvwResults_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect(string.Format("collectionresults.aspx?action=edit&id={0}&trx_no={1}&filter_status={2}&filter_result={3}", gvwResults.SelectedDataKey[0].ToString() , Request.Params["trx_no"] , Request.Params["filter_status"], Request.Params["filter_result"]));
        }

        protected void btnAddResults_Click(object sender, EventArgs e)
        {
            Response.Redirect("collectionresults.aspx?action=add&trx_no=" + lblTrxNo.Text);
        }

        protected void btnDeleteResults_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in gvwResults.Rows)
            {
                CheckBox chb = (CheckBox)row.Cells[1].Controls[1];
                if (chb.Checked)
                {
                    DeleteDataResults(gvwResults.DataKeys[row.RowIndex][0].ToString());
                }
            }

            BindResults();
        }

        private void DeleteDataResults(string id)
        {
            GeneralDAL _dal = null;
            Hashtable _ht = null;

            try
            {
                _dal = new GeneralDAL();
                _ht = new Hashtable();

                _ht["p_id"] = int.Parse(id);

                _dal.Delete(TABLE_NAME_RESULTS, _ht);
            }
            catch (Exception ex)
            {
                Shared.ShowErrorDialog(this, ex);
            }
        }

        protected void imgBtnViewImage_Click(object sender, EventArgs e)
        {
            ImageButton imgBtn = (ImageButton)sender;
            GridViewRow row = (GridViewRow)imgBtn.Parent.Parent;
            Response.Redirect(string.Format("viewimage.aspx?result_id={0}&trx_no={1}&action={2}&filter_status={3}&filter_result={4}", gvwResults.DataKeys[row.RowIndex][0], Request.Params["trx_no"], Request.Params["action"], Request.Params["filter_status"], Request.Params["filter_result"]));
        }

        protected void imgBtnPlayVideo_Click(object sender, EventArgs e)
        {
            ImageButton imgBtn = (ImageButton)sender;
            GridViewRow row = (GridViewRow)imgBtn.Parent.Parent;
            Response.Redirect(string.Format("playvideo.aspx?result_id={0}&trx_no={1}&action={2}&filter_status={3}&filter_result={4}", gvwResults.DataKeys[row.RowIndex][0], Request.Params["trx_no"], Request.Params["action"], Request.Params["filter_status"], Request.Params["filter_result"]));
        }

    #endregion
}
