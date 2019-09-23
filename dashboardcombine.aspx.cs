using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Collections.Specialized;
using System.Data;
using System.Collections;

public partial class _Default: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = Session["user"].ToString();

        ArrayList names = new ArrayList {"@user"};
        ArrayList values = new ArrayList {Session["user"].ToString()};

        DataSet ds = Database.RunSP("sp_icons_selectSome", names, values);

      
        Repeater1.DataSource = ds;
        Repeater1.DataBind();
        //Response.Write(Session["user"]);

        ArrayList names1 = new ArrayList { };
        ArrayList values1 = new ArrayList { };
        //this is the table from the recommended sites
        DataSet ds1 = Database.RunSP("sp_Rec_selectAll",names1,values1);

        Repeater2.DataSource = ds1;
        Repeater2.DataBind();

        Repeater3.DataSource = ds1;
        Repeater3.DataBind();

        Repeater4.DataSource = ds1;
        Repeater4.DataBind();

    }

    protected void abc(object sender, EventArgs e)
    {

        //String link = butt.CommandName;
        //Session.Add("link",link);
        //Response.Redirect("count.aspx");


        //    //ArrayList names = new ArrayList { "@user" };
        //    //ArrayList values = new ArrayList { Session["user"].ToString() };

        //    //DataSet ds5 = Database.RunSP("sp_icons_selectSome", names, values);

        Response.Write(Session["user"]);
        String id = (((sender as LinkButton).NamingContainer as RepeaterItem).FindControl("Label3") as Label).Text;
        int id2 = Convert.ToInt16(id);
        LinkButton link2 = (LinkButton)(Repeater1.Items[id2].FindControl("link2"));
        String link = link2.CommandName;
        Response.Write(link);
        
        DataSet ds = Database.RunSQL("select UserID from Tbl_User where UserName ='" + Session["user"] + "'");

        Response.Write(ds.Tables[0].Rows[0]["UserID"]);
        int UserID = (int)ds.Tables[0].Rows[0]["UserID"];
        //selecting user id based on the username fromt the session

        DataSet ds2 = Database.RunSQL("select iconID from Tbl_icons where iconLink ='" + link + "'");


        Response.Write(ds2.Tables[0].Rows[0]["iconID"]);
        int iconID = (int)ds2.Tables[0].Rows[0]["iconID"];
        //selecting icon id based on the link

        // count++;
        // //lbl.Text = count.ToString();
        // //Session.Add("count", count);
        ArrayList param = new ArrayList { "@UserID", "iconID" };
        ArrayList value = new ArrayList { UserID, iconID };
        DataSet ds3 = Database.RunSP("sp_getlinkcounter", param, value);

        //string testing = ds3.Tables[0].Rows[0]["LinkCounter"].ToString();
        //Response.Write(ds3.Tables[0].Rows[0]["LinkCounter"]);
        //Response.Write(ds3.Tables[0].Rows.Count);
        //Response.End();
        if (ds3.Tables[0].Rows.Count == 0 || ds3.Tables[0].Rows[0]["LinkCounter"] == null)
        {
            //check if there is any results for ds3, if 0 or null, insert userID,iconID and a value of 1 for LinkCounter
            //if (ds3.Tables[0].Rows[0]["LinkCounter"] == null)
            //{
            ArrayList param3 = new ArrayList { "@UserID", "iconID" };
            ArrayList value3 = new ArrayList { UserID, iconID };
            DataSet ds5 = Database.RunSP("sp_insertNewRow", param3, value3);

            //Response.Write(ds5.Tables[0].Rows[0]["LinkCounter"]);
            //string linktesting = ds5.Tables[0].Rows[0]["LinkCounter"].ToString();
            Response.Redirect(link);
        }

        else
        {
            int LinkCounter = (int)ds3.Tables[0].Rows[0]["LinkCounter"] + 1;
            //using the stored procedure to get the link counter
            Response.Write(LinkCounter);

            ArrayList param2 = new ArrayList { "@UserID", "iconID", "LinkCounter" };
            ArrayList value2 = new ArrayList { UserID, iconID, LinkCounter };
            DataSet ds4 = Database.RunSP("sp_icon_counter", param2, value2);
            //using the stored procedure to update the linkcounter

            //int newValue = (int)ds4.Tables[0].Rows[0]["LinkCounter"];

            //Response.Write(newValue);

            ////Response.Redirect("count.aspx");
            Response.Redirect(link);
        }
    }

    protected void qwe(object sender, EventArgs e)
    {
        //String webtitle = textInput.Text;
        //String weburl = textInput1.Text;
        string webtitle = String.Format("{0}", Request.Form["textInput"]);
        string weburl = String.Format("{0}", Request.Form["textInput1"]);

        //Session.Add("webtitle", webtitle);
        //Session.Add("weburl", weburl);

        //Response.Write(webtitle);
        //Response.Write(weburl);

        ArrayList param4 = new ArrayList { "webtitle", "weburl" };
        ArrayList value4 = new ArrayList { webtitle, weburl };
        DataSet ds6 = Database.RunSP("sp_Rec_selectSome", param4, value4);
    }

    protected void addrecwebsite(object sender, EventArgs e)
    {
        //String webtitle = textInput.Text;
        //String weburl = textInput1.Text;
        string webtitle = String.Format("{0}", Request.Form["textInput2"]);
        string weburl = String.Format("{0}", Request.Form["textInput3"]);

        //Session.Add("webtitle", webtitle);
        //Session.Add("weburl", weburl);

        //Response.Write(webtitle);
        //Response.Write(weburl);

        ArrayList param5 = new ArrayList { "webtitle", "weburl" };
        ArrayList value5 = new ArrayList { webtitle, weburl };
        DataSet ds7 = Database.RunSP("sp_Rec_selectSome", param5, value5);
    }
}