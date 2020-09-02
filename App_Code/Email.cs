using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;

/// <summary>
/// Summary description for Email
/// </summary>
public class Email
{
    public Email()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static bool SendEmail(string toadd, string subject, string msg , string cc="", string bcc="", string attachedfile=null)
    {
        MailMessage message = new MailMessage();
        SmtpClient client = new SmtpClient();
        try
        {
            string sendingEmail = "", MailServer = "", SendingPassword = "";
            sendingEmail = "abc@gmail.com";
            MailServer = "smtp.gmail.com";
            SendingPassword = "*******";
            int ServerPort = 587;
            message.IsBodyHtml = true;
            message.From = new MailAddress(sendingEmail, "Noreply");
            message.To.Add(new MailAddress(toadd.ToString()));
            if (cc != "")
            {
                message.CC.Add(new MailAddress(cc));
            }
            if(bcc!="")
            {
                message.CC.Add(new MailAddress(bcc));

            }
            if (attachedfile != null)
            {
                Attachment attach = null;
                string[] attachArr= attachedfile.Split('*');
                foreach (string obj in attachArr)
                {
                    attach = new System.Net.Mail.Attachment(obj);
                    message.Attachments.Add(attach);
                }
            }
            message.Body = msg;
            message.Subject = subject;
            client.Host = MailServer;
            client.Port = ServerPort;
            client.EnableSsl = true;
            client.UseDefaultCredentials = true;
            client.Credentials = new System.Net.NetworkCredential(sendingEmail, SendingPassword);
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.Send(message);
            return true;
        }
        catch (Exception) {
            return false;
        }
        finally
        {
            message = null;
            client = null;
        }
    }
}