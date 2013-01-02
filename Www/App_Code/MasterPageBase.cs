using System.Web.UI;
using System.Web.UI.WebControls;
using System;
using VikkiSoft_BLL;

/// <summary>
/// Summary description for MasterPageBase
/// </summary>
public class MasterPageBase : System.Web.UI.MasterPage
{
    private int m_CityID = 0;
    private int m_CountryID = 0;

    public string PageName
    {
        set
        {
            Label lbPageName = (Label) Page.Master.FindControl("lbPageName");
            if (lbPageName != null)
            {
                lbPageName.Text = value;
            }
        }
    }

    public MenuItemCollection TopMenuItemsCollection
    {
        get
        {
            Control topMenu = (Control) Page.Master.FindControl("TopMenu");
            if (topMenu != null)
            {
                Menu mnTop = (Menu)topMenu.FindControl("mnTop");
                if (mnTop != null)
                {
                    return mnTop.Items;
                }
            }
            return null;
        }
    }

    public Menu TopMenuControl
    {
        get
        {
            Control topMenu = (Control)Page.Master.FindControl("TopMenu");
            if (topMenu != null)
            {
                Menu mnTop = (Menu)topMenu.FindControl("mnTop");
                if (mnTop != null)
                {
                    return mnTop;
                }
            }
            return null;
        }
    }

    public string SiteURL
    {
        get
        {
            string serverURL = Request.Url.Scheme + Uri.SchemeDelimiter + System.Web.HttpContext.Current.Request.ServerVariables["SERVER_NAME"];
            if (!Request.Url.IsDefaultPort)
                serverURL += ":" + Request.Url.Port;
            serverURL += System.Configuration.ConfigurationManager.AppSettings["VitrualFolderPath"].ToString();
            return serverURL;
        }
    }

    public bool IsCountryPage
    {
        get
        {
            if (Page.Request.Url.ToString().ToLower().IndexOf("/country/") > -1)
            {
                return true;
            }
            return false;
        }
    }

    public bool IsCityPage
    {
        get
        {
            if (Page.Request.Url.ToString().ToLower().IndexOf("/city/") > -1)
            {
                return true;
            }
            return false;
        }
    }

    public int CountryID
    {
        get
        {
            if (Request.QueryString["cid"] != null)
            {
                return int.Parse(Request.QueryString["cid"].ToString());
            }
            if (m_CountryID > 0)
            {
                return m_CountryID;
            }
            return CountryIDFromFriendlyURL;
        }
    }

    public int CountryIDFromFriendlyURL
    {
        get
        {
            if (Page.RouteData.Values["CountryName"] != null)
            {
                string countryName = Page.RouteData.Values["CountryName"].ToString();
                Country c = new Country();
                c.Where.Name_en.Value = countryName;
                if (c.Query.Load())
                {
                    m_CountryID = c.CountryID;
                    return m_CountryID;
                }
            }
            return 0;
        }
    }

    public int CityID
    {
        get
        {
            if (Request.QueryString["ctid"] != null)
            {
                return int.Parse(Request.QueryString["ctid"].ToString());
            }
            if (m_CityID > 0)
            {
                return m_CityID;
            }
            return CityIDFromFriendlyURL;
        }
    }

    public int CityIDFromFriendlyURL
    {
        get
        {
            if (Page.RouteData.Values["CityName"] != null 
                && Page.RouteData.Values["CountryName"] != null)
            {
                string cityName = Page.RouteData.Values["CityName"].ToString();
                string countryName = Page.RouteData.Values["CountryName"].ToString();
                City c = new City();
                if (c.LoadByName(cityName, countryName))
                {
                    m_CityID = c.CityID;
                    return m_CityID;
                }
            }
            return 0;
        }
    }
}
