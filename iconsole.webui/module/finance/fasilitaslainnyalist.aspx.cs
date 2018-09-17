using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using iConsole.DataAccessLayer;
using iConsole.DataAccessLayer.ApiServices;
using iConsole.DataAccessLayer.Services.Control;
using iConsole.DataAccessLayer.Services.Entity;

public partial class module_debitur_fasilitaslainnyalist : BasePageList
{
    private static string TABLE_NAME = "FASILITAS_LAINNYA";
    private static string TABLE_NAME_HEADER = "HEADER";
    private string SEGMENT = "F06";
    private Services cv = new Services();
    private F06Controller dc = new F06Controller();

    protected void Page_Init(object sender, EventArgs e)
    {
        PAGE_LIST = "FASILITAS_LAINNYA";
        NEXT_PAGE = "fasilitaslainnyalist.aspx";
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();
        btnLookupSinkron.Attributes["href"] = String.Format("javascript:fnShowDialog('../../lookup/genericsinkronisasi.aspx?code={0}&table={1}');", SEGMENT, TABLE_NAME);
        btnUpload.Attributes["href"] = String.Format("javascript:fnShowDialog('../../lookup/genericupload.aspx?code={0}&table={1}');", SEGMENT, TABLE_NAME);

        if (!Page.IsPostBack)
        {
            for (int i = 1; i <= 12; i++)
            {
                ddlBulan.Items.Add(i.ToString());
            }

            for (int i = 2000; i <= 3000; i++)
            {
                ddlTahun.Items.Add(i.ToString());
            }

            ddlTahun.Text = "2018";
            BindData("all");
        }
    }

    private void BindData(string filter)
    {
        GeneralDAL _dal = null;
        Hashtable _ht = null;

        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            if (ddlBulan.SelectedItem.Value != "0" && ddlTahun.SelectedItem.Value != "0")
            {
                _ht["p_mount"] = ddlBulan.SelectedItem.Value;
                _ht["p_year"] = ddlTahun.SelectedItem.Value;
            }
            else
            {
                _ht["p_mount"] = "";
                _ht["p_year"] = "";
            }

            _ht["p_keywords"] = txtSearch.Text;
            _ht["p_status"] = ddlStatus.SelectedItem.Value;
            _ht["p_filter"] = filter;

            gvwList.DataSource = _dal.GetRows(TABLE_NAME, _ht);
            gvwList.DataBind();
        }
        catch (Exception ex)
        {
            Shared.ShowErrorDialog(this, ex);
        }
    }

    protected void gvwList_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwList.PageIndex = e.NewPageIndex;
        BindData("all");
    }

    protected void btnExport_Click(object sender, EventArgs e)
    {
        if (ddlStatus.SelectedItem.Value == "Select Value" || ddlBulan.SelectedItem.Value == "0" || ddlTahun.SelectedItem.Value == "0")
        {
            Shared.ShowErrorMessage(this, "Bulan, Status dan tahun tidak boleh null");
            return;
        }

        DataTable _dt = null;
        GeneralDAL _dal = null;
        Hashtable _ht = null;
        DataTable _dtH = null;
        GeneralDAL _dalH = null;
        Hashtable _htH = null;

        try
        {
            _ht = new Hashtable();
            _dal = new GeneralDAL();
            _dt = new DataTable();
            _htH = new Hashtable();
            _dalH = new GeneralDAL();
            _dtH = new DataTable();

            _ht["p_mount"] = ddlBulan.SelectedItem.Value;
            _ht["p_year"] = ddlTahun.SelectedItem.Value;
            _ht["p_keywords"] = txtSearch.Text;
            _ht["p_status"] = ddlStatus.SelectedItem.Value;
            _ht["p_filter"] = "";

            _dt = _dal.GetRows(TABLE_NAME, _ht);

            _htH["p_code_segmen"] = SEGMENT;
            _dtH = _dalH.GetRows(TABLE_NAME_HEADER, _htH);

            List<Headers> header = new List<Headers>();
            header = cv.ConvertDataTable<Headers>(_dtH);

            List<EntityF06> list = new List<EntityF06>();
            list = cv.ConvertDataTable<EntityF06>(_dt);

            bool isCreate = dc.ValidateF06(list, header);

            if (isCreate)
                Shared.ShowSuccessGritter(this, string.Format("fasilitaslainnyalist.aspx"));

        }
        catch (Exception ex)
        {
            Shared.ShowErrorDialog(this, ex);
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string filter = "";

        if (ddlStatus.SelectedItem.Value == "Select Status")
            filter = "all";
        else if (ddlBulan.SelectedItem.Value == "0" && ddlStatus.SelectedItem.Value == "Select Status")
            filter = "all";

        BindData(filter);
    }

    protected override void SelectedIndexChanged(object sender, EventArgs e)
    {
        base.SelectedIndexChanged(sender, e);
        Response.Redirect("fasilitaslainnya.aspx?action=edit&code=" + gvwList.SelectedDataKey[0].ToString());
    }
}
