using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class listcompany : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack) return;
        Listmedicine();
    }
    protected void Listmedicine()
    {
        using (var db = new MedicalStoreEntities())
        {
            var company = db.Get_Medicine_Company().ToList();
            GV.DataSource = company;
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
            Response.Redirect("managecompany.aspx?companyid=" + e.CommandArgument);
        }
        else if (e.CommandName == "Delete")
        {
            using (var db = new MedicalStoreEntities())
            {
                int companyid = Convert.ToInt32(e.CommandArgument);
                db.Delete_Medicine_Company(companyid);
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "abc", "alert('Company Deleted Successfully!');", true);
                Listmedicine();
            }
        }
    }

    protected void btnaddcompany_Click(object sender, EventArgs e)
    {
        Response.Redirect("managecompany.aspx");
    }
    protected void btnsearch_Click(object sender, EventArgs e)
    {
        using (var db = new MedicalStoreEntities())
        {
            var users = db.Search_Company(txtSearch.Text).ToList();
            GV.DataSource = users;
            GV.DataBind();
        }
    }
}