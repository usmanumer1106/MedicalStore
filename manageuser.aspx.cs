using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class manageuser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Request.QueryString["userid"] != null) { }
        else
        {
            status.SelectedValue = "1";
            status.Attributes.Add("disabled", "disabled");
        }
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
                save.Text = "Update";
                int userid = Convert.ToInt32(Request.QueryString["userid"]);
                tbluser tbl = db.tblusers.FirstOrDefault(v => v.User_ID == userid);
                txtFirstName.Text = tbl.First_Name;
                txtLastName.Text = tbl.Last_Name;
                txtEmail.Text = tbl.Email_Address;
                txtMobileNo.Text = tbl.Mobile_No;
                txtEmail.ReadOnly = true;
                ddlrole.SelectedValue = tbl.Type_ID.ToString();
                DateTime date = Convert.ToDateTime(tbl.Date_Of_Birth);
                txtDateOfBirth.Text = date.ToShortDateString();
                Password.TextMode = TextBoxMode.SingleLine;
                string pass = EncryptDecrypt.DecodeFrom64(tbl.Password);
                Password.Text = pass;
                ConfirmPassword.TextMode = TextBoxMode.SingleLine;
                ConfirmPassword.Text = pass;
                if (tbl.Status ==  1)
                {
                    status.SelectedValue = "1";

                }
                else
                    status.SelectedValue = "0";

            }
        }
    }

    protected void save_Click(object sender, EventArgs e)
    {

        using (MedicalStoreEntities db = new MedicalStoreEntities())
        {
            if (Request.QueryString["userid"] != null)
            {
                int userid = Convert.ToInt32(Request.QueryString["userid"]);
                tbluser tbl = db.tblusers.FirstOrDefault(v => v.User_ID == userid);
                tbl.First_Name = txtFirstName.Text;
                tbl.Last_Name = txtLastName.Text;
                string pass = EncryptDecrypt.EncodePasswordToBase64(Password.Text);
                tbl.Password = pass;
                tbl.Mobile_No = txtMobileNo.Text;
                tbl.Type_ID = Convert.ToInt32(ddlrole.SelectedValue);
                tbl.Date_Of_Birth = Convert.ToDateTime(txtDateOfBirth.Text);
                tbl.Status = Convert.ToInt32( status.SelectedValue);
                db.SaveChanges();
                //    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "xyz", "alert('User Updated Successfully!');", true);
                Response.Redirect("listuser.aspx");
            }
            else
            {
                using (var dbd = new MedicalStoreEntities())
                {
                    var query = dbd.CheckEmail(txtEmail.Text).ToList();
                    if (query.Count > 0)
                    {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "xyz", "alert('User With Same Email Already Exsisted!');", true);
                    }
                    else
                    {
                        tbluser tbl = new tbluser();
                        tbl.First_Name = txtFirstName.Text;
                        tbl.Last_Name = txtLastName.Text;
                        string pass = EncryptDecrypt.EncodePasswordToBase64(Password.Text);
                        tbl.Password = pass;
                        tbl.Email_Address = txtEmail.Text;
                        tbl.Date_Of_Birth = Convert.ToDateTime(txtDateOfBirth.Text);
                        tbl.Mobile_No = txtMobileNo.Text; 
                        tbl.Type_ID = Convert.ToInt32(ddlrole.SelectedValue);
                        tbl.Status =Convert.ToInt32(status.SelectedValue);
                        db.tblusers.Add(tbl);
                        db.SaveChanges();
                        //   Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "abc", "alert('User Added Successfully!');", true);
                        Response.Redirect("listuser.aspx");
                    }
                }
            }
        }
    }
  
}