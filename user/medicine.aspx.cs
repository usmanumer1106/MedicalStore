using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



public partial class user_product : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
 
        using (var db = new MedicalStoreEntities())
        {
            var medicine = db.Get_Medicine().ToList();
            GV.DataSource = medicine;
            GV.DataBind();
        }

    }

    protected void btnsearch_Click(object sender, EventArgs e)
    {
        using (var db = new MedicalStoreEntities())
        {
           
                
                var medicine = db.Seacrch_Medicine(txtSearch.Text).ToList();
                GV.DataSource = medicine;
                GV.DataBind();
           

        }
    }
}