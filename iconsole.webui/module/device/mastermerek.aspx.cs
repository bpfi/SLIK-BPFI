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

public partial class module_commonmst_mastermerek : BasePage
{
    private static string TABLE_NAME = "MASTER_MEREK";
    private static string TABLE_NAME_DETAIL = "MASTER_TYPE";

    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();

        if (!Page.IsPostBack)
        {
            if (Request.Params["action"].Equals("edit"))
            {
                LoadData();
                BindType();

                btnDeleteType.OnClientClick = "return confirm('Delete selected data?');";
        
                txtCode.Enabled = false;
                btnCancel.Text = "<i class='icon-remove'></i>Back";
            }
            if (Request.Params["action"].Equals("add"))
            {
                btnAddType.Visible = false;
                btnDeleteType.Visible = false;
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

            _ht["p_code"] = Request.Params["merek_code"];

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

        
            if (Request.Params["action"].Equals("add"))
            {
                _dal.Insert(TABLE_NAME, _ht);
            }

            else
                _dal.Update(TABLE_NAME, _ht);


            Shared.ShowSuccessGritter(this, string.Format("mastermerek.aspx?action=edit&merek_code={0}" , txtCode.Text));

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

        Response.Redirect(string.Format("mastermereklist.aspx?action=edit&merek_code={0}",txtCode.Text));
    }

    #region Type

        private void BindType()
        {
            GeneralDAL _dal = null;
            Hashtable _ht = null;

            try
            {
                _dal = new GeneralDAL();
                _ht = new Hashtable();

                _ht["p_keywords"] = txtSearch.Text;
                _ht["p_merek_code"] = txtCode.Text; 

                gvwListType.DataSource = _dal.GetRows(TABLE_NAME_DETAIL, _ht);
                gvwListType.DataBind();
            }
            catch (Exception ex)
            {
                Shared.ShowErrorDialog(this, ex);
            }
        }

        private void DeleteDataType(string typecode)
        {
            GeneralDAL _dal = null;
            Hashtable _ht = null;

            try
            {
                _dal = new GeneralDAL();
                _ht = new Hashtable();

                _ht["p_code"] = typecode;
           

                _dal.Delete(TABLE_NAME_DETAIL, _ht);
            }
            catch (Exception ex)
            {
                Shared.ShowErrorDialog(this, ex);
            }
        }

        protected void btnSearchType_Click(object sender, EventArgs e)
        {
            if (Request.Params["action"].Equals("edit"))
                BindType();
        }

        protected void gvwListType_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvwListType.PageIndex = e.NewPageIndex;
            BindType();
        }

        protected void gvwListType_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect(string.Format("mastertype.aspx?action=edit&merek_code=" + gvwListType.SelectedDataKey[1].ToString() + "&code=" + gvwListType.SelectedDataKey[0].ToString()));
        }

        protected void chbCheckedAll_CheckedChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow gvr in gvwListType.Rows)
            {
                CheckBox cbSelect = gvr.FindControl("chbChecked") as CheckBox;
                cbSelect.Checked = ((CheckBox)sender).Checked;
            }
        }

        protected void btnAddType_Click(object sender, EventArgs e)
        {
            Response.Redirect("mastertype.aspx?action=add&merek_code=" + txtCode.Text);
        }

        protected void btnDeleteType_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in gvwListType.Rows)
            {
                CheckBox chb = (CheckBox)row.Cells[1].Controls[1];
                if (chb.Checked)
                {
                    DeleteDataType(gvwListType.DataKeys[row.RowIndex][0].ToString());
                }
            }

            BindType();
        }
   
    #endregion

}
