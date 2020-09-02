using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class sales : System.Web.UI.Page
{
    public static DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        txtdate.Text = DateTime.Now.ToString("dd-MM-yyyy");
        using (MedicalStoreEntities db = new MedicalStoreEntities())
        {
            var usertype2 = db.Get_Medicine();
            if (IsPostBack == false)
            {
                var usertype = db.Get_Medicine();
                ddlmedicine.DataSource = usertype;
                ddlmedicine.DataTextField = "Medicine_Name";
                ddlmedicine.DataValueField = "Medicine_ID";
                ddlmedicine.DataBind();
            }
            foreach (var tbl in usertype2)
            {
                if (tbl.Medicine_Name == ddlmedicine.SelectedItem.Text)
                {
                    txtprice.Text = Convert.ToString(tbl.Price_Per_Unit);
                    if (txtquantity.Text != "")
                        txttotalprice.Text = Convert.ToString(Convert.ToInt32(txtquantity.Text) * tbl.Price_Per_Unit);
                }
                if (txtquantity.Text != "")
                    if (Convert.ToInt32(txtquantity.Text) > Convert.ToInt32(tbl.Quantity))
                    {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "xyz", "alert('Exceed than Limit!');", true);
                    }

            }
        }
        
    }

    protected void add_Click(object sender, EventArgs e)
    {
        if (dt.Rows.Count <= 0)
        {
            dt.Columns.Add("Medicine_Name");
            dt.Columns.Add("Price");
            dt.Columns.Add("Quantity");
            dt.Columns.Add("Total");
            dt.Rows.Add(new object[] { ddlmedicine.SelectedItem.Text, txtprice.Text, txtquantity.Text, txttotalprice.Text });
            GV.DataSource = dt;
            GV.DataBind();
        }
        else
        {
            dt.Rows.Add(new object[] { ddlmedicine.SelectedItem.Text, txtprice.Text, txtquantity.Text, txttotalprice.Text });
            GV.DataSource = dt;
            GV.DataBind();
        }
    }
}