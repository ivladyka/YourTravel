using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VikkiSoft_BLL;

public partial class CategoryView : ProjectPageBase
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Category cat = new Category();
            cat.Where.CategoryID.Value = CategoryID;
            if (cat.Query.Load())
            {
                lblName.Text = cat.GetColumn("Name" + Utils.LangPrefix).ToString();
                if (!cat.IsColumnNull("CategoryContent" + Utils.LangPrefix))
                {
                    lblCategoryContent.Text = cat.GetColumn("CategoryContent" + Utils.LangPrefix).ToString();
                }
            }
        }
    }

    private int CategoryID
    {
        get
        {
            if (Request.QueryString["ct"] != null)
            {
                return int.Parse(Request.QueryString["ct"].ToString());
            }
            return 0;
        }
    }
}