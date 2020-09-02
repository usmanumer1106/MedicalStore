using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class user_updatecart : System.Web.UI.Page
{
   
   
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        if (Request.QueryString["sno"] != null)
        {
            
            dt = (DataTable)Session["buyitems"];


            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                int sr;
                int sr1;
                sr = Convert.ToInt32(dt.Rows[i]["sno"].ToString());
                sr1 = Convert.ToInt32( Request.QueryString["sno"]);


                if (sr == sr1)
                {
                    lblname.Text= dt.Rows[i]["Medicine_Name"].ToString();
                    lbldes.Text= dt.Rows[i]["Description"].ToString();
                    lblprice.Text= dt.Rows[i]["Price_Per_Unit"].ToString();
                    lblqty.Text= dt.Rows[i]["Quantity"].ToString();

                 

                    break;

                }
            }
        }
        else
        {
            Response.Redirect("viewcart.aspx");
        }
    }

    protected void btnupdat_Click(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        dt = (DataTable)Session["buyitems"];


        for (int i = 0; i <= dt.Rows.Count - 1; i++)
        {
            int sr;
            int sr1;
            sr = Convert.ToInt32(dt.Rows[i]["sno"].ToString());

            sr1 = Convert.ToInt32(Request.QueryString["sno"]); ;



            if (sr == sr1)
            {


                int totalquantity;
                totalquantity = Convert.ToInt32(txtqty.Text) * Convert.ToInt32(dt.Rows[i]["Price_Per_Unit"].ToString());

                dt.Rows[i]["sno"] = sr1;
                dt.Rows[i]["Medicine_Name"] = lblname.Text;
                dt.Rows[i]["Price_Per_Unit"] = lblprice.Text;
                dt.Rows[i]["Quantity"] = txtqty.Text;
                dt.Rows[i]["Quantity"] = txtqty.Text;
                dt.Rows[i]["Total_Price"] = totalquantity;
              
                dt.AcceptChanges();

                break;

            }
        }
        Response.Redirect("viewcart.aspx");
    }

}

