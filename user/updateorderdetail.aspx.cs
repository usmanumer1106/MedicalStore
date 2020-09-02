using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_updateorderdetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["update"] != null)
            Session["update"] = null;
        if (Session["userid"] != null)
        {
            using (MedicalStoreEntities db = new MedicalStoreEntities())
            {
                int userid = Convert.ToInt32(Session["userid"]);
                tbluser tbl = db.tblusers.FirstOrDefault(v => v.User_ID == userid);
                lbladdress.Text = tbl.Address;
                lblcity.Text = tbl.City;

                lblemail.Text = tbl.Email_Address;
                lblname.Text = tbl.First_Name + " " + tbl.Last_Name;
                lblphoneno.Text = tbl.Mobile_No;
                lblpostalcode.Text = Convert.ToString(tbl.Zip_Code);
                lblstate.Text = tbl.State;
                DateTime date = Convert.ToDateTime(tbl.Date_Of_Birth);
             
            }
        }
        else
            Response.Redirect("login.aspx");
    }


        

    protected void btnupdate_Click(object sender, EventArgs e)
    {
        Session["update"] = "helo";
        Response.Redirect("stdusersetup.aspx?userid=" + Session["userid"]);

    }

    protected void btcontinue_Click(object sender, EventArgs e)
    {
        string order_no = RandomName.GetRandomName(10).ToString();
        Session["order_no"] = order_no.ToString();

        Response.Redirect("confirmorder.aspx?order=" + order_no);
    }
}