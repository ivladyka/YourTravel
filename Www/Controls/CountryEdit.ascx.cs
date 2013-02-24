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
        if (!IsNew)
        {
            text_Name_en.Enabled = false;
            string countryFolder = Server.MapPath(Utils.GaleryImagePath + "//country");
            if (!System.IO.Directory.Exists(countryFolder))
            {
                System.IO.Directory.CreateDirectory(countryFolder);
            }
            countryFolder = Server.MapPath(Utils.GaleryImagePath + "//country//" + text_Name_en.Text.ToLower());
            if (!System.IO.Directory.Exists(countryFolder))
            {
                System.IO.Directory.CreateDirectory(countryFolder);
            }
            string countryFolderVirtual = Utils.GaleryImagePath + "/country/" + text_Name_en.Text.ToLower();
            editor_Content_uk.ImageManagerViewPaths = countryFolderVirtual;
            editor_Content_en.ImageManagerViewPaths = countryFolderVirtual;
            editor_Content_ru.ImageManagerViewPaths = countryFolderVirtual;
        }
    }

    protected override void SetEventHandlers()
    {
        if (!IsNew)
        {
            string countryFolderVirtual = Utils.GaleryImagePath + "/country/" + text_Name_en.Text.ToLower();

            editor_Content_uk.ImageManagerUploadPaths = countryFolderVirtual;
            editor_Content_en.ImageManagerUploadPaths = countryFolderVirtual;
            editor_Content_ru.ImageManagerUploadPaths = countryFolderVirtual;
            editor_Content_uk.ImageManagerDeletePaths = countryFolderVirtual;
            editor_Content_en.ImageManagerDeletePaths = countryFolderVirtual;
            editor_Content_ru.ImageManagerDeletePaths = countryFolderVirtual;
        }
        base.SetEventHandlers();
    }

    protected override void WriteDataToEntity()
    {
        base.WriteDataToEntity();
        Country c = (Country)this.EditableEntity;
        c.DateUpdate = DateTime.Now;
    }
}