using System;
using System.Data;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iConsole.DataAccessLayer;
using MPF23.Shared.Mapper;

public partial class module_commonmst_mastergeneralcode : BasePage
{
    private static string TABLE_NAME = "MASTER_GENERAL_CODE";
    private static string TABLE_NAME_DETAIL = "MASTER_GENERAL_SUBCODE";

    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();

        if (!Page.IsPostBack)
        {
            txtCode.Text = Request.Params["code"];

            if (Request.Params["action"].Equals("edit"))
            {
                LoadData();

                BindSubCode();
                btnDeleteSubCode.OnClientClick = "return confirm('Delete selected data?');";
        
                txtCode.Enabled = false;
                btnCancel.Text = "<i class='icon-remove'></i>Back";
            }
            if (Request.Params["action"].Equals("add"))
            {
                btnAddSubCode.Visible = false;
                btnDeleteSubCode.Visible = false;
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

            _ht["p_code"] = Request.Params["code"];

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

        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            MPF23.Shared.Mapper.UIToDB.Map(this.Controls, _ht);
            Shared.ApplyDefaultProp(_ht);

            _ht["p_code"] = txtCode.Text;

            Shared.ApplyDefaultProp(_ht);

            if (Request.Params["action"].Equals("add"))
            {
                _dal.Insert(TABLE_NAME, _ht);
            }

            else
                _dal.Update(TABLE_NAME, _ht);

            Shared.ShowSuccessGritter(this, string.Format("mastergeneralcode.aspx?action=edit&code={0}", txtCode.Text));
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
        Response.Redirect(string.Format("mastergeneralcodelist.aspx"));
    }

    #region General Sub Code

        private void BindSubCode()
        {
            GeneralDAL _dal = null;
            Hashtable _ht = null;

            try
            {
                _dal = new GeneralDAL();
                _ht = new Hashtable();

                _ht["p_keywords"] = txtSearchSubCode.Text;
                _ht["p_general_code"] = txtCode.Text;
                gvwListSubCode.DataSource = _dal.GetRows(TABLE_NAME_DETAIL, _ht);
                gvwListSubCode.DataBind();
            }
            catch (Exception ex)
            {
                Shared.ShowErrorDialog(this, ex);
            }
        }

        protected void btnSearchSubCode_Click(object sender, EventArgs e)
        {
            if (Request.Params["action"].Equals("edit"))
                BindSubCode();
        }

        protected void gvwListSubCode_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvwListSubCode.PageIndex = e.NewPageIndex;
            BindSubCode();
        }

        protected void gvwListSubCode_SelectedIndexChanged(object sender, EventArgs e)
        {

            Response.Redirect(string.Format("mastergeneralsubcode.aspx?action=edit&general_code={0}&subcode={1}", txtCode.Text, gvwListSubCode.SelectedDataKey[0].ToString()));
        }

        protected void chbCheckedAll_CheckedChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow gvr in gvwListSubCode.Rows)
            {
                CheckBox cbSelect = gvr.FindControl("chbChecked") as CheckBox;
                cbSelect.Checked = ((CheckBox)sender).Checked;
            }
        }

        protected void btnAddSubCode_Click(object sender, EventArgs e)
        {
              Response.Redirect("mastergeneralsubcode.aspx?action=add&general_code=" + txtCode.Text );
        }

        protected void btnDeleteSubCode_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in gvwListSubCode.Rows)
            {
                CheckBox chb = (CheckBox)row.Cells[1].Controls[1];
                if (chb.Checked)
                {
                    DeleteDataSubCode(gvwListSubCode.DataKeys[row.RowIndex][0].ToString());
                }
            }

            BindSubCode();
        }

        private void DeleteDataSubCode(string subcode)
        {
            GeneralDAL _dal = null;
            Hashtable _ht = null;

            try
            {
                _dal = new GeneralDAL();
                _ht = new Hashtable();

                _ht["p_code"] = subcode;

                _dal.Delete(TABLE_NAME_DETAIL, _ht);
            }
            catch (Exception ex)
            {
                Shared.ShowErrorDialog(this, ex);
            }
        }
    
    #endregion
}