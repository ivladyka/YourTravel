using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

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
        //http://travel.exampletravel.com/templates/310453/hotels/list;jsessionid=48248B80CB884956EB7381F25A8D987A.tn10tc03?checkin=12%2F2%2F12&rooms[0].adultsCount=2&targetId=AREA-601F9E75-0631-45DF-810A-62108DC82001|cities&rooms[0].childrenCount=0&lang=en_US&checkout=12%2F4%2F12&roomsCount=1&currency=USD
        //http://reservations.yourtravel.biz/templates/407972?checkin=11%2F11%2F12&checkout=11%2F13%2F12&roomsCount=1&rooms[0].adultsCount=1&rooms[0].childrenCount=0&currency=USD&currencySymbol=%24&lang=en&showOptions=false&filtering=true
        Response.Redirect("http://reservations.yourtravel.biz/templates/407972/hotels/list?checkin=" + dpCheckInDate.SelectedDate.ToString("MM/dd/yy")
            + "&roomsCount=" + ddlRooms.SelectedValue + "");
    }
}