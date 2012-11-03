using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VikkiSoft_BLL;

public partial class SiteEdit : EditControlBase
{
    public SiteEdit()
    {
        this.m_Name = "Сайт";
        this.AllowUserTypes = "LoggedUser";
    }
    protected override Type GetEditableEntityType()
    {
        return typeof(Site);
    }

    protected override void InitOnFirstLoading()
    {
        base.InitOnFirstLoading();
        text_Name.Focus();
    }

    protected override void RedirectBackToList()
    {
        if (upload_Logo.IsPhotoDeleted)
        {
            upload_Logo.DeletePhoto();
        }
        if (upload_Banner.IsPhotoDeleted)
        {
            upload_Banner.DeletePhoto();
        }
        Response.Redirect("Office.aspx?content=SiteList");
    }
}