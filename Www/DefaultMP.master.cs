using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;
using VikkiSoft_BLL;

public partial class MasterPage : MasterPageBase
{
    string m_Title = "";
    string m_Keywords = "";
    string m_Description = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        hlEnglishLang.Attributes["onclick"] = "VIKKI_ChangeLanguage('en-US');";
        hlRussianLang.Attributes["onclick"] = "VIKKI_ChangeLanguage('ru-RU');";
        hlUkrainianLang.Attributes["onclick"] = "VIKKI_ChangeLanguage('uk-UA');";
        string culture = "en-US";
        if (Thread.CurrentThread.CurrentCulture != null)
        {
            culture = Thread.CurrentThread.CurrentCulture.Name;
        }
        switch (culture)
        {
            case "en-US":
                hlEnglishLang.CssClass = "VS_LangActive";
                break;
            case "ru-RU":
                hlRussianLang.CssClass = "VS_LangActive";
                break;
            case "uk-UA":
                hlUkrainianLang.CssClass = "VS_LangActive";
                break;
        }
        hlMenuHotelSearch.NavigateUrl = "http://reservations.yourtravel.biz/templates/407972/index?lang=" + Utils.LangPrefURL;
        if (!Page.IsPostBack)
        {
            LoadCommonPageData();
        }
    }

    public string ScriptTag
    {
        get
        {
            return GetJavaScriptTag("/js/jquery.min.js") + GetJavaScriptTag("/js/jquery.cycle.all.js")
                + GetJavaScriptTag("/js/jquery.easing.1.3.js") + GetJavaScriptTag("/js/cycle_script.js") 
                + GetJavaScriptTag("/js/Scripts.js");
        }
    }

    private string GetJavaScriptTag(string scriptURL)
    {
        return "<script src='" + SiteURL + System.Configuration.ConfigurationManager.AppSettings["VitrualFolderPath"] 
            + scriptURL + "' type='text/javascript'></script>";
    }

    public string Canonical
    {
        get
        {
            return "<link rel=\"canonical\" href=\"" + CanonicalURL + "\" /> ";
        }
    }

    private string CanonicalURL
    {
        get
        {
            if (IsCountryPage)
            {
                return SiteURL + "/CountryView.aspx?cid=" + CountryID;
            }
            if (IsCityPage)
            {
                return SiteURL + "/CityView.aspx?ctid=" + CityID;
            }
            return Page.Request.Url.ToString();
        }
    }

    private void LoadCommonPageData()
    {
        Settings s = new Settings();
        if (s.LoadByPrimaryKey(1))
        {
            if (IsCountryPage)
            {
                Country c = new Country();
                if (c.LoadByPrimaryKey(CountryID))
                {
                    m_Title = c.GetColumn("Name" + Utils.LangPrefix).ToString();
                    if (!s.IsColumnNull("TitleSuffix" + Utils.LangPrefix))
                    {
                        m_Title += " - " + s.GetColumn("TitleSuffix" + Utils.LangPrefix).ToString();
                    }
                    if (!c.IsColumnNull("Keywords" + Utils.LangPrefix))
                    {
                        m_Keywords = c.GetColumn("Keywords" + Utils.LangPrefix).ToString();
                    }
                    if (!c.IsColumnNull("Description" + Utils.LangPrefix))
                    {
                        m_Description = c.GetColumn("Description" + Utils.LangPrefix).ToString();
                    }
                }
            }
            else if (IsCityPage)
            {
                City c = new City();
                if (c.LoadByPrimaryKey(CityID))
                {
                    m_Title = c.GetColumn("Name" + Utils.LangPrefix).ToString();
                    if (!s.IsColumnNull("TitleSuffix" + Utils.LangPrefix))
                    {
                        m_Title += " - " + s.GetColumn("TitleSuffix" + Utils.LangPrefix).ToString();
                    }
                    if (!c.IsColumnNull("Keywords" + Utils.LangPrefix))
                    {
                        m_Keywords = c.GetColumn("Keywords" + Utils.LangPrefix).ToString();
                    }
                    if (!c.IsColumnNull("Description" + Utils.LangPrefix))
                    {
                        m_Description = c.GetColumn("Description" + Utils.LangPrefix).ToString();
                    }
                }
            }
            if (m_Title.TrimEnd().Length == 0 && !s.IsColumnNull("Title" + Utils.LangPrefix))
            {
                m_Title = s.GetColumn("Title" + Utils.LangPrefix).ToString();
            }
            if (m_Keywords.TrimEnd().Length == 0 && !s.IsColumnNull("Keywords" + Utils.LangPrefix))
            {
                m_Keywords = s.GetColumn("Keywords" + Utils.LangPrefix).ToString();
            }
            if (m_Description.TrimEnd().Length == 0 && !s.IsColumnNull("Description" + Utils.LangPrefix))
            {
                m_Description = s.GetColumn("Description" + Utils.LangPrefix).ToString();
            }
        }
    }

    public string Title
    {
        get
        {
            return "<title>" + m_Title + "</title><meta name='title' content='" + m_Title + "' />";
        }
    }

    public string Description
    {
        get
        {
            return "<meta name='description' content='" + m_Description + "' />";
        }
    }

    public string Keywords
    {
        get
        {
            return "<meta name='keywords' content='" + m_Keywords + "' />";
        }
    }

    public string menuHome
    {
        get
        {
            return Resources.Vikkisoft.menuHome;
        }
    }
    public string menuHotels
    {
        get
        {
            return Resources.Vikkisoft.menuHotels;
        }
    }
    public string menuPrivacyPolicy
    {
        get
        {
            return Resources.Vikkisoft.menuPrivacyPolicy;
        }
    }
    public string menuAboutUS
    {
        get
        {
            return Resources.Vikkisoft.menuAboutUS;
        }
    }
    public string menuContactUS
    {
        get
        {
            return Resources.Vikkisoft.menuContactUS;
        }
    }
}
