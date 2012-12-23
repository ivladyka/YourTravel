using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using System.Collections.Specialized;
using System.Web.UI.HtmlControls;

public partial class _Default : ProjectPageBase
{
    protected void Page_Load(object sender, EventArgs e)
    {
        aParis.HRef = InitReservLink("http://reservations.yourtravel.biz/index.jsp?pageName=hotNetList&cid=407972&city=paris&stateProvince=  &country=FR&validateCity=true&submitted=true");
        aNewYourk.HRef = InitReservLink("http://reservations.yourtravel.biz/index.jsp?pageName=hotSearch&cid=407972&city=New+York&stateProvince=NY&country=US&validateCity=true&submitted=true");
        aLondon.HRef = InitReservLink("http://reservations.yourtravel.biz/index.jsp?pageName=hotSearch&cid=407972&city=london&stateProvince=  &country=GB&validateCity=true&submitted=true");
        aRome.HRef = InitReservLink("http://reservations.yourtravel.biz/index.jsp?pageName=hotSearch&cid=407972&city=rome&stateProvince=  &country=IT&validateCity=true&submitted=true");
    }

    private string InitReservLink(string url)
    {
        return url + "&lang=" + Utils.LangPrefURL;
    }

    public string SearchhotelsRes
    {
        get
        {
            return Resources.Vikkisoft.SearchhotelsRes;
        }
    }
    public string hotels
    {
        get
        {
            return Resources.Vikkisoft.hotels;
        }
    }
    public string PopulardestinationsRes
    {
        get
        {
            return Resources.Vikkisoft.PopulardestinationsRes;
        }
    }
}