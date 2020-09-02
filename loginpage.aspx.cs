using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class loginpage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Request.Cookies["MedicalStore"]!=null)
        {
            Session["User_ID"] = Request.Cookies["MedicalStore"]["User_ID"];
            Session["First_Name"] = Request.Cookies["MedicalStore"]["First_Name"];
            Session.Timeout = 720;
            Response.Redirect("homepage.aspx");
        }
    }
    protected void Login_Click(object sender, EventArgs e)
    {
        using (var db = new MedicalStoreEntities())
        {
            string pass = EncryptDecrypt.EncodePasswordToBase64(password.Text);
            var query = db.DoLoginAdmin(email.Text, pass).ToList();
            if (query.Count > 0)
            {
                Session["User_ID"] = query[0].User_ID;
                Session["First_Name"] = query[0].First_Name;
                Session.Timeout = 720;
                Response.Cookies["MedicalStore"]["User_ID"] = query[0].User_ID.ToString();
                Response.Cookies["MedicalStore"]["First_Name"] = query[0].First_Name.ToString();
                Response.Cookies["MedicalStore"].Expires = DateTime.Now.AddDays(30);
                Response.Redirect("homepage.aspx");
            }
            else
            {
                label.Text = "Invalid email address or password!";
            }
        }
    }
   
}