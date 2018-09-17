using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iConsole.DataAccessLayer;

public partial class module_staff_employeemainlist : BasePageList
{
    private static string TABLE_NAME = "EMPLOYEE_MAIN";

    protected void Page_Init(object sender, EventArgs e)
    {
        PAGE_LIST = "EMPLOYEE_MAIN";
        NEXT_PAGE = "employeemain.aspx";
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();

        if (!Page.IsPostBack)
        {
            BindDataEmployee();
           // btnDeleteEmployee.OnClientClick = "return confirm('Delete selected data?');";
        }
    }

    private void BindDataEmployee()
    {
        GeneralDAL _dal = null;
        Hashtable _ht = null;

        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            _ht["p_keywords"] = txtSearch.Text;

            gvwList.DataSource = _dal.GetRows(TABLE_NAME, _ht);
            gvwList.DataBind();
        }
        catch (Exception ex)
        {
            Shared.ShowErrorDialog(this, ex);
        }
    }

    private void DeleteDataEmployee(string employeecode)
    {
        GeneralDAL _dal = null;
        Hashtable _ht = null;

        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            _ht["p_emp_code"] = employeecode;

            _dal.Delete(TABLE_NAME, _ht);
        }
        catch (Exception ex)
        {
            Shared.ShowErrorDialog(this, ex);
        }
    }

    protected void gvwListEmployee_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwList.PageIndex = e.NewPageIndex;
        BindDataEmployee();
    }

    protected void btnAddEmployee_Click(object sender, EventArgs e)
    {
        Response.Redirect("employeemain.aspx?action=add");
    }

 /*   protected void btnDeleteEmployee_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in gvwListEmployee.Rows)
        {
            CheckBox chb = (CheckBox)row.Cells[1].Controls[1];
            if (chb.Checked)
            {
                DeleteDataEmployee(gvwListEmployee.DataKeys[row.RowIndex][0].ToString());
            }
        }

        BindDataEmployee();
    }        */

    protected void btnSearchEmployee_Click(object sender, EventArgs e)
    {
        BindDataEmployee();
    }

    protected override void SelectedIndexChanged(object sender, EventArgs e)
    {
        base.SelectedIndexChanged(sender, e);
        Response.Redirect("employeemain.aspx?action=edit&emp_code=" + gvwList.SelectedDataKey[0].ToString());
    }
    
    protected void chbCheckedAll_CheckedChanged(object sender, EventArgs e)
    {
        foreach (GridViewRow gvr in gvwList.Rows)
        {
            CheckBox cbSelect = gvr.FindControl("chbChecked") as CheckBox;
            cbSelect.Checked = ((CheckBox)sender).Checked;
        }
    }
}