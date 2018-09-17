using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iConsole.DataAccessLayer;
using System.Collections;
using System.Data;
using MPF23.Shared.Mapper;

public partial class module_application_applicationcustomer : BasePage
{
    private static string TABLE_NAME            = "APPLICATION_CUSTOMER";
    private static string TABLE_NAME_OBJECT     = "APPLICATION_OBJECT";
    private static string TABLE_NAME_TC         = "APPLICATION_TC";
    private static string TABLE_NAME_COLLATERAL = "APPLICATION_COLLATERAL";
    private static string TABLE_NAME_DOCUMENT   = "APPLICATION_DOCUMENT";

    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();

        btnLookUpApplicationObject.Attributes["href"]       = String.Format("javascript:fnShowDialog('../../lookup/generic.aspx?code=AC&acol_0={0}&bcol_1={1}');", txtApplicationNoCustomer.ClientID, lblNameObject.ClientID);
        btnLookUpApplicationNoTc.Attributes["href"]         = String.Format("javascript:fnShowDialog('../../lookup/generic.aspx?code=AC&acol_0={0}&bcol_1={1}');", txtApplicationNoCustomer.ClientID, lblNameTc.ClientID);
        btnLookUpApplicationNoCollateral.Attributes["href"] = String.Format("javascript:fnShowDialog('../../lookup/generic.aspx?code=AC&acol_0={0}&bcol_1={1}');", txtApplicationNoCustomer.ClientID, lblNameCollateral.ClientID);

        if (!Page.IsPostBack)
        {
            if (Request.Params["action"].Equals("edit"))
            {
                LoadData();
                LoadDataObject();
                LoadDataTc();
                LoadDataCollateral();
                BindApplicationDocument();            
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

            _ht["p_application_no"] = Request.Params["app_no"];

            DataRow _dr = _dal.GetRow(TABLE_NAME, _ht);

            DBToUI.Map(upd.Controls, _dr);
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

            MPF23.Shared.Mapper.UIToDB.Map(upd.Controls, _ht);

            Shared.ApplyDefaultProp(_ht);

            _ht["p_application_no"] = txtApplicationNoCustomer.Text;

            Shared.ApplyDefaultProp(_ht);
           

            if (Request.Params["action"].Equals("add"))
            {
                _dal.Insert(TABLE_NAME, _ht);
            }
            else
                _dal.Update(TABLE_NAME, _ht);

            Shared.ShowSuccessGritter(this, string.Format("applicationcustomer.aspx?action=edit&app_no={0}", txtApplicationNoCustomer.Text));
        }
        catch (Exception ex)
        {
            Shared.ShowErrorDialog(this, ex);
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        SaveData();
        SaveDataObject();
        SaveDataTc();
        SaveDataCollateral();
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect(string.Format("applicationcustomerlist.aspx"));
    }

    #region Object
    
        private void LoadDataObject()
        {
            GeneralDAL _dal = null;
            Hashtable _ht = null;

            try
            {
                _dal = new GeneralDAL();
                _ht = new Hashtable();

                _ht["p_application_no"] = txtApplicationNoCustomer.Text;

                DataRow _dr = _dal.GetRow(TABLE_NAME_OBJECT, _ht);

                DBToUI.Map(updApplicationObject.Controls, _dr);
            }
            catch (Exception ex)
            {
                Shared.ShowErrorDialog(this, ex);
            }
        }

        private void SaveDataObject()
          {

              GeneralDAL _dal = null;
              Hashtable _ht = null;

              try
              {
                  _dal = new GeneralDAL();
                  _ht = new Hashtable();

                  MPF23.Shared.Mapper.UIToDB.Map(updApplicationObject.Controls, _ht);

                  Shared.ApplyDefaultProp(_ht);

                  _ht["p_application_no"] = txtApplicationNoCustomer.Text;

                  Shared.ApplyDefaultProp(_ht);

                  if (Request.Params["action"].Equals("add"))
                  {
                      _dal.Insert(TABLE_NAME_OBJECT, _ht);

                  }

                  else
                      _dal.Update(TABLE_NAME_OBJECT, _ht);

                  Shared.ShowSuccessGritter(this, string.Format("applicationcustomer.aspx?action=edit&app_no={0}", txtApplicationNoCustomer.Text));
              }
              catch (Exception ex)
              {
                  Shared.ShowErrorDialog(this, ex);
              }
          }

    #endregion

    #region TC
        private void LoadDataTc()
        {
        GeneralDAL _dal = null;
        Hashtable _ht = null;

        try
        {
          _dal = new GeneralDAL();
          _ht = new Hashtable();

          _ht["p_application_no"] = txtApplicationNoCustomer.Text;

          DataRow _dr = _dal.GetRow(TABLE_NAME_TC, _ht);

          DBToUI.Map(updApplicationTc.Controls, _dr);
        }
        catch (Exception ex)
        {
          Shared.ShowErrorDialog(this, ex);
        }
        }

        private void SaveDataTc()
        {
        GeneralDAL _dal = null;
        Hashtable _ht = null;

        try
        {
          _dal = new GeneralDAL();
          _ht = new Hashtable();

          MPF23.Shared.Mapper.UIToDB.Map(updApplicationTc.Controls, _ht);

          Shared.ApplyDefaultProp(_ht);

          _ht["p_application_no"] = txtApplicationNoCustomer.Text;

          Shared.ApplyDefaultProp(_ht);

          if (Request.Params["action"].Equals("add"))
          {
              _dal.Insert(TABLE_NAME_TC, _ht);
          }
          else
              _dal.Update(TABLE_NAME_TC, _ht);

          Shared.ShowSuccessGritter(this, string.Format("applicationcustomer.aspx?action=edit&app_no={0}", txtApplicationNoCustomer.Text));
        }
        catch (Exception ex)
        {
          Shared.ShowErrorDialog(this, ex);
        }
        }
         
    #endregion

    #region Collateral
        private void LoadDataCollateral()
        {
          GeneralDAL _dal = null;
          Hashtable _ht = null;

          try
          {
              _dal = new GeneralDAL();
              _ht = new Hashtable();

              _ht["p_application_no"] = txtApplicationNoCustomer.Text;

              DataRow _dr = _dal.GetRow(TABLE_NAME_COLLATERAL, _ht);

              DBToUI.Map(updApplicationCollateral.Controls, _dr);
          }
          catch (Exception ex)
          {
              Shared.ShowErrorDialog(this, ex);
          }
        }

        private void SaveDataCollateral()
        {
          GeneralDAL _dal = null;
          Hashtable _ht = null;

          try
          {
              _dal = new GeneralDAL();
              _ht = new Hashtable();

              MPF23.Shared.Mapper.UIToDB.Map(updApplicationCollateral.Controls, _ht);
             
              Shared.ApplyDefaultProp(_ht);

              _ht["p_application_no"] = txtApplicationNoCustomer.Text;

              Shared.ApplyDefaultProp(_ht);
           

              if (Request.Params["action"].Equals("add"))
              {
                  _dal.Insert(TABLE_NAME_COLLATERAL, _ht);

              }

              else
                  _dal.Update(TABLE_NAME_COLLATERAL, _ht);

              Shared.ShowSuccessGritter(this, string.Format("applicationcustomer.aspx?action=edit&app_no={0}", txtApplicationNoCustomer.Text));
          }
          catch (Exception ex)
          {
              Shared.ShowErrorDialog(this, ex);
          }
        }

    #endregion

    #region Document

        private void BindApplicationDocument()
        {
          GeneralDAL _dal = null;
          Hashtable _ht = null;

          try
          {
              _dal = new GeneralDAL();
              _ht = new Hashtable();

              _ht["p_keywords"] = txtSearch.Text;

              _ht["p_id"] = Request.Params["id"];
              _ht["p_application_no"] = Request.Params["app_no"];

              gvwListApplicationDocument.DataSource = _dal.GetRows(TABLE_NAME_DOCUMENT, _ht);
              gvwListApplicationDocument.DataBind();
          }
          catch (Exception ex)
          {
              Shared.ShowErrorDialog(this, ex);
          }
        }

        protected void gvwListApplicationDocument_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
          gvwListApplicationDocument.PageIndex = e.NewPageIndex;
          BindApplicationDocument();
        }

        protected void gvwListApplicationDocument_SelectedIndexChanged(object sender, EventArgs e)
        {

          Response.Redirect(string.Format("applicationdocument.aspx?action=edit&app_no={0}&id={1}", txtApplicationNoCustomer.Text, gvwListApplicationDocument.SelectedDataKey[0].ToString()));
        }

        protected void btnSearchApplicationDocument_Click(object sender, EventArgs e)
        {
          BindApplicationDocument();
        }
    

      
    #endregion
}
