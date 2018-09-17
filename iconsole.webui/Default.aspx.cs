using System;
using System.Data;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using iConsole.DataAccessLayer;
using System.Configuration;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page 
{
    //protected void Page_Load(object sender, EventArgs e)
    //{
    //    dataBranch();
    //    //LoadInit();
    //    if (!Page.IsPostBack)
    //    {
    //        //if (Request.Params["action"].Equals("edit"))
    //       // {
    //            //LoadData();
    //           // btnCancel.Text = "<i class='icon-remove'></i>Back";
    //        //}
    //    }
    //}

    //private void dataBranch()
    //{
    //    try
    //    {
    //        string constr = ConfigurationManager.ConnectionStrings["Test1"].ToString(); // connection string
    //        SqlConnection con = new SqlConnection(constr);
    //        con.Open();

    //        SqlCommand com = new SqlCommand("select * from Branch", con); // table name 
    //        SqlDataAdapter da = new SqlDataAdapter(com);
    //        DataSet ds = new DataSet();
    //        da.Fill(ds);  // fill dataset
    //        txtBRANCH.DataTextField = ds.Tables[0].Columns["BranchFullName"].ToString(); // text field name of table dispalyed in dropdown
    //        txtBRANCH.DataValueField = ds.Tables[0].Columns["BranchID"].ToString();             // to retrive specific  textfield name 
    //        txtBRANCH.DataSource = ds.Tables[0];      //assigning datasource to the dropdownlist
    //        txtBRANCH.DataBind();  //binding 
    //        con.Close();
    //    }
    //    catch (Exception err)
    //    {

    //    }
    //}
    protected void btnSignIn_Click(object sender, EventArgs e)
    {
        //HttpCookie cookie = new HttpCookie("CurrentLanguage");
        //cookie.Value = ddlLanguage.SelectedValue;
        //Response.SetCookie(cookie);



        /*
         * validate user
         * if row > 0, maka ambil role user tersebut
         * redirect ke main.aspx
         * jika tidak, show error
        */

        GeneralDAL _dal = null;
        Hashtable _ht = null;

        bool IsValidUser = true;
        bool IsValidPassword = true;
        bool IsActiveUser = true;

        string UID = "";

        try
        {

            _dal = new GeneralDAL();
            _ht = new Hashtable();

            _ht["p_uid"] = txtUID.Text;
            _ht["p_password"] = txtPassword.Text;

            DataRow dr = _dal.GetRow("", "xsp_master_user_main_validate", _ht);

            //dr null jika tidak ada record, langsung lari ke catch
            if (dr != null)
            {
                UID = dr["ID"].ToString();

                if (dr["UPASS"].ToString().Equals(dr["UPASSMD5"].ToString()))
                {
                    //Masukan Role disini
                    //if (dr["p_uid"].ToString() == "ADM000")
                    //{
                    //    Response.Redirect("/module/finance/agunan.aspx");
                    //}

                        if (((int)dr["LAST_FAIL_COUNT"]) >= 5)
                        IsValidPassword = false;
                    else
                    {
                            if (dr["IS_ACTIVE"].ToString().Equals("1"))//artinya user aktif
                        {
                            //reset fail count
                            _ht["p_uid"] = UID;
                            _dal.Update("", "xsp_master_user_main_reset_fail_count", _ht);

                            //update last login
                            _ht["p_uid"] = UID;
                            _ht["p_login_date"] = DateTime.Now;
                            _dal.Update("", "xsp_master_user_main_update_last_login", _ht);

                            //save user profile ke session
                            Session[SessionKey.CURRENT_USER_SESSION_KEY] = dr;

                            //save user role ke session
                            Session[SessionKey.CURRENT_USER_ROLE_SESSION_KEY] = _dal.GetRows("", "xsp_master_user_main_getroles", _ht);

                            //save user ip address
                            if (Request.ServerVariables["HTTP_X_FORWARDED_FOR"] == null)
                                Session[SessionKey.CURRENT_USER_IP_ADDRESS_SESSION_KEY] = Request.ServerVariables["REMOTE_ADDR"];
                            else
                                Session[SessionKey.CURRENT_USER_IP_ADDRESS_SESSION_KEY] = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

                            //insert master user login log
                            _ht["p_uid"] = UID;
                            _ht["p_ip_address"] = Shared.CurrentIPAddress;
                            _ht["p_flag_code"] = "SUCCESS";
                            Shared.ApplyDefaultProp(_ht);
                            _dal.Insert("", "xsp_master_user_login_log_insert", _ht);

                            if (((DateTime)dr["NEXT_CHANGE_PASS"]) <= DateTime.Now)
                            {
                                ScriptManager.RegisterStartupScript(this, GetType(), "fx", "fnShowModalChangePassword();", true); ;
                            }
                            else
                            {
                                //redirect ke halaman main
                                //Response.Redirect("main.aspx");
                                //Masukan Role disini
                                if (dr["ID"].ToString() == "ADM000")
                                {
                                    Response.Redirect("branch/main_000.aspx");

                                }
                                else if (dr["ID"].ToString() == "1000000003")
                                {
                                    Response.Redirect("main.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM001")
                                {
                                    Response.Redirect("branch/main_001.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM002")
                                {
                                    Response.Redirect("branch/main_002.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM004")
                                {
                                    Response.Redirect("branch/main_004.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM005")
                                {
                                    Response.Redirect("branch/main_005.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM006")
                                {
                                    Response.Redirect("branch/main_006.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM007")
                                {
                                    Response.Redirect("branch/main_007.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM008")
                                {
                                    Response.Redirect("branch/main_008.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM009")
                                {
                                    Response.Redirect("branch/main_009.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM010")
                                {
                                    Response.Redirect("branch/main_010.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM011")
                                {
                                    Response.Redirect("branch/main_011.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM012")
                                {
                                    Response.Redirect("branch/main_012.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM013")
                                {
                                    Response.Redirect("branch/main_013.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM014")
                                {
                                    Response.Redirect("branch/main_014.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM015")
                                {
                                    Response.Redirect("branch/main_015.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM016")
                                {
                                    Response.Redirect("branch/main_016.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM017")
                                {
                                    Response.Redirect("branch/main_017.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM018")
                                {
                                    Response.Redirect("branch/main_018.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM019")
                                {
                                    Response.Redirect("branch/main_019.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM020")
                                {
                                    Response.Redirect("branch/main_020.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM021")
                                {
                                    Response.Redirect("branch/main_021.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM022")
                                {
                                    Response.Redirect("branch/main_022.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM023")
                                {
                                    Response.Redirect("branch/main_023.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM024")
                                {
                                    Response.Redirect("branch/main_024.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM025")
                                {
                                    Response.Redirect("branch/main_025.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM026")
                                {
                                    Response.Redirect("branch/main_026.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM027")
                                {
                                    Response.Redirect("branch/main_027.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM028")
                                {
                                    Response.Redirect("branch/main_028.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM029")
                                {
                                    Response.Redirect("branch/main_029.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM030")
                                {
                                    Response.Redirect("branch/main_030.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM031")
                                {
                                    Response.Redirect("branch/main_031.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM032")
                                {
                                    Response.Redirect("branch/main_032.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM033")
                                {
                                    Response.Redirect("branch/main_033.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM034")
                                {
                                    Response.Redirect("branch/main_034.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM035")
                                {
                                    Response.Redirect("branch/main_035.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM036")
                                {
                                    Response.Redirect("branch/main_036.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM037")
                                {
                                    Response.Redirect("branch/main_037.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM038")
                                {
                                    Response.Redirect("branch/main_038.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM039")
                                {
                                    Response.Redirect("branch/main_039.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM040")
                                {
                                    Response.Redirect("branch/main_040.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM041")
                                {
                                    Response.Redirect("branch/main_041.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM042")
                                {
                                    Response.Redirect("branch/main_042.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM043")
                                {
                                    Response.Redirect("branch/main_043.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM044")
                                {
                                    Response.Redirect("branch/main_044.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM045")
                                {
                                    Response.Redirect("branch/main_045.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM046")
                                {
                                    Response.Redirect("branch/main_046.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM047")
                                {
                                    Response.Redirect("branch/main_047.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM048")
                                {
                                    Response.Redirect("branch/main_048.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM049")
                                {
                                    Response.Redirect("branch/main_049.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM050")
                                {
                                    Response.Redirect("branch/main_050.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM051")
                                {
                                    Response.Redirect("branch/main_051.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM052")
                                {
                                    Response.Redirect("branch/main_052.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM053")
                                {
                                    Response.Redirect("branch/main_053.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM054")
                                {
                                    Response.Redirect("branch/main_054.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM055")
                                {
                                    Response.Redirect("branch/main_055.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM056")
                                {
                                    Response.Redirect("branch/main_056.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM057")
                                {
                                    Response.Redirect("branch/main_057.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM058")
                                {
                                    Response.Redirect("branch/main_058.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM059")
                                {
                                    Response.Redirect("branch/main_059.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM060")
                                {
                                    Response.Redirect("branch/main_060.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM061")
                                {
                                    Response.Redirect("branch/main_061.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM062")
                                {
                                    Response.Redirect("branch/main_062.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM063")
                                {
                                    Response.Redirect("branch/main_063.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM064")
                                {
                                    Response.Redirect("branch/main_064.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM065")
                                {
                                    Response.Redirect("branch/main_065.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM066")
                                {
                                    Response.Redirect("branch/main_066.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM067")
                                {
                                    Response.Redirect("branch/main_067.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM068")
                                {
                                    Response.Redirect("branch/main_068.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM069")
                                {
                                    Response.Redirect("branch/main_069.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM070")
                                {
                                    Response.Redirect("branch/main_070.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM071")
                                {
                                    Response.Redirect("branch/main_071.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM072")
                                {
                                    Response.Redirect("branch/main_072.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM073")
                                {
                                    Response.Redirect("branch/main_073.aspx");
                                }
                                else if (dr["ID"].ToString() == "ADM0900")
                                {
                                    Response.Redirect("branch/main_0900.aspx");
                                }
                            }
                        }
                        else
                            IsActiveUser = false;
                    }
                }
                else
                    IsValidPassword = false;
            }
            else
                IsValidUser = false;
        }
        catch
        {
            IsValidUser = false;
        }


        if (!IsActiveUser)
        {
            //show ke user message box, jika user dia tidak aktif
            ScriptManager.RegisterStartupScript(this, GetType(), "fx", "fnShowErrorNotif('User not active. Please contact your MIS/IT Department.', '');", true);
        }
        else if (!IsValidPassword)
        {
            //cek last fail count untuk uid yang login
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            _ht["p_id"] = UID;

            DataRow dr = _dal.GetRow("", "xsp_master_user_main_getrow", _ht);


            _ht["p_login_date"] = DateTime.Now;
            _ht["p_cre_date"] = DateTime.Now;
            _ht["p_cre_by"] = txtUID.Text;
            _ht["p_cre_ip_address"] = "127.0.0.1";

            if (Request.ServerVariables["HTTP_X_FORWARDED_FOR"] == null)
                _ht["p_ip_address"] = Request.ServerVariables["REMOTE_ADDR"];
            else
                _ht["p_ip_address"] = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];


            if (((int)dr["LAST_FAIL_COUNT"]) >= 5)
            {
                _ht["p_flag_code"] = "FAIL MAX ATTEMPT";
                _ht["p_uid"] = UID;

                //insert master user login log
                _dal.Insert("", "xsp_master_user_login_log_insert", _ht);

                //show warning max login attempt reached
                ScriptManager.RegisterStartupScript(this, GetType(), "fx", "fnShowErrorNotif('Maximum try login reached. Please contact your MIS/IT Department.', '');", true);
            }
            else // jika uid tersebut tidak ada berarti invalid user, langsung di catch
            {
                _ht["p_flag_code"] = "FAIL PASSWORD";
                _ht["p_uid"] = UID;
                _ht["p_mod_date"] = DateTime.Now.ToString("yyyy-MM-dd");
                _ht["p_mod_by"] = txtUID.Text;
                _ht["p_mod_ip_address"] = "127.0.0.1";

                //insert master user login log
                try
                {
                    _dal.Insert("", "xsp_master_user_login_log_insert", _ht);

                    //update last fail count -> ditambahkan 1
                    _dal.Update("", "xsp_master_user_main_increment_fail_count", _ht);

                    ScriptManager.RegisterStartupScript(this, GetType(), "fx", "fnShowErrorNotif('Invalid password', '');", true);
                }
                catch (Exception exp)
                {
                    string error = exp.Message;
                }
            }
        }
        else if (!IsValidUser)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "fx", "fnShowErrorNotif('Invalid user', '');", true);
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        GeneralDAL _dal = null;
        Hashtable _ht = null;

        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            _ht["p_uid"] = txtResetUID.Text;

            _dal.ExecRawSP("xsp_master_user_main_reset_password", _ht);

            //--------------------------------
            _ht["p_login_date"] = DateTime.Now;
            _ht["p_flag_code"] = "RESET PASSWORD";
            _ht["p_cre_date"] = DateTime.Now;
            _ht["p_cre_by"] = txtResetUID.Text;
            _ht["p_cre_ip_address"] = "127.0.0.1";

            if (Request.ServerVariables["HTTP_X_FORWARDED_FOR"] == null)
                _ht["p_ip_address"] = Request.ServerVariables["REMOTE_ADDR"];
            else
                _ht["p_ip_address"] = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

            //insert master user login log
            _dal.Insert("", "xsp_master_user_login_log_insert", _ht);
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "fx", "fnShowErrorNotif('" + Shared.DefaultErrorMessage + "', '" + Shared.MakeSingleLine(ex) + "');", true);
        }
    }




    protected void btnChangePassword_Click(object sender, EventArgs e)
    {
        GeneralDAL _dal = null;
        Hashtable _ht = null;

        try
        {
            _dal = new GeneralDAL();
            _ht = new Hashtable();

            _ht["p_uid"] = txtUID.Text;
            _ht["p_new_password"] = txtNewPassword.Text;

            _dal.ExecRawSP("xsp_master_user_main_change_password", _ht);


            //-----------------------------------
            _ht["p_login_date"] = DateTime.Now;
            _ht["p_flag_code"] = "CHANGE PASSWORD";
            _ht["p_cre_date"] = DateTime.Now;
            _ht["p_cre_by"] = txtUID.Text;
            _ht["p_cre_ip_address"] = "127.0.0.1";

            if (Request.ServerVariables["HTTP_X_FORWARDED_FOR"] == null)
                _ht["p_ip_address"] = Request.ServerVariables["REMOTE_ADDR"];
            else
                _ht["p_ip_address"] = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

            //insert master user login log
            _dal.Insert("", "xsp_master_user_login_log_insert", _ht);


            Response.Redirect("main.aspx");
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "fx", "fnShowErrorNotif('" + Shared.DefaultErrorMessage + "', '" + Shared.MakeSingleLine(ex) + "');", true); ;
        }
    }
}
