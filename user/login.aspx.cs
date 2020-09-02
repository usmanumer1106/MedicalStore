using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnlogin_Click(object sender, EventArgs e)
    {
        using (var db = new MedicalStoreEntities())
        {
            string pass = EncryptDecrypt.EncodePasswordToBase64(txtpassword.Text);
            var query = db.DoLogin(txtemail.Text, pass).ToList();
            if (query.Count > 0)
            {
                if (Session["checkout"]!=null)
                {
                    Session["user"] = txtemail.Text;
                    Session["userid"] = query[0].User_ID;
                    Response.Redirect("checkout.aspx");
                 }
                else
                {
                    Session["user"] = txtemail.Text;
                    Session["userid"] = query[0].User_ID;
                    Response.Redirect("medicine.aspx");
                }
                    
            }
            else
            {
                lblmsg.Text = "Invalid email address or password!";
            }
        }
    }
}