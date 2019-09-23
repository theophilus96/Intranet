using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class loginsuccess : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)

    {
        //Response.End();
        if (string.IsNullOrEmpty(Request.QueryString["response"]) || string.IsNullOrEmpty(Request.QueryString["user"]))
        {
            Response.Redirect("login.aspx");
        }

        else
        {
            Response.Write(Session["challenge"]);

            int challenge = Convert.ToInt32(Session["challenge"]) * 2;
            int response = Convert.ToInt32(Request.QueryString["response"]);

            if (challenge == response)
            {
                
                Session.Add("user", (Request.QueryString["user"]));
                System.Web.Security.FormsAuthentication.RedirectFromLoginPage(Request.QueryString["user"], false);
                Response.Redirect("dashboardcombine.aspx");
            }

            else
            {
                Response.Redirect("login.aspx");
            }

        }
            //// check for the challenge and respond numbers.
            ////if else validation successful 
            //int session = (int)Session["reponsenum"];
            //lblchallenge.Text = session.ToString();
            //lblchallenge2.Text = response.ToString();

        //if (response == session * 2)
        //{
        //    System.Web.Security.FormsAuthentication.RedirectFromLoginPage(Request.QueryString["user"], false);


        //    Response.Redirect("dashboard.aspx");
        //}
        //else
        //{

        //    Response.Redirect("login.aspx");

        //}



    }
}