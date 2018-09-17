using System;
using System.Data;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iConsole.DataAccessLayer;
using MPF23.Shared.Mapper;

public partial class module_staff_employeemain : BasePage
{
    private static string TABLE_NAME    = "EMPLOYEE_MAIN";
    private static string TABLE_NAME_A  = "EMPLOYEE_BRANCH";
    private static string TABLE_NAME_B  = "EMPLOYEE_GEOTAG_LOG";
    private static string TABLE_NAME_C  = "EMPLOYEE_DEVICE";

    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();
        btnLookupZipCode.Attributes["href"] = String.Format("javascript:fnShowDialog('../../lookup/generic.aspx?code=MZC&acol_0={0}&bcol_1={1}');", txtPostCode.ClientID, lblZipCodeDescription.ClientID);

        if (!Page.IsPostBack)
        {
            if (Request.Params["action"].Equals("edit"))
            {
                LoadDataEmployeeMain();
                BindDataEmployeeBranch();
                BindDataEmployeeGeotag();
                BindDataEmployeeDevice();
                btnCancel.Text = "<i class='icon-remove'></i>Back";
            }

            if (Request.Params["action"].Equals("add"))
            {
                btnAddEmployeeBranch.Visible = false;
                btnDeleteEmployeeBranch.Visible = false;
                btnAddEmployeeDevice.Visible = false;
                btnDeleteEmployeeDevice.Visible = false;
            }
        }
    }

    private void LoadDataEmployeeMain()
    {
        GeneralDAL _dal = null;
        Hashtable _ht = null;

        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            _ht["p_emp_code"] = Request.Params["emp_code"];

            DataRow _dr = _dal.GetRow(TABLE_NAME, _ht);

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
        string sNextEmpCode = string.Empty;

        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            MPF23.Shared.Mapper.UIToDB.Map(this.Controls, _ht);
            Shared.ApplyDefaultProp(_ht);

            _ht["p_emp_code"] = lblEmployeeCode.Text;

            Shared.ApplyDefaultProp(_ht);

            btnAddEmployeeBranch.Enabled = false;
            btnAddEmployeeDevice.Enabled = false;
            btnDeleteEmployeeBranch.Enabled = false;
            btnDeleteEmployeeDevice.Enabled = false;
            
            if (Request.Params["action"].Equals("add"))
            {
                _dal.Insert(TABLE_NAME, _ht,ref sNextEmpCode);
                lblEmployeeCode.Text = sNextEmpCode;
            }

            else
                _dal.Update(TABLE_NAME, _ht);

            Shared.ShowSuccessGritter(this, string.Format("employeemain.aspx?action=edit&emp_code={0}", lblEmployeeCode.Text));
        }
        catch (Exception ex)
        {
            Shared.ShowErrorDialog(this, ex);
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        SaveData();
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect(string.Format("employeemainlist.aspx"));
    }

    #region Employee Branch

        private void BindDataEmployeeBranch()
        {
            GeneralDAL _dal = null;
            Hashtable _ht = null;

            try
            {
                _dal = new GeneralDAL();
                _ht = new Hashtable();

                _ht["p_keywords"] = txtSearchEMPBranch.Text;
                _ht["p_emp_code"] = lblEmployeeCode.Text;

                gvwListEmployeeBranch.DataSource = _dal.GetRows(TABLE_NAME_A, _ht);
                gvwListEmployeeBranch.DataBind();
            }
            catch (Exception ex)
            {
                Shared.ShowErrorDialog(this, ex);
            }
        }

        private void DeleteDataEmployeeBranch(string empcode, string branchcode)
        {
            GeneralDAL _dal = null;
            Hashtable _ht = null;

            try
            {
                _dal = new GeneralDAL();
                _ht = new Hashtable();

                _ht["p_emp_code"] = empcode;
                _ht["p_branch_code"] = branchcode;

                _dal.Delete(TABLE_NAME_A, _ht);
            }
            catch (Exception ex)
            {
                Shared.ShowErrorDialog(this, ex);
            }
        }

        protected void btnAddEmployeeBranch_Click(object sender, EventArgs e)
        {
            Response.Redirect("employeebranch.aspx?action=add&emp_code="+ lblEmployeeCode.Text);
        }

        protected void btnDeleteEmployeeBranch_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in gvwListEmployeeBranch.Rows)
            {
                CheckBox chb = (CheckBox)row.Cells[1].Controls[1];
                if (chb.Checked)
                {
                    DeleteDataEmployeeBranch(gvwListEmployeeBranch.DataKeys[row.RowIndex][0].ToString(), gvwListEmployeeBranch.DataKeys[row.RowIndex][1].ToString());
                }
            }

            BindDataEmployeeBranch();
        }

        protected void btnSearchEmployeeBranch_Click(object sender, EventArgs e)
        {
            BindDataEmployeeBranch();
        }

        protected void gvwListEmployeeBranch_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("employeebranch.aspx?action=edit&emp_code=" + gvwListEmployeeBranch.SelectedDataKey[0].ToString() + "&branch_code=" + gvwListEmployeeBranch.SelectedDataKey[1].ToString());
        }

        protected void gvwListEmployeeBranch_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvwListEmployeeBranch.PageIndex = e.NewPageIndex;
            BindDataEmployeeBranch();
        }

        protected void chbCheckedAll_CheckedChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow gvr in gvwListEmployeeBranch.Rows)
            {
                CheckBox cbSelect = gvr.FindControl("chbChecked") as CheckBox;
                cbSelect.Checked = ((CheckBox)sender).Checked;
            }
        }


    #endregion

    #region Device

        private void BindDataEmployeeDevice()
        {
            GeneralDAL _dal = null;
            Hashtable _ht = null;

            try
            {
                _dal = new GeneralDAL();
                _ht = new Hashtable();

                _ht["p_keywords"] = txtSearchEMPBranch.Text;
                _ht["p_emp_code"] = lblEmployeeCode.Text;

                gvwListEmployeeDevice.DataSource = _dal.GetRows(TABLE_NAME_C, _ht);
                gvwListEmployeeDevice.DataBind();
            }
            catch (Exception ex)
            {
                Shared.ShowErrorDialog(this, ex);
            }
        }

        protected void btnAddEmployeeDevice_Click(object sender, EventArgs e)
        {
            Response.Redirect("employeedevice.aspx?action=add&emp_code=" + lblEmployeeCode.Text);
        }

        protected void btnDeleteEmployeeDevice_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in gvwListEmployeeDevice.Rows)
            {
                CheckBox chb = (CheckBox)row.Cells[1].Controls[1];
                if (chb.Checked)
                {
                    DeleteEmployeeDevice(lblEmployeeCode.Text, gvwListEmployeeDevice.DataKeys[row.RowIndex][0].ToString());
                }
            }

            BindDataEmployeeDevice();
        }

        private void DeleteEmployeeDevice(string empcode, string id)
        {
            GeneralDAL _dal = null;
            Hashtable _ht = null;

            try
            {
                _dal = new GeneralDAL();
                _ht = new Hashtable();

                _ht["p_emp_code"] = empcode;            
                _ht["p_id"] = id;
             
                _dal.Delete(TABLE_NAME_C, _ht);
            }
            catch (Exception ex)
            {
                Shared.ShowErrorDialog(this, ex);
            }
        }

        protected void btnSearchEmployeeDevice_Click(object sender, EventArgs e)
        {
            BindDataEmployeeDevice();
        }

        protected void gvwListEmployeeDevice_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("employeedevice.aspx?action=edit&id=" + gvwListEmployeeDevice.SelectedDataKey[0]);
        }

        protected void gvwListEmployeeDevice_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvwListEmployeeDevice.PageIndex = e.NewPageIndex;
            BindDataEmployeeDevice();
        }

        protected void chbCheckedAllDevice_CheckedChanged(object sender, EventArgs e)
    {
        foreach (GridViewRow gvr in gvwListEmployeeDevice.Rows)
        {
            CheckBox cbSelect = gvr.FindControl("chbChecked") as CheckBox;
            cbSelect.Checked = ((CheckBox)sender).Checked;
        }
    }

    #endregion 

    #region  Geotag Log
        private void BindDataEmployeeGeotag()
        {
            GeneralDAL _dal = null;
            Hashtable _ht = null;

            try
            {
                _dal = new GeneralDAL();
                _ht = new Hashtable();

                _ht["p_keywords"] = txtSearchGeotag.Text;
                _ht["p_emp_code"] = lblEmployeeCode.Text;
                gvwListGeotag.DataSource = _dal.GetRows(TABLE_NAME_B, _ht);
                gvwListGeotag.DataBind();
            }
            catch (Exception ex)
            {
                Shared.ShowErrorDialog(this, ex);
            }
        }

        protected void btnSearchGeotag_Click(object sender, EventArgs e)
        {
            if (Request.Params["action"].Equals("edit"))
                BindDataEmployeeGeotag();
        }

        protected void gvwListGeotag_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvwListGeotag.PageIndex = e.NewPageIndex;
            BindDataEmployeeGeotag();
        }

        protected void gvwListGeotag_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

    #endregion

}