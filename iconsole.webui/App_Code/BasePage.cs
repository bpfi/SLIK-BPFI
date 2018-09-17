using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;


public class BasePage : System.Web.UI.Page
{

    protected TextBox InputSearch;
    protected GridView GridViewList;
    protected string PAGE_LIST;
    protected string NEXT_PAGE;

    public BasePage()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    //protected override void InitializeCulture()
    //{
    //    string lang = string.Empty;
    //    HttpCookie cookie = Request.Cookies["CurrentLanguage"];

    //    if (cookie != null && cookie.Value != null)
    //    {
    //        lang = cookie.Value;
    //        CultureInfo Cul = CultureInfo.CreateSpecificCulture(lang);

    //        System.Threading.Thread.CurrentThread.CurrentUICulture = Cul;
    //        System.Threading.Thread.CurrentThread.CurrentCulture = Cul;
    //    }
    //    else
    //    {
    //        if (string.IsNullOrEmpty(lang)) lang = "en-US";
    //        CultureInfo Cul = CultureInfo.CreateSpecificCulture(lang);

    //        System.Threading.Thread.CurrentThread.CurrentUICulture = Cul;
    //        System.Threading.Thread.CurrentThread.CurrentCulture = Cul;

    //        HttpCookie cookie_new = new HttpCookie("CurrentLanguage");
    //        cookie_new.Value = lang;
    //        Response.SetCookie(cookie_new);
    //    }

    //    base.InitializeCulture();
    //}

    protected void LoadInit()
    {
        if (Session.Count == 0)
        {
            Response.Redirect(ResolveUrl("~/logout.aspx"));
        }
    }

}
