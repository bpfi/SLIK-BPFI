<%@ WebHandler Language="C#" Class="menu" %>

using System;
using System.Web;
using System.Data;
using System.Collections;

using iConsole.DataAccessLayer;

public class menu : IHttpHandler, System.Web.SessionState.IRequiresSessionState 
{
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        context.Response.Write(GenerateMenu());
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

    private DataTable _dt = null;
    
    private string GenerateMenu()
    {
        string sMenu = "";
        
        GeneralDAL _dal = null;
        Hashtable _ht = null;
        
        try
        {
            sMenu += "<ul class='sidebar-menu' id='nav-accordian' style='display: block;'>";
            sMenu += "<li><a class='active' href='../module/dashboard/default.aspx' target='ifr'><i class='icon-dashboard'></i><span>Dashboard</span></a></li>";
            
            
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            _ht["p_user_type"] = Shared.CurrentUserType;
            
            DataTable dtParent = _dal.GetRows("", "xsp_master_menu_getrows_parent",_ht);
           
            foreach (DataRow drParent in dtParent.Rows)
            {
                //begin -> menu parent
                sMenu += String.Format("<li class='sub-menu'><a href='javascript:;'><i class='{0}'></i><span>{1}</span></a>", drParent["CSS_CLASS"].ToString(), drParent["NAME"].ToString());
                
                _ht.Clear();
                _ht["p_user_type"] = Shared.CurrentUserType;
                _ht["p_parent_id"] = (int)drParent["ID"];
                
                DataTable dtChildren = _dal.GetRows("", "xsp_master_menu_getrows_children", _ht);

                sMenu += "<ul class='sub'>";
                
                int SurveyParam = 1;
                int Collectionparam = 1;
                
                foreach (DataRow drChild in dtChildren.Rows)
                {
                    //menu Harcode for survey and collection
                    if (drParent["NAME"].ToString() == "Survey")
                    {
                        if (drChild["NAME"].ToString() == "All" || drChild["NAME"].ToString() == "New" || drChild["NAME"].ToString() == "Picked Device" || drChild["NAME"].ToString() == "Sycn to Device" || drChild["NAME"].ToString() == "Sycn to Production")
                        {
                            _ht["p_filter"] = drChild["NAME"].ToString();
                            _dt = _dal.GetRows("", "xsp_survey_main_getrows_menu_count", _ht);

                            if (drChild["NAME"].ToString() == "All")
                                sMenu += String.Format("<li><a href='../{0}' target='ifr'>{1} ({2})</a></li>", drChild["URL"].ToString() + "?param=" + drChild["NAME"].ToString(), drChild["NAME"].ToString(), _dt.Rows[0][0]);

                            else if (drChild["NAME"].ToString() == "New" || drChild["NAME"].ToString() == "Picked Device" || drChild["NAME"].ToString() == "Sycn to Device" || drChild["NAME"].ToString() == "Sycn to Production")
                            { 
                                sMenu += String.Format("<li><a href='../{0}' target='ifr'>{1} ({2})</a></li>", drChild["URL"].ToString() + "?param=" + SurveyParam.ToString(), drChild["NAME"].ToString(), _dt.Rows[0][0]);
                                SurveyParam = SurveyParam + 1;
                            }
                        }
                    }
                    else if (drParent["NAME"].ToString() == "Collection")
                    {
                        if (drChild["NAME"].ToString() == "All" || drChild["NAME"].ToString() == "New" || drChild["NAME"].ToString() == "Picked Device" || drChild["NAME"].ToString() == "Sycn to Device" || drChild["NAME"].ToString() == "Sycn to Production")
                        {
                            _ht["p_filter"] = drChild["NAME"].ToString();
                            _dt = _dal.GetRows("", "xsp_collection_main_getrows_menu_count", _ht);

                            if (drChild["NAME"].ToString() == "All")
                                sMenu += String.Format("<li><a href='../{0}' target='ifr'>{1} ({2})</a></li>", drChild["URL"].ToString() + "?param=" + drChild["NAME"].ToString(), drChild["NAME"].ToString(), _dt.Rows[0][0]);

                            else if (drChild["NAME"].ToString() == "New" || drChild["NAME"].ToString() == "Picked Device" || drChild["NAME"].ToString() == "Sycn to Device" || drChild["NAME"].ToString() == "Sycn to Production")
                            {
                                sMenu += String.Format("<li><a href='../{0}' target='ifr'>{1} ({2})</a></li>", drChild["URL"].ToString() + "?param=" + Collectionparam.ToString(), drChild["NAME"].ToString(), _dt.Rows[0][0]);
                                Collectionparam = Collectionparam + 1;
                            }
                        }
                        else 
                        {                              
                            sMenu += String.Format("<li><a href='../{0}' target='ifr'>{1}</a></li>", drChild["URL"].ToString(), drChild["NAME"].ToString());
                        }
                    }       
                    else
                    {
                        sMenu += String.Format("<li><a href='../{0}' target='ifr'>{1}</a></li>", drChild["URL"].ToString(), drChild["NAME"].ToString());
                    }
                    
                }
                
                //end -> menu parent
                sMenu += "</ul></li>";
            }    
        }
        catch (Exception ex)
        {
            throw ex;
        }
        
        sMenu += "</ul>";
        
        return sMenu;
    }
}