using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Drawing;

public partial class ContactUs : ProjectPageBase
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSendMessage_Click(object sender, EventArgs e)
    {
        try
        {
            if (tbCFH.Text != "")
            {
                Response.Redirect("Default.aspx");
                return;
            }
            lbError.Text = "";
            lbError.Visible = false;
            SendEmail(Resources.Vikkisoft.MessageFrom + " " + tbName.Text + " (" + tbEmailAddress.Text + ")",
                tdComments.Text, tbEmailAddress.Text, false);
            tdComments.Text = "";
            ShowMessage(Resources.Vikkisoft.MessageSent, Color.Yellow);
        }
        catch (Exception ex)
        {
            ShowMessage(ex.Message, Color.Red);
        }
    }

    private void SendEmail(string subject, string body, string replyEmail, bool isHTML)
    {
        int portNumber;
        int.TryParse(System.Configuration.ConfigurationManager.AppSettings["SMTPServerPort"],
                     out portNumber);
        SmtpClient client;
        if (portNumber > 0)
        {
            client = new SmtpClient(System.Configuration.ConfigurationManager.AppSettings["SMTPServer"], portNumber);
        }
        else
        {
            client = new SmtpClient(System.Configuration.ConfigurationManager.AppSettings["SMTPServer"]);
        }
        MailAddress from =
            new MailAddress(System.Configuration.ConfigurationManager.AppSettings["FromEmail"]);
        MailAddress to = new MailAddress(System.Configuration.ConfigurationManager.AppSettings["ToEmail"].Trim());
        MailMessage message = new MailMessage(from, to);
        message.ReplyToList.Add(new MailAddress(replyEmail));
        message.Body = body;
        message.IsBodyHtml = isHTML;
        message.Subject = subject;
        message.BodyEncoding = System.Text.Encoding.UTF8;
        message.SubjectEncoding = System.Text.Encoding.UTF8;
        if (System.Configuration.ConfigurationManager.AppSettings["EmailAccountPassword"].Trim() != "")
        {
            client.Credentials =
                new System.Net.NetworkCredential(
                    System.Configuration.ConfigurationManager.AppSettings["FromEmail"],
                    System.Configuration.ConfigurationManager.AppSettings["EmailAccountPassword"]);
        }
        client.Send(message);
    }

    private void ShowMessage(string message, Color color)
    {
        lbError.Text = message;
        lbError.ForeColor = color;
        lbError.Visible = true;
    }
}