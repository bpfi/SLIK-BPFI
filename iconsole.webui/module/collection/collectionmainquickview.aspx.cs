using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iConsole.DataAccessLayer;
using MPF23.XUI.Control;
using System.Data;
using System.Drawing;

public partial class module_collection_collectionmainquickview : BasePageList
{
    private static string TABLE_NAME = "COLLECTION_MAIN";
    public string TotalCollection;
    public string TotalAmount;
    public string RestOfTheBill;
    public string Collector;
    private string Status = "New";
    private decimal dItemTotal = 0;

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
            BindDataQuickView();
            Shared.BindingQuickView(ddlCollector);
            Add_Item();
        }
        else
        {
        }
    }

    protected void Add_Item() 
    {
        ddlCollector.Items.Add("All");
        ddlCollector.Text = "All";
    }

    private void BindDataQuickView()
    {
        GeneralDAL _dal = null;
        Hashtable _ht = null;
        //System.Diagnostics.Debugger.Break();
        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            if (Status == "New")
                Collector = "All";

            _ht["p_keywords"] = Collector;

            DataTable dtQuickView = _dal.GetRows("", "xsp_collection_main_quickview", _ht);

            double CountA = 0, CountB = 0, Total = 0;

            foreach (DataRow drItem in dtQuickView.Rows)
            {
                CountA = CountA + Convert.ToDouble(drItem["total_collection"].ToString());
                CountB = CountB + Convert.ToDouble(TotalAmount = drItem["payment_amount"].ToString());
                
                Total = CountA - CountB;
            }
            
            TotalCollection = "Rp. " + CountA.ToString("n0") + ".00";
            TotalAmount = "Rp. " + CountB.ToString("n0") + ".00";
            RestOfTheBill = "Rp. " + Total.ToString("n0") + ".00";

            BindingCollection();
        }
        catch (Exception ex)
        {
            Shared.ShowErrorDialog(this, ex);
        }
    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        Status = "New";
        BindDataQuickView();
        Add_Item();
    }

    protected void gvwListItem_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwList.PageIndex = e.NewPageIndex;
        BindingCollection();
    }

    protected void gvwListItem_SelectedIndexChanged(object sender, EventArgs e)
    {
        //Response.Redirect(string.Format("collectionitem.aspx?action=edit&trx_no={0}&trx_code={1}", lblTrxNo.Text, gvwListItem.SelectedDataKey[1].ToString()));
    }

    private void BindingCollection()
    {
        GeneralDAL _dal = null;
        Hashtable _ht = null;
        //System.Diagnostics.Debugger.Break();
        if (Status == "New")
            Collector = "All";

        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            _ht["p_keywords"] = Collector;
           // _ht["p_collector_code"] = Collector;

            gvwList.DataSource = _dal.GetRows("", "xsp_collection_main_quickview", _ht);
            gvwList.DataBind();
        }
        catch (Exception ex)
        {
            Shared.ShowErrorDialog(this, ex);
        }
        finally 
        {
            Status = "New";
        }
    }

    protected void gvwListCollection_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwList.PageIndex = e.NewPageIndex;
        BindDataQuickView();
    }

    protected void gvwList_OnRowDataBound(object sender, GridViewRowEventArgs e)
    {
      
    }

    protected void ddlCollector_Changed(object sender, EventArgs e)
    {
        Collector = ddlCollector.SelectedValue;
        Status = "Selected";
        BindDataQuickView();
    }
}