using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class displayfullorder : System.Web.UI.Page
{
    int total=0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack == true)
            return;
        if(Request.QueryString["id"]==null)
        {
            Response.Redirect("homepage.aspx");
        }
        using (MedicalStoreEntities db = new MedicalStoreEntities())
        {
            int idd = Convert.ToInt32(Request.QueryString["id"]);
            tblorder tbl = db.tblorders.FirstOrDefault(v => v.id == idd);
            status.SelectedValue = tbl.status.ToString();
        }

        int id = Convert.ToInt32((Request.QueryString["id"]));
        using (var db = new MedicalStoreEntities())
        {
            var dis = db.Select_Order_By_ID(id).ToList();
            GV2.DataSource = dis;
            GV2.DataBind();

            var displayorder = db.Display_Order_Detail(id).ToList();
            GV.DataSource = displayorder;
            foreach(var abc in displayorder)
            {
                total = total + Convert.ToInt32 (Convert.ToInt32( abc.productprice)* abc.productquantity);
            }
            GV.DataBind();
        }
        lbltotalprice.Text = Convert.ToString( total);

    }
    protected void btnchangestatus_Click(object sender, EventArgs e)
    {
        using (MedicalStoreEntities db = new MedicalStoreEntities())
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);

            tblorder tbl = db.tblorders.FirstOrDefault(v => v.id == id);
            tbl.status = Convert.ToInt32(status.SelectedValue);

            db.SaveChanges();
            Response.Redirect("displayorder.aspx");

        }
    }
}