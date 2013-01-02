using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Security.Authentication;
using System.Web;
using System.Web.Configuration;
using System.Web.Routing;

namespace VikkiSoft
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            RouteTable.Routes.MapPageRoute("CountryRoute", "country/{CountryName}", "~/CountryView.aspx");
            RouteTable.Routes.MapPageRoute("CityRoute", "city/{CountryName}/{CityName}", "~/CityView.aspx");
        }
    }
}