using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class myaccount : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User_ID"] != null)
        {
            using (MedicalStoreEntities db = new MedicalStoreEntities())
            {
                int userid = Convert.ToInt32(Session["User_ID"]);
                tbluser tbl = db.tblusers.FirstOrDefault(v => v.User_ID == userid);
             
               

                lblemail.Text = tbl.Email_Address;
                lblname.Text = tbl.First_Name + " " + tbl.Last_Name;
                lblphoneno.Text = tbl.Mobile_No;
              
                DateTime date = Convert.ToDateTime(tbl.Date_Of_Birth);
                lbldob.Text = date.ToShortDateString();
            }
        }
        else
            Response.Redirect("loginpage.aspx");

    }

    protected void btnupdate_Click(object sender, EventArgs e)
    {
        Response.Redirect("manageuser.aspx?userid=" + Session["User_ID"]);
    }
}
