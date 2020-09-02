using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class managecompany : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack) return;
        using (MedicalStoreEntities db = new MedicalStoreEntities())
        {
            if (Request.QueryString["companyid"] != null)
            {
                save.Text = "Update";
                int companyid = Convert.ToInt32(Request.QueryString["companyid"]);
                tblmedicinecompany tbl = db.tblmedicinecompanies.FirstOrDefault(v => v.Company_ID == companyid);
                txtCompanyName.ReadOnly = true;
                txtCompanyName.Text = tbl.Company_Name;
                txtMobileNo.Text = tbl.Company_Contact_Number;
            }
        }
    }

    protected void save_Click(object sender, EventArgs e)
    {

        using (MedicalStoreEntities db = new MedicalStoreEntities())
        {
            if (Request.QueryString["companyid"] != null)
            {
                int companyid = Convert.ToInt32(Request.QueryString["companyid"]);
                tblmedicinecompany tbl = db.tblmedicinecompanies.FirstOrDefault(v => v.Company_ID == companyid);
                tbl.Company_Name = txtCompanyName.Text;
                tbl.Company_Contact_Number = txtMobileNo.Text;
                db.SaveChanges();
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "xyz", "alert('Company Updated Successfully!');", true);
                Response.Redirect("listcompany.aspx");
            }
            else
            {
                using (var dbd = new MedicalStoreEntities())
                {
                        var query = dbd.Check_Company_Name(txtCompanyName.Text).ToList();
                        if (query.Count > 0)
                        {
                            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "xyz", "alert('Same Company Already Exsisted!');", true);
                        }
                    else
                    {
                        tblmedicinecompany tbl = new tblmedicinecompany();
                        tbl.Company_Name = txtCompanyName.Text;
                        tbl.Company_Contact_Number = txtMobileNo.Text;
                        db.tblmedicinecompanies.Add(tbl);
                        db.SaveChanges();
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "abc", "alert('Company Added Successfully!');", true);
                        Response.Redirect("listcompany.aspx");
                    }
                }
            }
        }

    }
}