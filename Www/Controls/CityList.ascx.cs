using System;
using System.Data;
using System.IO;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using VikkiSoft_BLL;

public partial class CityList : ListControlBase, Interfaces.IColouredGrid
{
    public CityList()
	{
        this.m_Name = "Міста";
        this.AllowUserTypes = "LoggedUser";
        BackURL = "~/Office/Office.aspx";
	}

	protected override string GetEditableControlName()
	{
        return "CityEdit";
	}

	protected override Type GetEditableEntityType()
	{
        return typeof(City);
	}

	protected override string[] GetPrimaryKeys()
	{
        return new string[] { "CityID" };
    }

	public override void InitGrid()
	{
		base.InitGrid ();
		this.editableGrid.GridMode = GridModes.Add | GridModes.Delete | GridModes.Edit | GridModes.Refresh;				
		editableGrid.Width = 1200;
        SetColumnSettings(VikkiSoft_BLL.City.ColumnNames.CityID, false, VikkiSoft_BLL.City.ColumnNames.CityID,
				0, HorizontalAlign.Center, "");
        SetColumnSettings(VikkiSoft_BLL.City.ColumnNames.Name_uk, true, "Назва", 0, HorizontalAlign.Center, "");
        SetColumnSettings(VikkiSoft_BLL.City.ColumnNames.Name_en, false, "", 0, HorizontalAlign.Center, "");
        SetColumnSettings(VikkiSoft_BLL.City.ColumnNames.Active, true, "Активний", 0, HorizontalAlign.Center, "");
        SetColumnSettings("CountryName", true, "Країна", 0, HorizontalAlign.Center, "");
        SetColumnSettings("CountryName_en", false, "", 0, HorizontalAlign.Center, "");
        SetColumnSettings(VikkiSoft_BLL.City.ColumnNames.Keywords_uk, true, "Ключові слова", 0, HorizontalAlign.Center, "");
        SetColumnSettings(VikkiSoft_BLL.City.ColumnNames.Keywords_en, true, "Ключові слова, анг.", 0, HorizontalAlign.Center, "");
        SetColumnSettings(VikkiSoft_BLL.City.ColumnNames.Keywords_ru, true, "Ключові слова, рос.", 0, HorizontalAlign.Center, "");
        SetColumnSettings("URL", true, "Дружній URL", 0, HorizontalAlign.Center, "");
	}

    protected override DataTable GetDataSource()
    {
        VikkiSoft_BLL.City c = new VikkiSoft_BLL.City();
        c.LoadWithCountry();
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
                    hl.NavigateUrl = Utils.GenerateFriendlyURL("city", new string[] {  
                       dataRowView["CountryName_en"].ToString(),
                        dataRowView[City.ColumnNames.Name_en].ToString()});
                    e.Item.Cells[12].Controls.Add(hl);
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