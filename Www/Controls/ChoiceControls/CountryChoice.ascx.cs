using Telerik.Web.UI;
using VikkiSoft_BLL;
using MyGeneration.dOOdads;

public partial class CountryChoice : ChoiceControlBase
{
    protected override RadComboBox ddlList
    {
        get { return ddlCountry; }
    }

    protected override void InitDDL()
    {
        Country c = new Country();
        c.Query.AddOrderBy(Country.ColumnNames.Name_uk, WhereParameter.Dir.ASC);
        if (c.Query.Load())
        {
            do
            {
                RadComboBoxItem item = new RadComboBoxItem(c.s_Name_uk, c.CountryID.ToString());
                this.ddlList.Items.Add(item);
            } while (c.MoveNext());
        }
    }
}