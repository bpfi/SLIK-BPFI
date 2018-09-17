using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

using iConsole.DataAccessLayer;

public partial class lookup_subscription : System.Web.UI.Page
{
    private static string SP_TABLE_SOURCE = string.Empty;
    private static string SP_TABLE_TARGET = string.Empty;
    private static string SP_SAVE_NAME = string.Empty;
    private static string SP_SOURCE_TO_TARGET = string.Empty;
    private static string SP_TARGET_TO_SOURCE = string.Empty;
    private static string SP_PARAMETER_CODE = string.Empty;
    private static string SP_PARAMETER_USER_CODE = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Shared.BindSubscription(Request.Params["code"], ref SP_TABLE_SOURCE, ref SP_TABLE_TARGET, ref SP_SAVE_NAME,
                ref SP_SOURCE_TO_TARGET, ref SP_TARGET_TO_SOURCE, ref SP_PARAMETER_CODE, ref SP_PARAMETER_USER_CODE);

            BindDataSource();
            BindDataTarget();
        }
    }

    private void BindDataSource()
    {
        GeneralDAL _dal = null;
        Hashtable _ht = null;

        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            _ht["p_keywords"] = txtSearchSource.Text;
            _ht["p_emp_code"] = Request.Params["empcode"];

            gvwListSource.DataSource = _dal.GetRows("", SP_TABLE_SOURCE, _ht);
            gvwListSource.DataBind();
        }
        catch (Exception ex)
        {
            Shared.ShowErrorDialog(this, ex);
        }
    }

    private void BindDataTarget()
    {
        GeneralDAL _dal = null;
        Hashtable _ht = null;

        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            _ht["p_keywords"] = txtSearchTarget.Text;
            _ht["p_emp_code"] = Request.Params["empcode"];

            gvwListTarget.DataSource = _dal.GetRows("", SP_TABLE_TARGET, _ht);
            gvwListTarget.DataBind();
        }
        catch (Exception ex)
        {
            Shared.ShowErrorDialog(this, ex);
        }
    }

    protected void btnSearchSource_Click(object sender, EventArgs e)
    {
        BindDataSource();
    }

    protected void btnSearchTarget_Click(object sender, EventArgs e)
    {
        BindDataTarget();
    }

    protected void gvwListSource_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwListSource.PageIndex = e.NewPageIndex;
        BindDataSource();
    }

    protected void gvwListTarget_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwListTarget.PageIndex = e.NewPageIndex;
        BindDataTarget();
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        //add selected data from gridview source to gridview target
        foreach (GridViewRow row in gvwListSource.Rows)
        {
            CheckBox chb = (CheckBox)row.Cells[0].Controls[1];
            if (chb.Checked)
            {
                AddDataToTargetGVW(row.Cells[1].Text);
            }
        }

        BindDataSource();
        BindDataTarget();
    }

    

    private void AddDataToTargetGVW(string Code)
    {
        GeneralDAL _dal = null;
        Hashtable _ht = null;

        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            _ht["p_emp_code"] = Request.Params["empcode"];
            _ht[SP_PARAMETER_CODE] = Code;
            Shared.ApplyDefaultProp(_ht);

            _dal.Insert("", SP_SOURCE_TO_TARGET, _ht);

            string script = "";
            if (Request.Params["gvw"] == null)
                 script += "javascript:parent.__doPostBack('ctl00$cpb$btnSearch','');";
            else
                script += "javascript:parent.__doPostBack('" + Request.Params["gvw"] + "','');";
            
            ScriptManager.RegisterStartupScript(this, GetType(), "fn2", script, true);
        }
        catch (Exception ex)
        {
            Shared.ShowErrorDialog(this, ex);
        }
    }

    protected void btnRemove_Click(object sender, EventArgs e)
    {
        //remove selected data from gridview target to gridview source
        foreach (GridViewRow row in gvwListTarget.Rows)
        {
            CheckBox chb = (CheckBox)row.Cells[0].Controls[1];
            if (chb.Checked)
            {
                AddDataToSourceGVW(row.Cells[1].Text);
            }
        }

        BindDataSource();
        BindDataTarget();
    }

    private void AddDataToSourceGVW(string Code)
    {
        GeneralDAL _dal = null;
        Hashtable _ht = null;

        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            _ht["p_emp_code"] = Request.Params["empcode"];
            _ht[SP_PARAMETER_CODE] = Code;
            Shared.ApplyDefaultProp(_ht);

            _dal.Insert("", SP_TARGET_TO_SOURCE, _ht);


            string script = "";
            if (Request.Params["gvw"] == null)
                script += "javascript:parent.__doPostBack('ctl00$cpb$btnSearch','');";
            else
                script += "javascript:parent.__doPostBack('" + Request.Params["gvw"] + "','');";

            ScriptManager.RegisterStartupScript(this, GetType(), "fn2", script, true);
        }
        catch (Exception ex)
        {
            Shared.ShowErrorDialog(this, ex);
        }
    }

    //protected void btnSave_Click(object sender, EventArgs e)
    //{
    //    //commit data on gridview target
    //    CommitSaveData(); 
    //    string script = Shared.GenerateLookUpReturnString(ClientQueryString, gvwListTarget);
    //    ScriptManager.RegisterStartupScript(this, GetType(), "fn2", script, true);
    //}

    private void CommitSaveData()
    {
        GeneralDAL _dal = null;
        Hashtable _ht = null;

        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            _ht["p_emp_code"] = Request.Params["empcode"];
            Shared.ApplyDefaultProp(_ht);

            _dal.ExecRawSP(SP_SAVE_NAME, _ht);
        }
        catch (Exception ex)
        {
            Shared.ShowErrorDialog(this, ex);
        }
    }
}
