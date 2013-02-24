using System;
using System.Collections.Generic;
using System.Xml;
using System.Web;
using System.Web.UI;
using System.Text;
using VikkiSoft_BLL;

public partial class SiteMap : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Clear();
        Response.ContentType = "text/xml";
        XmlTextWriter writer = new XmlTextWriter(Response.OutputStream, Encoding.UTF8);
        writer.WriteStartDocument();
        writer.WriteStartElement("urlset");
        writer.WriteAttributeString("xmlns", "http://www.sitemaps.org/schemas/sitemap/0.9");

        VikkiSoft_BLL.Country cont = new VikkiSoft_BLL.Country();
        if (cont.LoadSiteMap())
        {
            string siteUrl = Request.Url.Scheme + Uri.SchemeDelimiter + System.Web.HttpContext.Current.Request.ServerVariables["SERVER_NAME"];
            if (!Request.Url.IsDefaultPort)
            {
                siteUrl += ":" + Request.Url.Port;
            }
            do
            {
                string url = "";
                if(cont.GetColumn("CityName").ToString() == "")
                {
                    url = Utils.GenerateFriendlyURL("country", new string[] { cont.GetColumn("CountryName").ToString() }, false);
                }
                else{
                    url = Utils.GenerateFriendlyURL("city", new string[] { cont.GetColumn("CountryName").ToString(), cont.GetColumn("CityName").ToString() }, false);
                }
                writer.WriteStartElement("url");
                writer.WriteElementString("loc", siteUrl + url);
                writer.WriteElementString("lastmod", String.Format("{0:yyyy-MM-dd}", cont.DateUpdate));
                writer.WriteEndElement();
            } while (cont.MoveNext());
        }

        writer.WriteEndElement();
        writer.WriteEndDocument();
        writer.Flush();
        Response.End();
    }
}