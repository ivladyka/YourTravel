using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using VikkiSoft_BLL;

public partial class Controls_CityTableView : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadCities();
    }

    private void LoadCities()
    {
        City c = new City();
        if (c.LoadByCountryID(CountryID))
        {
            do
            {
                HtmlTableRow row = new HtmlTableRow();
                row.Cells.Add(AddCityCellInnerHTML(c.GetColumn("Name" + Utils.LangPrefix).ToString(), c.GetColumn("CountryName").ToString(),
                    c.GetColumn("Name_en").ToString()));
                tblCities.Rows.Add(row);
            } while (c.MoveNext());
        }
    }

    private HtmlTableCell AddCityCellInnerHTML(string name, string countryName, string name_en)
    {
        HtmlTableCell cell = new HtmlTableCell();
        HyperLink hl = new HyperLink();
        hl.NavigateUrl = SiteURL + "/" + Utils.GenerateFriendlyURL("city", new string[] {  
                       countryName, name_en}, false); ;
        hl.Text = name;
        cell.Controls.Add(hl);
        return cell;
    }

    private int CountryID
    {
        get
        {
            BookMasterPageBase master = Page.Master as BookMasterPageBase;
            if (master != null)
            {
                return master.CountryID;
            }
            return 0;
        }
    }

    private string SiteURL
    {
        get
        {
            BookMasterPageBase master = Page.Master as BookMasterPageBase;
            if (master != null)
            {
                return master.SiteURL;
            }
            return "";
        }
    }
}