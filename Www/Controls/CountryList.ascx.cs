using System;
using System.Data;
using System.IO;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using VikkiSoft_BLL;

public partial class CountryList : ListControlBase, Interfaces.IColouredGrid
{
    public CountryList()
	{
        this.m_Name = "Країни";
        this.AllowUserTypes = "LoggedUser";
        BackURL = "~/Office/Office.aspx";
	}

	protected override string GetEditableControlName()
	{
        return "CountryEdit";
	}

	protected override Type GetEditableEntityType()
	{
        return typeof(Country);
	}

	protected override string[] GetPrimaryKeys()
	{
        return new string[] { "CountryID" };
    }

	public override void InitGrid()
	{
		base.InitGrid ();
		this.editableGrid.GridMode = GridModes.Add | GridModes.Delete
			| GridModes.Edit | GridModes.Refresh;				
		editableGrid.Width = 1200;
        SetColumnSettings(VikkiSoft_BLL.Country.ColumnNames.CountryID, false, VikkiSoft_BLL.Country.ColumnNames.CountryID,
				0, HorizontalAlign.Center, "");
        SetColumnSettings(VikkiSoft_BLL.Country.ColumnNames.Name_uk, true, "Назва", 0, HorizontalAlign.Center, "");
        SetColumnSettings(VikkiSoft_BLL.Country.ColumnNames.Name_en, false, "", 0, HorizontalAlign.Center, "");
        SetColumnSettings(VikkiSoft_BLL.Country.ColumnNames.Area, true, "Площа, кв. км.", 0, HorizontalAlign.Center, "");
        SetColumnSettings(VikkiSoft_BLL.Country.ColumnNames.Population, true, "Населення", 0, HorizontalAlign.Center, "");
        SetColumnSettings(VikkiSoft_BLL.Country.ColumnNames.CurrencyCode, true, "Kод валюти", 0, HorizontalAlign.Center, "");
        SetColumnSettings(VikkiSoft_BLL.Country.ColumnNames.CurrencyName_uk, true, "Валюта", 0, HorizontalAlign.Center, "");
        SetColumnSettings(VikkiSoft_BLL.Country.ColumnNames.Active, true, "Активний", 0, HorizontalAlign.Center, "");
        SetColumnSettings("CapitalName", true, "Столиця", 0, HorizontalAlign.Center, "");
        SetColumnSettings("URL", true, "Дружній URL", 0, HorizontalAlign.Center, "");
        SetColumnSettings(VikkiSoft_BLL.Country.ColumnNames.Keywords_uk, true, "Ключові слова", 0, HorizontalAlign.Center, "");
        SetColumnSettings(VikkiSoft_BLL.Country.ColumnNames.Keywords_en, true, "Ключові слова, анг.", 0, HorizontalAlign.Center, "");
        SetColumnSettings(VikkiSoft_BLL.Country.ColumnNames.Keywords_ru, true, "Ключові слова, рос.", 0, HorizontalAlign.Center, "");
	}

    protected override DataTable GetDataSource()
    {
        VikkiSoft_BLL.Country c = new VikkiSoft_BLL.Country();
        c.LoadWithCapital();
        return c.DefaultView.Table;
    }

    protected override void OnEditableGridItemDataBound(object sender, GridItemEventArgs e)
    {
        base.OnEditableGridItemDataBound(sender, e);
        if (e.Item is GridDataItem)
        {
            if (e.Item.ItemType == GridItemType.Item || e.Item.ItemType == GridItemType.AlternatingItem)
            {
                DataRowView dataRowView = e.Item.DataItem as DataRowView;
                if (dataRowView != null)
                {
                    HyperLink hl = new HyperLink();
                    hl.Target = "_blank";
                    hl.Text = "Go this page";
                    hl.NavigateUrl = Utils.GenerateFriendlyURL("country", dataRowView[Country.ColumnNames.Name_en].ToString());
                    e.Item.Cells[15].Controls.Add(hl);
                }
            }
        }
    }

    #region IColouredGrid Members

    public Interfaces.GridColorSchemes GridColorScheme
    {
        get
        {
            return Interfaces.GridColorSchemes.Blue;
        }
    }

    #endregion
}