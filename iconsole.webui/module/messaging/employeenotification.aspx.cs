﻿using System;
using System.Data;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iConsole.DataAccessLayer;
using MPF23.Shared.Mapper;
using MPF23.XUI.Control;

public partial class module_messaging_employeenotification : BasePage
{
    private static string TABLE_NAME = "EMPLOYEE_NOTIFICATION";

    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();

        btnLookUpEmp.Attributes["href"] = String.Format("javascript:fnShowDialog('../../lookup/generic.aspx?code=EMPC&acol_0={0}&bcol_1={1}');", txtEmpCode.ClientID, lblEmpName.ClientID);

        if (!Page.IsPostBack)
        {
           
            if (Request.Params["action"].Equals("edit"))
            {
                LoadData();
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

            _ht["p_id"] = Request.Params["id"];
            
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

        int iNextID = 0;

        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            MPF23.Shared.Mapper.UIToDB.Map(this.Controls, _ht);

            Shared.ApplyDefaultProp(_ht);
            
            _ht["p_id"] = txtId.Text;
            
            Shared.ApplyDefaultProp(_ht);
            
            if (Request.Params["action"].Equals("add"))
            {
                _dal.Insert(TABLE_NAME, _ht, ref iNextID);
                txtId.Text = iNextID.ToString() ;
            }
            else
                _dal.Update(TABLE_NAME, _ht);

            Shared.ShowSuccessGritter(this, string.Format("employeenotification.aspx?action=edit&id={0}", txtId.Text));
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
        Response.Redirect(string.Format("employeenotificationlist.aspx"));
    }

}
