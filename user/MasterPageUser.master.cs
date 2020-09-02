using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class user_MasterPageUser : System.Web.UI.MasterPage
{
  
    protected void Page_Load(object sender, EventArgs e)
    {

        DataTable dt = new DataTable();
        dt = (DataTable)Session["buyitems"];
        if (dt != null)
        {

            lbltotalitem.Text = dt.Rows.Count.ToString();
            lbltotalprice.Text = grandtotal().ToString();
        }
        else
        {
            lbltotalitem.Text = "0";
        }

        
    }
    public int grandtotal()
    {
        DataTable dt = new DataTable();
        
        dt = (DataTable)Session["buyitems"];
       
         
            int nrow = dt.Rows.Count;
            int i = 0;
            int gtotal = 0;
            while (i < nrow)
            {
                gtotal = gtotal + Convert.ToInt32(dt.Rows[i]["Total_Price"].ToString());

                i = i + 1;
            }
            return gtotal;
        }
    }


