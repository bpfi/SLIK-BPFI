using System;
using System.Data;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iConsole.DataAccessLayer;
using MPF23.Shared.Mapper;

public partial class module_user_masterusermain : BasePage
{
    private static string TABLE_NAME = "MASTER_USER_MAIN";
    private static string TABLE_NAME_B = "MASTER_USER_LOGIN_LOG";
    private static string TABLE_NAME_GROUPSEC = "MASTER_USER_MAIN_GROUP_SEC";
    
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();
        if (!Page.IsPostBack)
        {
            lblId.Text = Request.Params["id"];

            if (Request.Params["action"].Equals("edit"))
            {
                LoadDataUserMain();
                BindUserLogin();
                BindUserActivity();
                BindUserGroupsec();

                lblId.Enabled = false;
                btnUserMainCancel.Text = "<i class='icon-remove'></i>Back";
                btnChangeStatus.OnClientClick = "return confirm('Do you want to change your password ?');";
                btnResetPassword.OnClientClick = "return confirm('Do you want to reset your password ?');";
                btnResetLoginCount.OnClientClick = "return confirm('Do you want to reset count login your password ?');";

               /* if (lblIsActive.Text == "0")
                {
                    lblIsActive.Text = "INACTIVE";
                }
                else
                {
                    lblIsActive.Text = "ACTIVE";
                }   */

            }
            else
            {
                lblUsertype.Text = "E";
            }

            if (Request.Params["action"].Equals("add"))
            {
                btnResetPassword.Visible = false;
                btnChangeStatus.Visible = false;
                btnAddUserGroupsec.Visible = false;
                btnDeleteUserGroupsec.Visible = false;

            }
        }
    }

    private void LoadDataUserMain()
    {
        GeneralDAL _dal = null;
        Hashtable _ht = null;

        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            _ht["p_id"] = Request.Params["id"];

            DataRow _dr = _dal.GetRow(TABLE_NAME, _ht);

            DBToUI.Map(this.Controls, _dr);
        }
        catch (Exception ex)
        {
            Shared.ShowErrorDialog(this, ex);
        }
    }

    protected void btnUserMainCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect(string.Format("masterusermainlist.aspx"));
    }

    protected void btnChangeStatus_Click(object sender, EventArgs e)
    {
        GeneralDAL _dal = null;
        Hashtable _ht = null;

        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            _ht["p_uid"] = Request.Params["id"];
            Shared.ApplyDefaultProp(_ht);

            _dal.ExecRawSP("xsp_master_user_main_update_status", _ht); // untuk megeksekusi sp selain dari 5 sp pokok

            Shared.ShowSuccessGritter(this, string.Format("masterusermain.aspx?action=edit&id={0}", lblId.Text));
        }
        catch (Exception ex)
        {
            Shared.ShowErrorDialog(this, ex);
        }
    }

    protected void btnResetLoginCount_Click(object sender, EventArgs e)
    {
        GeneralDAL _dal = null;
        Hashtable _ht = null;
        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            _ht["p_uid"] = Request.Params["id"];
            Shared.ApplyDefaultProp(_ht);

            _dal.ExecRawSP("xsp_master_user_main_reset_fail_count", _ht); // untuk megeksekusi sp selain dari 5 sp pokok

            Shared.ShowSuccessGritter(this, string.Format("masterusermain.aspx?action=edit&id={0}", lblId.Text));
        }
        catch (Exception ex)
        {
            Shared.ShowErrorDialog(this, ex);
        }
    }
    
    protected void btnResetPassword_Click(object sender, EventArgs e)
    {
        GeneralDAL _dal = null;
        Hashtable _ht = null;

        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            _ht["p_uid"] = Request.Params["id"];
            Shared.ApplyDefaultProp(_ht);

            _dal.ExecRawSP("xsp_master_user_main_reset_password", _ht); // untuk megeksekusi sp selain dari 5 sp pokok

            Shared.ShowSuccessGritter(this, string.Format("masterusermain.aspx?action=edit&id={0}", lblId.Text));
        }
        catch (Exception ex)
        {
            Shared.ShowErrorDialog(this, ex);
        }
    }

    #region User Login Log

        private void BindUserLogin()
        {
            GeneralDAL _dal = null;
            Hashtable _ht = null;

            try
            {
                _dal = new GeneralDAL();
                _ht = new Hashtable();

                _ht["p_keywords"] = txtSearchUserLogin.Text;
                _ht["p_uid"] = lblId.Text;
                gvwListUserLogin.DataSource = _dal.GetRows(TABLE_NAME_B, _ht);
                gvwListUserLogin.DataBind();
            }
            catch (Exception ex)
            {
                Shared.ShowErrorDialog(this, ex);
            }
        }
        
        protected void btnSearchUserLogin_Click(object sender, EventArgs e)
        {
            if (Request.Params["action"].Equals("edit"))
                BindUserLogin();
        }

        protected void gvwListUserLogin_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvwListUserLogin.PageIndex = e.NewPageIndex;
            BindUserLogin();
        }

    #endregion

    #region User Activity

        private void BindUserActivity()
        {
            GeneralDAL _dal = null;
            Hashtable _ht = null;

            try
            {
                _dal = new GeneralDAL();
                _ht = new Hashtable();

                _ht["p_keywords"] = txtActivitySearch.Text;
                _ht["p_uid"] = lblId.Text;
                gvwUserActivity.DataSource = _dal.GetRows("MASTER_USER_ACTIVITY_LOG", _ht);
                gvwUserActivity.DataBind();
            }
            catch (Exception ex)
            {
                Shared.ShowErrorDialog(this, ex);
            }
        }

        protected void btnSearchActivity_Click(object sender, EventArgs e)
        {
            if (Request.Params["action"].Equals("edit"))
                BindUserActivity();
        }

        protected void gvwUserActivity_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvwUserActivity.PageIndex = e.NewPageIndex;
            BindUserActivity();
        }

        protected void gvwUserActivity_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

    #endregion

    #region User Groupsec

        private void BindUserGroupsec()
        {
            GeneralDAL _dal = null;
            Hashtable _ht = null;

            try
            {
                _dal = new GeneralDAL();
                _ht = new Hashtable();

                _ht["p_keywords"] = txtSearchUserGroupsec.Text;
                _ht["p_uid"] = lblId.Text;

                gvwListUserGroupsec.DataSource = _dal.GetRows(TABLE_NAME_GROUPSEC, _ht);
                gvwListUserGroupsec.DataBind();
            }
            catch (Exception ex)
            {
                Shared.ShowErrorDialog(this, ex);
            }
        }

        private void DeleteUsergroupsec(string uid, string groupcode)
        {
            GeneralDAL _dal = null;
            Hashtable _ht = null;

            try
            {
                _dal = new GeneralDAL();
                _ht = new Hashtable();

                _ht["p_uid"] = uid;
                _ht["p_group_code"] = groupcode;

                _dal.Delete(TABLE_NAME_GROUPSEC, _ht);
            }
            catch (Exception ex)
            {
                Shared.ShowErrorDialog(this, ex);
            }
        }

        protected void btnAddUserGroupsec_Click(object sender, EventArgs e)
        {
            Response.Redirect("masterusermaingroupsec.aspx?action=add&uid=" + lblId.Text);
        }

        protected void btnDeleteUserGroupsec_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in gvwListUserGroupsec.Rows)
            {
                CheckBox chb = (CheckBox)row.Cells[1].Controls[1];
                if (chb.Checked)
                {
                    DeleteUsergroupsec(gvwListUserGroupsec.DataKeys[row.RowIndex][0].ToString(), gvwListUserGroupsec.DataKeys[row.RowIndex][1].ToString());
                }
            }

            BindUserGroupsec();
        }

        protected void btnSearchUserGroupsec_Click(object sender, EventArgs e)
        {
            BindUserGroupsec();
        }

        protected void gvwListUserGroupsec_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("masterusermaingroupsec.aspx?action=edit&uid=" + gvwListUserGroupsec.SelectedDataKey[0].ToString() + "&group_code=" + gvwListUserGroupsec.SelectedDataKey[1].ToString());
        }

        protected void gvwListUserGroupsec_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvwListUserGroupsec.PageIndex = e.NewPageIndex;
            BindUserGroupsec();
        }

        protected void chbCheckedAll_CheckedChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow gvr in gvwListUserGroupsec.Rows)
            {
                CheckBox cbSelect = gvr.FindControl("chbChecked") as CheckBox;
                cbSelect.Checked = ((CheckBox)sender).Checked;
            }
        }

    #endregion


}
