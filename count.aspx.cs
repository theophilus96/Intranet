using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    int count = 1;
    protected void Page_Load(object sender, EventArgs e)
    {
        //ArrayList names = new ArrayList { "@user" };
        //ArrayList values = new ArrayList { Session["user"].ToString() };

        //DataSet ds5 = Database.RunSP("sp_icons_selectSome", names, values);

       // Response.Write(Session["link"]);
        Response.Write(Session["user"]);
        String link = Convert.ToString(Session["link"]);//taking the link from testDB
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
        }
        

        Response.Redirect(link);
    }
}

    //protected void btn_Click(object sender, EventArgs e)
    //{
    //    if (int.TryParse(lbl.Text, out count))
    //    {
    //        lbl.Text = (++count).ToString();
    //        Session.Add("count", count);
    //        ArrayList param = new ArrayList { "@count" };
    //        ArrayList value = new ArrayList { count };
    //        DataSet ds = Database.RunSP("sp_icon_counter", param, value);
    //    }
    //}

