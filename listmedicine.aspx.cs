using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class listmedicine : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Listmedicine();
    }
    protected void Listmedicine()
    {
        using (var db = new MedicalStoreEntities())
        {
            var medicine = db.Get_Medicine().ToList();
            GV.DataSource = medicine;
            GV.DataBind();
        }
    }

    protected void GV_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }

    protected void GV_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void GV_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Edit")
        {
            Response.Redirect("managemedicine.aspx?medicineid=" + e.CommandArgument);
        }
        else if (e.CommandName == "Delete")
        {
            using (var db = new MedicalStoreEntities())
            {
                int medicineid = Convert.ToInt32(e.CommandArgument);
                db.Delete_Medicine(medicineid);
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "abc", "alert('Medicine Deleted Successfully!');", true);
                Listmedicine();
            }
        }
    }

    protected void btnaddmedicine_Click(object sender, EventArgs e)
    {
        Response.Redirect("managemedicine.aspx");
    }
    protected void btnsearch_Click(object sender, EventArgs e)
    {
        using (var db = new MedicalStoreEntities())
        {
            var users = db.Seacrch_Medicine(txtSearch.Text).ToList();
            GV.DataSource = users;
            GV.DataBind();
        }
    }
}