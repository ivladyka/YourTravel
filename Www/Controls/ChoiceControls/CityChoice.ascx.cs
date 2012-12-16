using Telerik.Web.UI;
using VikkiSoft_BLL;
using MyGeneration.dOOdads;

public partial class CityChoice : ChoiceControlBase
{
    protected override RadComboBox ddlList
    {
        get { return ddlCity; }
    }

    protected override void InitDDL()
    {
        City c = new City();
        if (CountryID > 0)
        {
            c.Where.CountryID.Value = CountryID;
        }
        c.Query.AddOrderBy(City.ColumnNames.Name_uk, WhereParameter.Dir.ASC);
        if (c.Query.Load())
        {
            do
            {
                RadComboBoxItem item = new RadComboBoxItem(c.s_Name_uk, c.CityID.ToString());
                this.ddlList.Items.Add(item);
            } while (c.MoveNext());
        }
    }

    public int CountryID
    {
        get
        {
            if (Request.QueryString["CountryID"] != null)
            {
                return int.Parse(Request.QueryString["CountryID"].ToString());
            }
            return 0;
        }
    }
}