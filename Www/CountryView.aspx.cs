using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VikkiSoft_BLL;

public partial class CountryView : ProjectPageBase
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            VikkiSoft_BLL.Country c = new VikkiSoft_BLL.Country();
            if (c.LoadDetailInfo(CountryID))
            {
                lblName.Text = c.GetColumn("Name" + Utils.LangPrefix).ToString();
                if (!c.IsColumnNull(Country.ColumnNames.CapitalID))
                {
                    hlCapital.Text = c.GetColumn("CapitalName" + Utils.LangPrefix).ToString();
                    hlCapital.NavigateUrl = Utils.GenerateFriendlyURL("city",
                        new string[] { c.GetColumn("Name_en").ToString(), c.GetColumn("CapitalName_en").ToString() });
                }
                else
                {
                    pnlCapital.Visible = false;
                }
                if (!c.IsColumnNull(Country.ColumnNames.Area))
                {
                    lblArea.Text = c.Area.ToString("N").Replace(".00", "") + " " + Resources.Vikkisoft.AreaMeasure;
                }
                else
                {
                    pnlArea.Visible = false;
                }
                if (!c.IsColumnNull(Country.ColumnNames.Population))
                {
                    lblPopulation.Text = c.Population.ToString("N").Replace(".00", "");
                }
                else
                {
                    pnlPopulation.Visible = false;
                }
                if (!c.IsColumnNull(Country.ColumnNames.CurrencyCode))
                {
                    lblCurrency.Text = c.GetColumn("CurrencyName" + Utils.LangPrefix).ToString()
                        + " (" + c.s_CurrencyCode + ")";
                }
                else
                {
                    pnlCurrency.Visible = false;
                }
                if (!c.IsColumnNull("Content" + Utils.LangPrefix))
                {
                    lblCountryContent.Text = c.GetColumn("Content" + Utils.LangPrefix).ToString();
                }
            }
        }
    }

    private int CountryID
    {
        get
        {
            return Master.CountryID;
        }
    }

    public string Capital
    {
        get
        {
            return Resources.Vikkisoft.Capital;
        }
    }

    public string Area
    {
        get
        {
            return Resources.Vikkisoft.Area;
        }
    }

    public string Population
    {
        get
        {
            return Resources.Vikkisoft.Population;
        }
    }

    public string Currency
    {
        get
        {
            return Resources.Vikkisoft.Currency;
        }
    }
}