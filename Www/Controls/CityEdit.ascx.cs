using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VikkiSoft_BLL;

public partial class CityEdit : EditControlBase
{
    public CityEdit()
    {
        this.m_Name = "Містo";
        this.AllowUserTypes = "LoggedUser";
    }
    protected override Type GetEditableEntityType()
    {
        return typeof(City);
    }

    protected override void InitOnFirstLoading()
    {
        base.InitOnFirstLoading();
        text_Name_uk.Focus();
        if (!IsNew)
        {
            choice_CountryID.Enabled = false;
            text_Name_en.Enabled = false;
            string countryFolder = Server.MapPath(Utils.GaleryImagePath + "//city");
            if (!System.IO.Directory.Exists(countryFolder))
            {
                System.IO.Directory.CreateDirectory(countryFolder);
            }
            string country = choice_CountryID.DDLSelectedItem.Attributes["NameEn"].ToString().ToLower();
            countryFolder = Server.MapPath(Utils.GaleryImagePath + "//city//" + country);
            if (!System.IO.Directory.Exists(countryFolder))
            {
                System.IO.Directory.CreateDirectory(countryFolder);
            }
            countryFolder = Server.MapPath(Utils.GaleryImagePath + "//city//" + country)
                + "//" + text_Name_en.Text.ToLower();
            if (!System.IO.Directory.Exists(countryFolder))
            {
                System.IO.Directory.CreateDirectory(countryFolder);
            }
            CityFolderVirtual = Utils.GaleryImagePath + "/city/" + country 
                + "/" + text_Name_en.Text.ToLower();
            editor_Content_uk.ImageManagerViewPaths = CityFolderVirtual;
            editor_Content_en.ImageManagerViewPaths = CityFolderVirtual;
            editor_Content_ru.ImageManagerViewPaths = CityFolderVirtual;
        }
    }

    protected override void SetEventHandlers()
    {
        if (!IsNew)
        {
            editor_Content_uk.ImageManagerUploadPaths = CityFolderVirtual;
            editor_Content_en.ImageManagerUploadPaths = CityFolderVirtual;
            editor_Content_ru.ImageManagerUploadPaths = CityFolderVirtual;
            editor_Content_uk.ImageManagerDeletePaths = CityFolderVirtual;
            editor_Content_en.ImageManagerDeletePaths = CityFolderVirtual;
            editor_Content_ru.ImageManagerDeletePaths = CityFolderVirtual;
        }
        base.SetEventHandlers();
    }

    public string CityFolderVirtual
    {
        get
        {
            if (this.ViewState["CityFolderVirtual"] != null)
            {
                return this.ViewState["CityFolderVirtual"].ToString();
            }
            return "";
        }
        set
        {
            this.ViewState["CityFolderVirtual"] = value;
        }
    }

    protected override void WriteDataToEntity()
    {
        base.WriteDataToEntity();
        City c = (City)this.EditableEntity;
        c.DateUpdate = DateTime.Now;
    }
}