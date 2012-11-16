using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using System.Collections.Specialized;

public partial class _Default : ProjectPageBase
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            LoadDDLs();
        }
    }

    private void LoadDDLs()
    {
        dpCheckInDate.MinDate = dpCheckOutDate.MinDate = DateTime.Now.AddDays(1);
        LoadNumberDDL(ddlRooms, 1, 6);
        LoadNumberDDL(ddlAdults, 1, 4);
        LoadNumberDDL(ddlChildren, 0, 3);
    }

    private void LoadNumberDDL(RadComboBox ddl, int startIndex, int endIndex)
    {
        ddl.Items.Clear();
        for (int i = startIndex; i <= endIndex; i++)
        {
            ddl.Items.Add(new RadComboBoxItem(i.ToString(), i.ToString()));
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

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        NameValueCollection data = new NameValueCollection();
        data.Add("pageName", "hotSearch");
        data.Add("cid", "407972");
        data.Add("submitted", "true");
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
        data.Add("numberOfRooms", ddlRooms.SelectedValue);
        data.Add("room-0-adult-total", ddlAdults.SelectedValue);
        data.Add("room-0-child-total", ddlChildren.SelectedValue);
        HttpHelper.RedirectAndPOST(this.Page, "http://reservations.yourtravel.biz/index.jsp", data);
    }
}