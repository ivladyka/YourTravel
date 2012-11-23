using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;

public partial class MasterPage : MasterPageBase
{
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
    }

    public string ScriptTag
    {
        get
        {
            string path = "";
            if (Request.Url.ToString().ToLower().IndexOf("office/office.aspx") >= 0)
            {
                path = "../";
            }
            return "<script src='" + path + "js/Scripts.js' type='text/javascript'></script>";
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
