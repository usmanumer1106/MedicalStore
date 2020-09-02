using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class user_viewcart : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        dt= (DataTable)Session["buyitems"];
        GV.DataSource = dt;
        GV.DataBind();
        if (GV.Rows.Count > 0)
        {
            lbltotal.Text = grandtotal().ToString();

        }
        else
        {
            btnorder.Visible = false;
            lbltotal.Text = "No Item in Cart";
           
        }

    }

    protected void btnorder_Click(object sender, EventArgs e)
    {
        Session["checkout"] = "yes";
        Response.Redirect("checkout.aspx");
        
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

    protected void GV_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Edit")
        {
            Response.Redirect("updatecart.aspx?sno=" + e.CommandArgument);
        }
            if (e.CommandName == "Delete")
        {
            DataTable dt = new DataTable();
        dt = (DataTable)Session["buyitems"];
            int sr1;
            sr1 =Convert.ToInt32( e.CommandArgument);
           

            for (int i = 0; i <= dt.Rows.Count - 1; i++)
        {
            int sr;
            
         
            sr = Convert.ToInt32(dt.Rows[i]["sno"].ToString());
          

            if (sr == sr1)
            {
                dt.Rows[i].Delete();
                dt.AcceptChanges();
             
                break;

            }
        }

        for (int i = 1; i <= dt.Rows.Count; i++)
        {
            dt.Rows[i - 1]["sno"] = i;
            dt.AcceptChanges();
        }

        Session["buyitems"] = dt;
        Response.Redirect("viewcart.aspx");
    }
}

    protected void GV_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {

    }

   

    protected void GV_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }
}