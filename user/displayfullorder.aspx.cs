using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_displayfullorder : System.Web.UI.Page
{
    int total = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = Convert.ToInt32((Request.QueryString["id"]));
        using (var db = new MedicalStoreEntities())
        {
            var dis = db.Select_Order_By_ID(id).ToList();
            GV2.DataSource = dis;
            GV2.DataBind();

            var displayorder = db.Display_Order_Detail(id).ToList();
            GV.DataSource = displayorder;
            foreach (var abc in displayorder)
            {
                total = total + Convert.ToInt32(Convert.ToInt32(abc.productprice) * abc.productquantity);
            }
            GV.DataBind();
        }
        lbltotalprice.Text = Convert.ToString(total);

    }
}