using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_stdusersetup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        status.Visible = false;
        status.SelectedValue = "1";
        ddlrole.Visible = false;
        
        if (IsPostBack) return;
        using (MedicalStoreEntities db = new MedicalStoreEntities())
        {
            var usertype = db.Get_User_Type();
            ddlrole.DataSource = usertype;
            ddlrole.DataTextField = "Type_Name";
            ddlrole.DataValueField = "Type_ID";
            ddlrole.DataBind();

            if (Request.QueryString["userid"] != null)
            {
                
                btnregister.Text = "Update";
                int userid = Convert.ToInt32(Request.QueryString["userid"]);
                tbluser tbl = db.tblusers.FirstOrDefault(v => v.User_ID == userid);
                txtfirstname.Text = tbl.First_Name;
                txtlastname.Text = tbl.Last_Name;
                txtemail.Text = tbl.Email_Address;
                txtphonenumber.Text = tbl.Mobile_No;
                txtemail.ReadOnly = true;
                DateTime date = Convert.ToDateTime(tbl.Date_Of_Birth);
                txtdob.Text = date.ToShortDateString();
                txtpassword.TextMode = TextBoxMode.SingleLine;
                string pass = EncryptDecrypt.DecodeFrom64(tbl.Password);
                txtpassword.Text = pass;
                txtconfirmpassword.TextMode = TextBoxMode.SingleLine;
                txtconfirmpassword.Text = pass;
                txtcity.Text = tbl.City;
                txtaddress.Text = tbl.Address;
                txtpostalcode.Text =Convert.ToString( tbl.Zip_Code);
                txtState.Text = tbl.State;
            }
        }
    }

    protected void btnregister_Click(object sender, EventArgs e)
    {
        
        using (MedicalStoreEntities db = new MedicalStoreEntities())
        {
            if (Request.QueryString["userid"] != null)
            {
                int userid = Convert.ToInt32(Request.QueryString["userid"]);
                tbluser tbl = db.tblusers.FirstOrDefault(v => v.User_ID == userid);
                tbl.First_Name = txtfirstname.Text;
                tbl.Last_Name = txtlastname.Text;
                string pass = EncryptDecrypt.EncodePasswordToBase64(txtpassword.Text);
                tbl.Password = pass;
                tbl.Mobile_No = txtphonenumber.Text;
                tbl.Address = txtaddress.Text;
                tbl.State = txtState.Text;
                tbl.City = txtcity.Text;
                tbl.Zip_Code = Convert.ToInt32(txtpostalcode.Text);
               
                tbl.Date_Of_Birth = Convert.ToDateTime(txtdob.Text);
          
                db.SaveChanges();
                if (Session["update"] != null)
                    Response.Redirect("updateorderdetail.aspx");
                Response.Redirect("myprofile.aspx");
                
            }
            else
            {
                using (var dbd = new MedicalStoreEntities())
                {
                    var query = dbd.CheckEmail(txtemail.Text).ToList();
                    if (query.Count > 0)
                    {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "xyz", "alert('User With Same Email Already Exsisted!');", true);
                    }
                    else
                    {
                        tbluser tbl = new tbluser();
                        tbl.First_Name = txtfirstname.Text;
                        tbl.Last_Name = txtlastname.Text;
                        string pass = EncryptDecrypt.EncodePasswordToBase64(txtpassword.Text);
                        tbl.Password = pass;
                        tbl.Email_Address = txtemail.Text;
                        tbl.Date_Of_Birth = Convert.ToDateTime(txtdob.Text);
                       
                        tbl.Mobile_No = txtphonenumber.Text;
                        tbl.Address = txtaddress.Text;
                        tbl.State = txtState.Text;
                        tbl.City = txtcity.Text;
                        tbl.Zip_Code = Convert.ToInt32( txtpostalcode.Text);
                        tbl.Type_ID = Convert.ToInt32(ddlrole.SelectedValue);
                        tbl.Status = Convert.ToInt32(status.SelectedValue);
                        db.tblusers.Add(tbl);
                        db.SaveChanges();
                        Response.Redirect("login.aspx");
                       
                    }
                }
            }
        }
    }
}
