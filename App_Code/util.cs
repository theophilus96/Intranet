using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.Security;
using System.Net.Mail;


public class Util
{
    public static bool isAdminUser(string userLevel)
    {
        if (userLevel == "99")
            return true;
        else
            return false;
    }

    public static void checkUserAccess()
    {
        if (!Util.isAdminUser(Util.getLoginUser().Split('|')[1]))
        {
            HttpContext.Current.Response.Redirect("AccessDeny.aspx");
        }
    }

    public static void SetLoginCookie(string userInfo)
    {
        DestroyCookies();
        HttpCookie cookie = new HttpCookie("Biz-Panel_userInfo");
        cookie["Biz-Panel_userInfo"] = userInfo;
        cookie.Expires = DateTime.Now.AddDays(1);
        HttpContext.Current.Response.AppendCookie(cookie);
    }

    public static string getLoginUser()
    {
        //string loginUser = "andy|99";
        string loginUser = "";
        try
        {
            HttpCookie cookie = HttpContext.Current.Request.Cookies["Biz-Panel_userInfo"];
            if ((cookie != null) && (!string.IsNullOrEmpty(cookie["Biz-Panel_userInfo"])))
            {
                loginUser = cookie["Biz-Panel_userInfo"].ToString();
            }
            else
            {
                HttpContext.Current.Response.Redirect("Login.aspx");
            }
        }
        catch
        {
            HttpContext.Current.Response.Redirect("Login.aspx");
        }

        return loginUser;
    }

    public static void DestroyCookies()
    {
        //HttpCookie Login = new HttpCookie("Login");
        HttpCookie Login = HttpContext.Current.Request.Cookies["BizPanel_userInfo"];
        if (Login != null)
        {
            Login.Expires = DateTime.Now.AddDays(-1);
            Login.Value = "";
            HttpContext.Current.Response.AppendCookie(Login);
        }
    }

    public static void userLoginLog(string logType, string userID, DateTime curDate)
    {
        ArrayList names = new ArrayList();
        ArrayList vals = new ArrayList();
        names.Add("@userName"); vals.Add(userID);
        names.Add("@LoginDesc"); vals.Add(logType);
        names.Add("@datetime"); vals.Add(curDate);
        Database.RunNonQuery("SP_LoginUsersHistory_Insert", names, vals);
    }
    public static string getSecurityMenuID(string menuName)
    {
        string menuID = "0";
        string sql = "Select * from tbl_Security_Menu where Menu_Name = '" + menuName + "'";

        DataSet ds = Database.RunSQL(sql);
        if (ds.Tables[0].Rows.Count > 0)
        {
            menuID = ds.Tables[0].Rows[0]["Menu_Parent_ID"].ToString();
        }

        ds.Dispose();

        return menuID;
    }

    public static DataSet getDomains()
    {
        return getDomains("");
    }

    public static DataSet getDomains(string userID)
    {
        DataSet ds = new DataSet();

        string sql = "SELECT * FROM  tbDomains  ";

        if (userID != "")
        {
            sql = sql + " INNER JOIN  tbUserDomains ON tbUserDomains.userDomain = tbDomains.domainName ";
            sql = sql + "where tbUserDomains.userLoginID = '" + userID + "' ";
        }

        sql = sql + "order by tbDomains.domainName";

        ds = Database.RunSQL(sql);

        return ds;
    }

    public static DataSet getDomainsByDomainName(string domainName)
    {
        DataSet ds = new DataSet();

        string sql = @"SELECT * FROM  tbDomains 
            where domainName = '" + domainName + @"' 
            order by domainName";

        ds = Database.RunSQL(sql);

        return ds;
    }

    public static string getEmailServiceKey()
    {
        return "ABCD-EFGH-IJKL-MNOP-QRST-UVWX-YZ";
    }

    public static bool IsValidEmail(string emailaddress)
    {
        if (emailaddress != "")
        {
            try
            {
                MailAddress m = new MailAddress(emailaddress);
                return true;
            }
            catch (FormatException)
            {
                return false;
            }
        }
        else
        {
            return false;
        }
    }
}

