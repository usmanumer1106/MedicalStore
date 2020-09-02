using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class listuser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        listuserfunction();
    }
    protected void listuserfunction()
    {
        using (var db = new MedicalStoreEntities())
        {
            var users = db.Get_Users().ToList();
            GV.DataSource = users;
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
            Response.Redirect("manageuser.aspx?userid=" + e.CommandArgument);
        }
        else if (e.CommandName == "Delete")
        {
            using (var db = new MedicalStoreEntities())
            {
                int userid = Convert.ToInt32(e.CommandArgument);
                db.Delete_User(userid);
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "abc", "alert('User Deleted Successfully!');", true);
                listuserfunction();
            }
        }
    }


    protected void btnadduser_Click(object sender, EventArgs e)
    {
        Response.Redirect("manageuser.aspx");
    }
    protected void btnsearch_Click(object sender, EventArgs e)
    {
        using (var db = new MedicalStoreEntities())
        {
            var users = db.Search_User(txtSearch.Text).ToList();
            GV.DataSource = users;
            GV.DataBind();
        }
    }
}