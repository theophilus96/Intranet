using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //random number
        Random rnd = new Random();
        int num = rnd.Next(10000,99999);

        //change random number to string
        challenge.Value = num.ToString();

        Session.Add("challenge", num);

        //string returnURL = Request.Url.AbsoluteUri;
        string returnURL1 = Request.ServerVariables["SERVER_NAME"];
        string returnPORT = Request.ServerVariables["SERVER_PORT"];


        //returnstr = returnURL.ToString();
        returnURL.Value ="http://" + returnURL1 + ":" + returnPORT + "/loginsuccess.aspx";
        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {


    }
}