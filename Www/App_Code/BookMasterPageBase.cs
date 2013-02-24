using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class BookMasterPageBase : System.Web.UI.MasterPage
{
	public BookMasterPageBase()
	{
	}

    public MasterPageBase MasterPage
    {
        get
        {
            return (Page.Master.Master as MasterPageBase);
        }
    }

    public string SiteURL
    {
        get
        {
            return MasterPage.SiteURL;
        }
    }

    public int CityID
    {
        get
        {
            return MasterPage.CityID;
        }
    }

    public int CountryID
    {
        get
        {
            return MasterPage.CountryID;
        }
    }
}