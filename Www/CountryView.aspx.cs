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
            VikkiSoft_BLL.Country cat = new VikkiSoft_BLL.Country();
            cat.Where.CountryID.Value = CountryID;
            if (cat.Query.Load())
            {
                lblName.Text = cat.GetColumn("Name" + Utils.LangPrefix).ToString();
                if (!cat.IsColumnNull("Content" + Utils.LangPrefix))
                {
                    lblCountryContent.Text = cat.GetColumn("Content" + Utils.LangPrefix).ToString();
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
}