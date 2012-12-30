using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VikkiSoft_BLL;

public partial class SettingsEdit : EditControlBase
{
    public SettingsEdit()
    {
        this.m_Name = "Налаштування";
        this.AllowUserTypes = "LoggedUser";
        this.BackURL = "Office.aspx";
    }
    protected override Type GetEditableEntityType()
    {
        return typeof(Settings);
    }

    protected override void InitOnFirstLoading()
    {
        base.InitOnFirstLoading();
        text_Title_uk.Focus();
    }
}