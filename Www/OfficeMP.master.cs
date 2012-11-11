using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OfficeMP : MasterPageBase
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public string ScriptTag
    {
        get
        {
            string path = "";
            if (Request.Url.ToString().ToLower().IndexOf("office/office.aspx") >= 0)
            {
                path = "../js/";
            }
            return "<script src='" + path + "Scripts.js' type='text/javascript'></script>";
        }
    }
}
