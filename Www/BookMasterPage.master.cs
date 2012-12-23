using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Specialized;
using System.Web.UI.HtmlControls;

public partial class BookMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            LoadDDLs();
        }
        btnSearch.OnClientClick = "return VIKKI_CheckHotelSearch('" + tblRooms.ClientID + "', '" + Resources.Vikkisoft.ChildrenAgeAlert + "');";
    }

    private void LoadDDLs()
    {
        dpCheckInDate.MinDate = dpCheckOutDate.MinDate = DateTime.Now.AddDays(1);
        for (int i = 0; i < 8; i++)
        {
            HtmlTableRow row = new HtmlTableRow();
            if (i > 0)
            {
                HideControl((HtmlControl)row);
            }
            HtmlTableCell cell = new HtmlTableCell();
            if (i > 0)
            {
                cell.InnerHtml = "&nbsp;";
            }
            else
            {
                cell.Controls.Add(AddDDL("ddlRooms", -1, 1, 8, "", "VIKKI_RoomsChange(this)"));
            }
            row.Cells.Add(cell);
            row.Cells.Add(AddCell(Resources.Vikkisoft.Room + " " + (i + 1).ToString()));
            cell = new HtmlTableCell();
            cell.Controls.Add(AddDDL("ddlAdults", i, 1, 4));
            row.Cells.Add(cell);
            cell = new HtmlTableCell();
            cell.Controls.Add(AddDDL("ddlChildren", i, 0, 3, "", "VIKKI_ChildrenChange(this)"));
            row.Cells.Add(cell);
            tblRooms.Rows.Add(row);

            row = new HtmlTableRow();
            HideControl((HtmlControl)row);
            HideControl((HtmlControl)row);
            row.Cells.Add(AddCell("&nbsp;"));
            row.Cells.Add(AddCell("&nbsp;"));
            row.Cells.Add(AddCell(Resources.Vikkisoft.AgeOfChildren, 2));
            tblRooms.Rows.Add(row);

            row = new HtmlTableRow();
            HideControl((HtmlControl)row);
            row.Cells.Add(AddCell("&nbsp;"));
            row.Cells.Add(AddCell("&nbsp;"));
            cell = new HtmlTableCell();
            cell.ColSpan = 2;
            cell.Controls.Add(AddChildAgeDDL("ddlChildAge0_", i, ""));
            cell.Controls.Add(AddChildAgeDDL("ddlChildAge1_", i, "margin-left: 2px;"));
            cell.Controls.Add(AddChildAgeDDL("ddlChildAge2_", i, "margin-left: 2px;"));
            row.Cells.Add(cell);
            tblRooms.Rows.Add(row);
        }
    }

    private HtmlTableCell AddCell(string text)
    {
        return AddCell(text, 0);
    }

    private HtmlTableCell AddCell(string text, int colspan)
    {
        HtmlTableCell cell = new HtmlTableCell();
        cell.InnerHtml = text;
        if (colspan > 1)
        {
            cell.ColSpan = colspan;
        }
        return cell;
    }

    private DropDownList AddChildAgeDDL(string id, int index, string style)
    {
        DropDownList ddl = AddDDL(id, index, 1, 17);
        ddl.CssClass = "VIKKI_Children_AgeDDL";
        ddl.Items.Insert(0, new ListItem("<1", "0"));
        ListItem item = new ListItem("?", "-1");
        item.Selected = true;
        ddl.Items.Insert(0, item);
        HideControl((WebControl)ddl);
        return ddl;
    }

    private void HideControl(HtmlControl ctrl)
    {
        ctrl.Style["visibility"] = "hidden";
        ctrl.Style["display"] = "none";
    }

    private void HideControl(WebControl ctrl)
    {
        ctrl.Style["visibility"] = "hidden";
        ctrl.Style["display"] = "none";
    }

    private DropDownList AddDDL(string id, int index, int startIndex, int endIndex, string style, string clienOnChange)
    {
        DropDownList ddl = new DropDownList();
        ddl.ID = id;
        if (clienOnChange != "")
        {
            ddl.Attributes["onchange"] = clienOnChange;
        }
        if (index >= 0)
        {
            ddl.ID += index.ToString();
        }
        if (style != "")
        {
            ddl.Attributes["style"] = style;
        }
        LoadNumberDDL(ddl, startIndex, endIndex);
        return ddl;
    }

    private DropDownList AddDDL(string id, int index, int startIndex, int endIndex)
    {
        return AddDDL(id, index, startIndex, endIndex, "", "");
    }

    private DropDownList AddDDL(string id, int index, int startIndex, int endIndex, string style)
    {
        return AddDDL(id, index, startIndex, endIndex, style, "");
    }

    private void LoadNumberDDL(DropDownList ddl, int startIndex, int endIndex)
    {
        ddl.Items.Clear();
        for (int i = startIndex; i <= endIndex; i++)
        {
            ddl.Items.Add(new ListItem(i.ToString(), i.ToString()));
        }
    }
    public string Booking
    {
        get
        {
            return Resources.Vikkisoft.Booking;
        }
    }

    public string CheckInRes
    {
        get
        {
            return Resources.Vikkisoft.CheckIn;
        }
    }

    public string CheckOutRes
    {
        get
        {
            return Resources.Vikkisoft.CheckOut;
        }
    }

    public string RoomsRes
    {
        get
        {
            return Resources.Vikkisoft.Rooms;
        }
    }

    public string AdultsRes
    {
        get
        {
            return Resources.Vikkisoft.Adults;
        }
    }

    public string ChildrenRes
    {
        get
        {
            return Resources.Vikkisoft.Children;
        }
    }

    public string WhereGo
    {
        get
        {
            return Resources.Vikkisoft.WhereGo;
        }
    }

    public string AgeOfChildren
    {
        get
        {
            return Resources.Vikkisoft.AgeOfChildren;
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        NameValueCollection data = new NameValueCollection();
        data.Add("pageName", "hotSearch");
        data.Add("cid", "407972");
        data.Add("submitted", "true");
        data.Add("locale", Utils.SelectedCultureName.Replace("-", "_"));
        data.Add("validateCity", "true");
        data.Add("avail", "true");
        data.Add("passThrough", "true");
        data.Add("passThrough2", "true");
        data.Add("isHotels", "true");
        data.Add("isCondos", "false");
        data.Add("showCondos", "true");
        data.Add("showHotels", "true");
        data.Add("mode", "2");
        data.Add("netOnly", "false");
        data.Add("firstSearch", "true");
        data.Add("isAdvancedSearch", "false");
        data.Add("specials", "false");
        data.Add("showPopUp", "true");
        data.Add("propertyType", "A");
        data.Add("city", tbWhereGo.Text);
        data.Add("arrivalMonth", dpCheckInDate.SelectedDate.Month.ToString());
        data.Add("arrivalDay", dpCheckInDate.SelectedDate.Day.ToString());
        data.Add("departureMonth", dpCheckOutDate.SelectedDate.Month.ToString());
        data.Add("departureDay", dpCheckOutDate.SelectedDate.Day.ToString());
        int countRooms = int.Parse(GetDDLSelectedValue("ddlRooms"));
        data.Add("numberOfRooms", countRooms.ToString());
        for (int i = 0; i < countRooms; i++)
        {
            data.Add("room-" + i + "-adult-total", GetDDLSelectedValue("ddlAdults" + i));
            data.Add("room-" + i + "-child-total", GetDDLSelectedValue("ddlChildren" + i));
            int countChildren = int.Parse(GetDDLSelectedValue("ddlChildren" + i));
            for (int j = 0; j < countChildren; j++)
            {
                data.Add("room-" + i + "-child-" + j + "-age", GetDDLSelectedValue("ddlChildAge" + j + "_" + i));
            }
        }
        HttpHelper.RedirectAndPOST(this.Page, "http://reservations.yourtravel.biz/index.jsp", data);
    }

    private string GetDDLSelectedValue(string ddlID)
    {
        for (int i = 0; i < Request.Params.Keys.Count; i++)
        {
            if (Request.Params.Keys[i].IndexOf(ddlID) != -1)
            {
                return Request.Params[i].ToString();
            }
        }
        return "";
    }
}
