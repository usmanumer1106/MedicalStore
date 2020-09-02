using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class forgotpassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void sendemail_Click(object sender, EventArgs e)
    {
        using (var db = new MedicalStoreEntities())
        {
            var query = db.Check_ForgotEmail(email.Text).ToList();
            if (query.Count > 0)
            {
                string Name =query[0].First_Name + " " + query[0].Last_Name;
                string Password = DecodeFrom64( query[0].Password);
                Email.SendEmail("usmanumer1106@gmail.com","Dear "+ Name, "Dear " + Name +" Your Password is " +Password);
                label.Text = "Check Your Email";
            }

        }
    }
        public string DecodeFrom64(string encodedData)
    {
        System.Text.UTF8Encoding encoder = new System.Text.UTF8Encoding();
        System.Text.Decoder utf8Decode = encoder.GetDecoder();
        byte[] todecode_byte = Convert.FromBase64String(encodedData);
        int charCount = utf8Decode.GetCharCount(todecode_byte, 0, todecode_byte.Length);
        char[] decoded_char = new char[charCount];
        utf8Decode.GetChars(todecode_byte, 0, todecode_byte.Length, decoded_char, 0);
        string result = new String(decoded_char);
        return result;
    }
}