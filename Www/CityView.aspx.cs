using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VikkiSoft_BLL;

public partial class CityView : ProjectPageBase
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            VikkiSoft_BLL.City c = new VikkiSoft_BLL.City();
            if (c.LoadDetailInfo(CityID))
            {
                lblName.Text = c.GetColumn("Name" + Utils.LangPrefix).ToString();
                if (!c.IsColumnNull("Content" + Utils.LangPrefix))
                {
                    lblCityContent.Text = c.GetColumn("Content" + Utils.LangPrefix).ToString();
                }
                hlCountry.Text = c.GetColumn("CountryName" + Utils.LangPrefix).ToString();
                hlCountry.NavigateUrl = Utils.GenerateFriendlyURL("country",
                    new string[] { c.GetColumn("CountryName_en").ToString() });
            }
        }
    }

    private int CityID
    {
        get
        {
            return Master.CityID;
        }
    }

    public string Country
    {
        get
        {
            return Resources.Vikkisoft.Country;
        }
    }
}