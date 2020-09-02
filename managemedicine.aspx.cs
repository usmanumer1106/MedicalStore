using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class managemedicine : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack) return;
        using (MedicalStoreEntities db = new MedicalStoreEntities())
        {
            var company = db.Get_Medicine_Company();
            ddlcompany.DataSource = company;
            ddlcompany.DataTextField = "Company_Name";
            ddlcompany.DataValueField = "Company_ID";
            ddlcompany.DataBind();

            if (Request.QueryString["medicineid"] != null)
            {
                save.Text = "Update";
                int userid = Convert.ToInt32(Request.QueryString["medicineid"]);
                tblmedicine tbl = db.tblmedicines.FirstOrDefault(v => v.Medicine_ID == userid);
                txtLocation.Text = tbl.Location;
                txtMedicineName.Text = tbl.Medicine_Name;
                txtMedicineName.ReadOnly = true;
                txtppu.Text = Convert.ToString( tbl.Price_Per_Unit);
                txtQuantity.Text = Convert.ToString( tbl.Quantity);
                txtDescription.Text = tbl.Description;
                ddlcompany.SelectedValue = tbl.Company_ID.ToString();
                DateTime date = Convert.ToDateTime(tbl.Expiry_Date);
                txtExpDate.Text = date.ToShortDateString();
                
            }
        }
    }

    protected void save_Click(object sender, EventArgs e)
    {

        using (MedicalStoreEntities db = new MedicalStoreEntities())
        {
            if (Request.QueryString["medicineid"] != null)
            {
                int userid = Convert.ToInt32(Request.QueryString["medicineid"]);
                tblmedicine tbl = db.tblmedicines.FirstOrDefault(v => v.Medicine_ID == userid);
                tbl.Medicine_Name = txtMedicineName.Text;
                tbl.Price_Per_Unit = Convert.ToInt32(txtppu.Text);
                tbl.Location = txtLocation.Text;
                tbl.Quantity =Convert.ToInt32( txtQuantity.Text);
                tbl.Description = txtDescription.Text;
                tbl.Company_ID = Convert.ToInt32(ddlcompany.SelectedValue);
                tbl.Expiry_Date = Convert.ToDateTime(txtExpDate.Text);
                if (FileUpload.HasFile == true)
                {
                    string a, b;
                    a = RandomName.GetRandomName(10).ToString();
                    FileUpload.SaveAs(Request.PhysicalApplicationPath + "/Images/" + a + FileUpload.FileName.ToString());
                    b = "/Images/" + a + FileUpload.FileName.ToString();
                    tbl.Image = b;
                }
                db.SaveChanges();
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "xyz", "alert('Medicine Updated Successfully!');", true);
                Response.Redirect("listmedicine.aspx");
            }
            else
            {
                using (var dbd = new MedicalStoreEntities())
                {
                    var query = dbd.Check_Medicine_Name(txtMedicineName.Text).ToList();
                    if (query.Count > 0)
                    {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "xyz", "alert('Same Medicine Already Exsisted!');", true);
                    }
                    else
                    {
                        tblmedicine tbl = new tblmedicine();
                        tbl.Medicine_Name = txtMedicineName.Text;
                        tbl.Price_Per_Unit = Convert.ToInt32(txtppu.Text);
                        tbl.Location = txtLocation.Text;
                        tbl.Quantity = Convert.ToInt32( txtQuantity.Text);
                        tbl.Description = txtDescription.Text;
                        tbl.Company_ID = Convert.ToInt32(ddlcompany.SelectedValue);
                        tbl.Expiry_Date = Convert.ToDateTime(txtExpDate.Text);
                        string a, b;
                        a = RandomName.GetRandomName(10).ToString();
                        FileUpload.SaveAs(Request.PhysicalApplicationPath + "/Images/" + a + FileUpload.FileName.ToString());
                        b = "/Images/" + a + FileUpload.FileName.ToString();
                        tbl.Image = b;
                        db.tblmedicines.Add(tbl);
                        db.SaveChanges();
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "abc", "alert('Medicine Added Successfully!');", true);
                        Response.Redirect("listmedicine.aspx");
                    }
                }
            }
        }

    }
}