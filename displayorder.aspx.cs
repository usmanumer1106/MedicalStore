using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class displayorder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        using (var db = new MedicalStoreEntities())
        {
            var displayorder = db.Display_Order().ToList();
            GV.DataSource = displayorder;
            GV.DataBind();
        }
    }

    protected void GV_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "viewfullorder")
        {
            Response.Redirect("displayfullorder.aspx?id=" + e.CommandArgument);
        }
    }
}