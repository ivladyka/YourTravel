using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VikkiSoft_BLL;

public partial class CountryEdit : EditControlBase
{
    public CountryEdit()
    {
        this.m_Name = "Країнa";
        this.AllowUserTypes = "LoggedUser";
    }
    protected override Type GetEditableEntityType()
    {
        return typeof(Country);
    }

    protected override void InitOnFirstLoading()
    {
        base.InitOnFirstLoading();
        text_Name_uk.Focus();
    }
}