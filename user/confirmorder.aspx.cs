using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class user_confirmorder : System.Web.UI.Page
{
    string order = "";
    string order_id;
   
    protected void Page_Load(object sender, EventArgs e)
    {
        order = Request.QueryString["order"].ToString();
        if (order == Session["order_no"].ToString())
        {
            using (MedicalStoreEntities db = new MedicalStoreEntities())
            {
                string useremail = Convert.ToString(Session["user"].ToString());
                tbluser tbl = db.tblusers.FirstOrDefault(v => v.Email_Address == useremail);
                tblorder tbl2 = new tblorder();
                tbl2.address = tbl.Address;
                tbl2.city = tbl.City;
                tbl2.email = tbl.Email_Address;
                tbl2.firstname = tbl.First_Name;
                tbl2.lastname = tbl.Last_Name;
                tbl2.phone = tbl.Mobile_No;
                tbl2.postalcode = Convert.ToString(tbl.Zip_Code);
                db.tblorders.Add(tbl2);
                db.SaveChanges();


                var abc = db.Get_Order_ID(Session["user"].ToString());
                foreach (var d in abc)
                {
                    order_id = Convert.ToString(d.id);
                }
            }



            DataTable dt = new DataTable() ;
            dt = (DataTable)Session["buyitems"];
            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                using (MedicalStoreEntities db = new MedicalStoreEntities())
                    {
                    int quantity= Convert.ToInt32(dt.Rows[i]["Quantity"]);
                    int medicineid= Convert.ToInt32(dt.Rows[i]["Medicine_ID"]);
                    tblorderdetail tbl = new tblorderdetail();
                        tbl.orderid = Convert.ToInt32(order_id);
                        tbl.productimage =Convert.ToString( dt.Rows[i]["Image"]);
                        tbl.productname = Convert.ToString(dt.Rows[i]["Medicine_Name"]);
                        tbl.productprice = Convert.ToString(dt.Rows[i]["Price_Per_Unit"]);
                        tbl.productquantity = Convert.ToInt32(dt.Rows[i]["Quantity"]);
                        db.tblorderdetails.Add(tbl);
                        db.SaveChanges();
                    tblmedicine tbl2 = db.tblmedicines.FirstOrDefault(v => v.Medicine_ID == medicineid);
                    tbl2.Quantity = tbl2.Quantity - quantity;
                    db.SaveChanges();
                }


                }
            }


        Session["buyitems"] = null;
        Response.Redirect("medicine.aspx");
        }

        
    }
