using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using VikkiSoft_BLL;
using System.IO;

public partial class Controls_Sites : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            LoadSites();
        }
    }

    private void LoadSites()
    {
        const int countCells = 1;
        HtmlTableRow row = new HtmlTableRow();
        Site s = new Site();
        if (s.LoadBySiteTypeID(SiteTypeID))
        {
            do
            {
                if (row.Cells.Count < countCells)
                {
                    row.Cells.Add(AddSiteCellInnerHTML(s.s_Name, s.s_Banner, s.s_URL));
                }
                else
                {
                    tblSites.Rows.Add(row);
                    row = new HtmlTableRow();
                    row.Cells.Add(AddSiteCellInnerHTML(s.s_Name, s.s_Banner, s.s_URL));
                }
            } while (s.MoveNext());
        }
        for (int i = row.Cells.Count; i < countCells; i++)
        {
            row.Cells.Add(AddTableCell("&nbsp;"));
        }
        tblSites.Rows.Add(row);
    }

    private static HtmlTableCell AddSiteCellInnerHTML(string name, string banner, string url)
    {
        HtmlTableCell cell = new HtmlTableCell();
        cell.Align = "center";
        HyperLink hl = new HyperLink();
        hl.NavigateUrl = url;
        hl.Attributes["rel"] = "nofollow";
        hl.Target = "_blank";
        if (banner != "")
        {
            Image i = new Image();
            i.ImageUrl = Path.Combine(Utils.GaleryImagePath, banner);
            hl.Controls.Add(i);
        }
        else
        {
            hl.Text = name;
        }
        cell.Controls.Add(hl);
        return cell;
    }

    private static HtmlTableCell AddTableCell(string innerHtml)
    {
        HtmlTableCell cell = new HtmlTableCell();
        cell.InnerHtml = innerHtml;
        cell.Align = "center";
        return cell;
    }

    private int SiteTypeID
    {
        get
        {
            if (Request.QueryString["st"] != null)
            {
                return int.Parse(Request.QueryString["st"].ToString());
            }
            return 0;
        }
    }   
}