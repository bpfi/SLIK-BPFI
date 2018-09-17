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

public partial class module_collection_collectionresults : BasePage
{
    private static string TABLE_NAME_RESULTS = "COLLECTION_RESULTS";
    
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();
        if (!Page.IsPostBack)
        {
            if (Request.Params["action"].Equals("edit"))
            {
                LoadData();
                btnCancelResults.Text = "<i class='icon-remove'></i>Back";
            }
        }
    }

    private void LoadData()
    {
        GeneralDAL _dal = null;
        Hashtable _ht = null;

        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            _ht["p_trx_no"] = Request.Params["trx_no"];
            _ht["p_id"] = int.Parse(Request.Params["id"]);

            DataRow _dr = _dal.GetRow(TABLE_NAME_RESULTS, _ht);

            DBToUI.Map(this.Controls, _dr);
        }
        catch (Exception ex)
        {
            Shared.ShowErrorDialog(this, ex);
        }
    }

    private void SaveData()
    {

        GeneralDAL _dal = null;
        Hashtable _ht = null;

        int inextId = 0;

        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            MPF23.Shared.Mapper.UIToDB.Map(this.Controls, _ht);
            Shared.ApplyDefaultProp(_ht);

            _ht["p_id"] = Request.Params["id"];

            if (Request.Params["action"].Equals("add"))
            {
                _dal.Insert(TABLE_NAME_RESULTS, _ht, ref inextId);
                //txtID.Text = inextId.ToString();
            }

            else
                _dal.Update(TABLE_NAME_RESULTS, _ht);

            Shared.ShowSuccessGritter(this, string.Format("collectionresults.aspx?action=edit&id={0}", int.Parse(Request.Params["id"])));
        }
        catch (Exception ex)
        {
            Shared.ShowErrorDialog(this, ex);
        }
    }

    protected void btnSaveResults_Click(object sender, EventArgs e)
    {
        SaveData();
    }

    protected void btnCancelResults_Click(object sender, EventArgs e)
    {
        Response.Redirect(string.Format("collectionmain.aspx?action=edit&trx_no={0}&filter_status={1}&filter_result={2}", Request.Params["trx_no"], Request.Params["filter_status"], Request.Params["filter_result"]));
    }
}