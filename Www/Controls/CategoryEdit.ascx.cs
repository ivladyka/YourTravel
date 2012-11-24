using System;
using VikkiSoft_BLL;
using Telerik.Web.UI;

public partial class CategoryEdit : EditControlBase
{
    public CategoryEdit()
    {
        this.m_Name = "сторінку";
        this.AllowUserTypes = "LoggedUser";
        BackURL = "";
    }

    protected override Type GetEditableEntityType()
    {
        return typeof(Category);
    }

    protected override void InitOnFirstLoading()
    {
        base.InitOnFirstLoading();
        if(IsNew)
        {
            text_Name_uk.Focus();
        }
    }

    protected override void RedirectBackToList()
    {
        Response.Redirect("Office.aspx?content=CategoryList");
    }
}
