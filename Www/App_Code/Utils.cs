﻿using System;
using System.Configuration;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Net.Mail;
using MyGeneration.dOOdads;
using System.Web.UI.WebControls;
using VikkiSoft_BLL;
using System.Collections;
using System.Threading;
using System.Globalization;
using System.Web;

/// <summary>
/// Summary description for Utils
/// </summary>
public class Utils
{
    public static void ShowMessage(System.Web.UI.Control control, string message)
    {
        if (!control.Page.IsClientScriptBlockRegistered(control.ID + "_ERROR_MESSAGE"))
        {
            message = message.Replace("\r", "\\r");
            message = message.Replace("\n", "\\n");
            message = message.Replace("'", "\\'");
            message = message.Replace("\"", "\\");
            control.Page.RegisterClientScriptBlock(control.ID + "_ERROR_MESSAGE", "<script>alert(\"" + message + "\")</script>");
        }
    }

    public static bool IsPagePostBack(System.Web.UI.Page page)
    {
        if (page.IsPostBack)
            return true;

        return IsPageCallBack(page);
    }

    public static bool IsPageCallBack(System.Web.UI.Page page)
    {
        if (page.Request.Params["rcbID"] != null)
            return true;
        return false;
    }

    public static bool IsPagePostBack(System.Web.UI.UserControl control)
    {
        return IsPagePostBack(control.Page);
    }

    public static bool IsEmptyId(string id)
    {
        if (id == null || id == "")
            return true;
        return false;
    }

    public static bool IsValueNull(object value)
    {
        if (value == null || value == DBNull.Value)
            return true;
        return false;
    }

    public static bool GetEntityValueBool(SqlClientEntity entity, string columnName)
    {
        bool entityValueBoll = false;
        if (!entity.IsColumnNull(columnName))
        {
            try
            {
                entityValueBoll = Convert.ToBoolean(entity.GetColumn(columnName).ToString());
            }
            catch { }
        }
        return entityValueBoll;
    }

    public static int GetEntityValueInt(SqlClientEntity entity, string columnName)
    {
        int entityValueInt = 0;
        if (!entity.IsColumnNull(columnName))
        {
            try
            {
                entityValueInt = int.Parse(entity.GetColumn(columnName).ToString());
            }
            catch { }
        }
        return entityValueInt;
    }

    public static decimal GetEntityValueDecimal(SqlClientEntity entity, string columnName)
    {
        decimal entityValueDecimal = 0;
        if (!entity.IsColumnNull(columnName))
        {
            try
            {
                entityValueDecimal = Convert.ToDecimal(entity.GetColumn(columnName).ToString());
            }
            catch { }
        }
        return entityValueDecimal;
    }

    public static void ResizeAndSaveJpgImage(byte[] Content, int MaxWidth, int MaxHeigh, string pathSave,
        bool checkLandscape)
    {
        MemoryStream m = new MemoryStream();
        m.Write(Content, 0, Content.Length);
        Bitmap bmp = new Bitmap(m);
        if (checkLandscape && bmp.Width > bmp.Height)
        {
            int height = MaxWidth;
            MaxWidth = MaxHeigh;
            MaxHeigh = height;
        }
        float K = System.Math.Max((float)bmp.Width / MaxWidth, (float)bmp.Height / MaxHeigh);
        Rectangle oRectangle = new Rectangle(0, 0, (int)(bmp.Width / K), (int)(bmp.Height / K));

        System.Drawing.Image oThumbNail = new Bitmap(oRectangle.Width, oRectangle.Height, bmp.PixelFormat);
        Graphics oGraphic = Graphics.FromImage(oThumbNail);
        oGraphic.CompositingQuality = CompositingQuality.HighQuality;
        oGraphic.SmoothingMode = SmoothingMode.HighQuality;
        oGraphic.InterpolationMode = InterpolationMode.HighQualityBicubic;
        oGraphic.DrawImage(bmp, oRectangle);

        oThumbNail.Save(pathSave, System.Drawing.Imaging.ImageFormat.Jpeg);
    }

    public static string GaleryImagePath
    {
        get
        {
            return System.Configuration.ConfigurationManager.AppSettings["GaleryImagePath"];
        }
    }

    public static string GaleryTempImagePath
    {
        get
        {
            return System.Configuration.ConfigurationManager.AppSettings["GaleryTempImagePath"];
        }
    }

    public static void DeleteFile(string targetFolder, string fileName)
    {
        string filePath = Path.Combine(targetFolder, fileName);
        if (File.Exists(filePath))
        {
            File.Delete(filePath);
        }
    }

    public static string FontPath
    {
        get
        {
            return System.Configuration.ConfigurationManager.AppSettings["FontPath"];
        }
    }

    public static void SendEmail(string subject, string body)
    {
        try
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
            MailAddress to = new MailAddress(System.Configuration.ConfigurationManager.AppSettings["ToEmail"]);
            // Specify the message content.
            MailMessage message = new MailMessage(from, to);
            message.Body = body;
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
        catch
        { }
    }

    public static string LangPrefix
    {
        get
        {
            string culture = "en-US";
            if (Thread.CurrentThread.CurrentCulture != null)
            {
                culture = Thread.CurrentThread.CurrentCulture.Name;
            }
            string prefCulture = "_en";
            switch (culture)
            {
                case "uk-UA":
                    prefCulture = "_uk";
                    break;
                case "ru-RU":
                    prefCulture = "_ru";
                    break;
            }
            return prefCulture;
        }
    }

    public static void InitCulture(System.Web.UI.Page page)
    {
        string culture = GetCultureName(page);
        Thread.CurrentThread.CurrentUICulture = new CultureInfo(culture);
        Thread.CurrentThread.CurrentCulture = new CultureInfo(culture);
    }

    public static string GetCultureName(System.Web.UI.Page page)
    {
        string culture = "en-US";
        if (page.Request.QueryString["lang"] != null)
        {
            culture = page.Request.QueryString["lang"].ToString();
            switch (culture)
            {
                case "uk":
                    culture = "uk-UA";
                    break;
                case "en":
                    culture = "en-US";
                    break;
                case "ru":
                    culture = "ru-RU";
                    break;
            }
            if (!page.ClientScript.IsStartupScriptRegistered("VIKKI_ChangeLanguageScript"))
            {
                page.ClientScript.RegisterStartupScript(page.GetType(), "VIKKI_ChangeLanguageScript", "VIKKI_ChangeLanguage('" + 
                    culture + "');", true);
            }
            return culture;
        }
        if (HttpContext.Current.Request.Cookies["YOURTRAVEL_LV_UKR_LNG"] != null)
        {
            culture = HttpContext.Current.Request.Cookies["YOURTRAVEL_LV_UKR_LNG"].Value.ToString();
        }
        return culture;
    }

    public static string SelectedCultureName
    {
        get
        {
            string culture = "en-US";
            if (Thread.CurrentThread.CurrentCulture != null)
            {
                culture = Thread.CurrentThread.CurrentCulture.Name;
            }
            return culture;
        }
    }

    public static string LangPrefURL
    {
        get
        {
            string culture = "en-US";
            if (Thread.CurrentThread.CurrentCulture != null)
            {
                culture = Thread.CurrentThread.CurrentCulture.Name;
            }
            return culture.Substring(0, 2);
        }
    }

    public static string GenerateFriendlyURL(string subfolderName, string[] titles, bool dafaultFolder)
    {
        string friendlyURL = (dafaultFolder ? "~/" : "") + subfolderName + "/";
        foreach (string title in titles)
        {
            friendlyURL += PrepareFolderName(title) + "/";
        }
        return friendlyURL;
    }

    public static string GenerateFriendlyURL(string subfolderName, string[] titles)
    {
        return GenerateFriendlyURL(subfolderName, titles, true);
    }

    private static string PrepareFolderName(string title)
    {
        title = title.Trim();
        title = title.Trim('-');

        title = title.ToLower();
        char[] chars = @"$%#@!*?;:~`+=()[]{}|\'<>,/^&"".".ToCharArray();
        title = title.Replace("c#", "C-Sharp");
        title = title.Replace("vb.net", "VB-Net");
        title = title.Replace("asp.net", "Asp-Net");

        title = title.Replace(".", "-");

        for (int i = 0; i < chars.Length; i++)
        {
            string strChar = chars.GetValue(i).ToString();
            if (title.Contains(strChar))
            {
                title = title.Replace(strChar, string.Empty);
            }
        }

        title = title.Replace(" ", "-");

        title = title.Replace("--", "-");
        title = title.Replace("---", "-");
        title = title.Replace("----", "-");
        title = title.Replace("-----", "-");
        title = title.Replace("----", "-");
        title = title.Replace("---", "-");
        title = title.Replace("--", "-");

        title = title.Trim();
        title = title.Trim('-');
        return title;
    }
}
