using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class manageusertype : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (IsPostBack) return;
        using (MedicalStoreEntities db = new MedicalStoreEntities())
        {
            if (Request.QueryString["userid"] != null)
            {
                save.Text = "Update";
                int userid = Convert.ToInt32(Request.QueryString["userid"]);
                tblusertype tbl = db.tblusertypes.FirstOrDefault(v => v.Type_ID == userid);
                txtUserType.Text = tbl.Type_Name;
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
                tblusertype tbl = db.tblusertypes.FirstOrDefault(v => v.Type_ID == userid);
                tbl.Type_Name = txtUserType.Text;
                db.SaveChanges();
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "xyz", "alert('Type Updated Successfully!');", true);
                Response.Redirect("listusertype.aspx");

            }
            else
            {
                using (var dbd = new MedicalStoreEntities())
                {
                    var query = dbd.Check_User_Type(txtUserType.Text).ToList();
                    if (query.Count > 0)
                    {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "xyz", "alert('Same User Type Already Exsisted!');", true);
                    }
                    else
                    {
                        tblusertype tbl = new tblusertype();
                        tbl.Type_Name = txtUserType.Text;
                        db.tblusertypes.Add(tbl);
                        db.SaveChanges();
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "abc", "alert('User Added Successfully!');", true);
                        Response.Redirect("listusertype.aspx");
                    }
                }


            }

        }
    }
}