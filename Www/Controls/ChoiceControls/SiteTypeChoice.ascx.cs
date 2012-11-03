using Telerik.Web.UI;
using VikkiSoft_BLL;
using MyGeneration.dOOdads;

public partial class SiteTypeChoice : ChoiceControlBase
{
    protected override RadComboBox ddlList
    {
        get { return ddlSiteType; }
    }

    protected override void InitDDL()
    {
        SiteType st = new SiteType();
        st.Query.AddOrderBy(SiteType.ColumnNames.Name, WhereParameter.Dir.ASC);
        if (st.Query.Load())
        {
            do
            {
                RadComboBoxItem item = new RadComboBoxItem(st.s_Name, st.SiteTypeID.ToString());
                this.ddlList.Items.Add(item);
            } while (st.MoveNext());
        }
    }
}