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

public partial class module_question_masterphotogroupdetail : BasePage
{
    private static string TABLE_NAME = "MASTER_PHOTO_GROUP_DETAIL";

    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();
        btnLookUpMaster_Photo.Attributes["href"] = String.Format("javascript:fnShowDialog('../../lookup/generic.aspx?code=MP&acol_0={0}&bcol_1={1}');", txtCode.ClientID, lblDescription.ClientID);
        if (!Page.IsPostBack)
        {
            txtID_Master_Photo_Group.Text = Request.Params["code"];

            if (Request.Params["action"].Equals("edit"))
            {
                LoadData();
                txtID_Master_Photo_Group.Enabled = true;
                btnCancel.Text = "<i class='icon-remove'></i>Back";
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

            _ht["p_photo_code"] = txtCode.Text;
            _ht["p_group_code"] = txtID_Master_Photo_Group.Text;
         
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

            _ht["p_photo_code"] = txtCode.Text;
            _ht["p_group_code"] = txtID_Master_Photo_Group.Text;
            if (Request.Params["action"].Equals("add"))
            {
                _dal.Insert(TABLE_NAME, _ht);
            }
            else
                _dal.Update(TABLE_NAME, _ht);
            Shared.ShowSuccessGritter(this, string.Format("masterphotogroup.aspx?action=edit&code=" + txtID_Master_Photo_Group.Text));

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
        Response.Redirect(string.Format("masterphotogroup.aspx?action=edit&code={0}", txtID_Master_Photo_Group.Text));
    }
}
