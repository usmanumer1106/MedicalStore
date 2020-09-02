using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class user_productdiscription : System.Web.UI.Page
{
    int qty;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Request.QueryString["id"] != null)
        {
            using (MedicalStoreEntities db = new MedicalStoreEntities())
            {

                int medicineid = Convert.ToInt32(Request.QueryString["id"]);
                var medicine = db.Get_Medicine_By_Id(medicineid).ToList();

                GV.DataSource = medicine;
                GV.DataBind();
                
               
                foreach (var abc in medicine)
                {
                    qty = abc.Quantity;
                }
                if (qty == 0)
                {
                    lblquantity.Text = "Item Not Availible";
                    txtquantity.Visible = false;
                    btnaddtocart.Visible = false;
                    lblenter.Visible = false;
                }
               

            }
        }
        else
            Response.Redirect("medicine.aspx");
    }
    string Medicine_Name, Price_per_Unit, Image, Description, Company_Name, Quantity;
    protected void btnaddtocart_Click(object sender, EventArgs e)
    {
        using (MedicalStoreEntities db = new MedicalStoreEntities())
        {

            int medicineid = Convert.ToInt32(Request.QueryString["id"]);
            var medicine = db.Get_Medicine_By_Id(medicineid).ToList();
            foreach (var abc in medicine)
            {
                Image = abc.Image;
                Medicine_Name = abc.Medicine_Name;
                Price_per_Unit = abc.Price_Per_Unit.ToString();
                Description = abc.Description;
                Company_Name = abc.Company_Name;
                Quantity = Convert.ToString(txtquantity.Text);
            }

            if (Convert.ToInt32(txtquantity.Text) > Convert.ToInt32(Quantity))
            {
                lblquantity.Text = "Please Enter Less Amount";

            }
            else
            {
                lblquantity.Text = "";

                DataTable dt = new DataTable();
                DataRow dr;
                dt.Columns.Add("sno");
                dt.Columns.Add("Image");
                dt.Columns.Add("Medicine_Name");
                dt.Columns.Add("Price_Per_Unit");

                dt.Columns.Add("Description");
                dt.Columns.Add("Company_Name");
                dt.Columns.Add("Quantity");
                dt.Columns.Add("Total_Price");
                dt.Columns.Add("id");
                dt.Columns.Add("Medicine_ID");
                int totalprice;
                totalprice =Convert.ToInt32 (Price_per_Unit) * Convert.ToInt32( txtquantity.Text);
                if (Session["buyitems"] == null)
                {

                    dr = dt.NewRow();
                    dr["sno"] = 1;
                    dr["Image"] = Image;
                    dr["Medicine_Name"] = Medicine_Name;
                    dr["Price_Per_Unit"] = Price_per_Unit;
                    dr["Description"] = Description;
                    dr["Company_Name"] = Company_Name;
                    dr["Quantity"] = Quantity;
                    dr["Total_Price"] = totalprice;
                    dr["Medicine_ID"] = medicineid;
                    dt.Rows.Add(dr);
                    Session["buyitems"] = dt;
                }
                else
                {

                    dt = (DataTable)Session["buyitems"];
                    int sr;
                    sr = dt.Rows.Count;
                    dr = dt.NewRow();
                    dr["sno"] = sr + 1;
                    dr["Image"] = Image;
                    dr["Medicine_Name"] = Medicine_Name;
                    dr["Price_Per_Unit"] = Price_per_Unit;
                    dr["Description"] = Description;
                    dr["Company_Name"] = Company_Name;
                    dr["Quantity"] = Quantity;
                    dr["Total_Price"] = totalprice;
                    dr["Medicine_ID"] = medicineid;
                    dt.Rows.Add(dr);
                    Session["buyitems"] = dt;


                }
            }

            Response.Redirect("productdiscription.aspx?id=" + medicineid.ToString());

        }

    }
}
