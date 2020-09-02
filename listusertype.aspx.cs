using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class listusertype : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        listusertypefunction();
    }
    protected void listusertypefunction()
    {
        using (var db = new MedicalStoreEntities())
        {
            var usertype = db.Get_User_Type().ToList();
            GV.DataSource = usertype;
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
            Response.Redirect("manageusertype.aspx?userid=" + e.CommandArgument);
        }
        else if (e.CommandName == "Delete")
        {
            using (var db = new MedicalStoreEntities())
            {
                int userid = Convert.ToInt32(e.CommandArgument);
                db.Delet_User_Type(userid);
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "abc", "alert('User Type Deleted Successfully!');", true);
                listusertypefunction();
            }
        }
    }

    protected void btnaddusertype_Click(object sender, EventArgs e)
    {
        Response.Redirect("manageusertype.aspx");
    }
    protected void btnsearch_Click(object sender, EventArgs e)
    {
        using (var db = new MedicalStoreEntities())
        {
            var users = db.Seacrch_User_Type(txtSearch.Text).ToList();
            GV.DataSource = users;
            GV.DataBind();
        }
    }
}