using System;
using System.Data;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using VikkiSoft_BLL;

public partial class CategoryList : ListControlBase, Interfaces.IColouredGrid
{
    public CategoryList()
    {
        this.m_Name = "Сторінки";
        this.AllowUserTypes = "LoggedUser";
        BackURL = "~/Office/Office.aspx";
    }

    protected override string GetEditableControlName()
    {
        return "CategoryEdit";
    }

    protected override Type GetEditableEntityType()
    {
        return typeof(Category);
    }

    protected override string[] GetPrimaryKeys()
    {
        return new string[] { "CategoryID" };
    }

    public override void InitGrid()
    {
        base.InitGrid();
        this.editableGrid.GridMode = GridModes.Add | GridModes.Delete
            | GridModes.Edit | GridModes.Refresh;
        editableGrid.Width = 900;
        SetColumnSettings(Category.ColumnNames.CategoryID, false, Category.ColumnNames.CategoryID,
           0, HorizontalAlign.Center, "");
        SetColumnSettings(Category.ColumnNames.Name_uk, true, "Назва", 0, HorizontalAlign.Center, "");
        SetColumnSettings(Category.ColumnNames.Name_ru, false, "", 0, HorizontalAlign.Center, "");
        SetColumnSettings(Category.ColumnNames.Name_en, false, "", 0, HorizontalAlign.Center, "");
        SetColumnSettings(Category.ColumnNames.CategoryContent_uk, false, Category.ColumnNames.CategoryContent_en,
           0, HorizontalAlign.Center, "");
        SetColumnSettings(Category.ColumnNames.CategoryContent_ru, false, "", 0, HorizontalAlign.Center, "");
        SetColumnSettings(Category.ColumnNames.CategoryContent_en, false, "", 0, HorizontalAlign.Center, "");
    }

    #region IColouredGrid Members

    public Interfaces.GridColorSchemes GridColorScheme
    {
        get
        {
            return Interfaces.GridColorSchemes.Green;
        }
    }

    #endregion
}
