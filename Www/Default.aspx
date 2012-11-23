<%@ Page Title="" Language="C#" MasterPageFile="~/DefaultMP.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ Register TagPrefix="uc1" TagName="DatePicker" Src="Controls/ValueControls/DatePicker.ascx" %>
<%@ Register TagPrefix="uc1" TagName="SiteTableView" Src="Controls/SiteTableView.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphWithoutScroll" Runat="Server">
<telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
<script language="javascript">
    function VIKKI_CheckInDateSelected(sender, e) {
        if (e.get_newDate() != null) {
            VIKKI_SetDataPicketValue($find("<%= dpCheckOutDate.DatePickerClientID %>"), e.get_newDate());
        }
    }
    function VIKKI_SetDataPicketValue(datePicker, date) {
        date.setDate(date.getDate() + 1);
        datePicker.set_selectedDate(date);
    }
    function VIKKI_RoomsChange(e) {
        var control = VIKKI_GetCurrentElementOrTarget(e);
        var countRooms = parseInt(control.options[control.selectedIndex].text);
        var tableRooms = document.getElementById("<%= tblRooms.ClientID %>");
        for (var i = 1; i < tableRooms.rows.length; i++) {
            var hide = true;
            if (i <= countRooms) {
                hide = false;
            }
            VIKKI_HideControl(tableRooms.rows[i], hide);
        }
        VIKKI_InitAgesColumn();
    }
    function VIKKI_ChildrenChange(e) {
        var control = VIKKI_GetCurrentElementOrTarget(e);
        var countChildren = parseInt(control.options[control.selectedIndex].text);
        var tableRooms = document.getElementById("<%= tblRooms.ClientID %>");
        for (var i = 0; i < 3; i++) {
            var hide = true;
            if (i < countChildren) {
                hide = false;
            }
            var ChildAgeDDL = VIKKI_GetDDL(control.parentNode.parentNode.cells[4], "ddlChildAge" + i + "_");
            VIKKI_HideControl(ChildAgeDDL, hide);
        }
        VIKKI_InitAgesColumn();
    }
    function VIKKI_InitAgesColumn() {
        var tableRooms = document.getElementById("<%= tblRooms.ClientID %>");
        var roomsDDL = VIKKI_GetDDL(tableRooms.rows[1].cells[0], "ddlRooms");
        var countRooms = parseInt(roomsDDL.options[roomsDDL.selectedIndex].text);
        var hideAgesColumn = true;
        for (var i = 1; i <= countRooms; i++) {
            var ChildrenDDL = VIKKI_GetDDL(tableRooms.rows[i].cells[3], "ddlChildren");
            if (parseInt(ChildrenDDL.options[ChildrenDDL.selectedIndex].text) > 0) {
                hideAgesColumn = false;
            }
        }
        for (var i = 0; i <= countRooms; i++) {
            VIKKI_HideControl(tableRooms.rows[i].cells[4], hideAgesColumn);
        }
    }
</script>
</telerik:RadCodeBlock>
    <div style="width:1100px; display:block; overflow:hidden;  margin-bottom:120px;">
    <ul class="ulblock" >
        <li class="li1block">
     <div class="bookingblock" >
    <table border="0" width="350px" class="bookingblocktabl" cellpadding="5" cellspacing="0">
              <tr >
                  <td class="bookingblockheader"><%=Booking%></td>
              </tr>
              <tr>
                  <td><%=WhereGo%></td>
              </tr>
              <tr>
                  <td>
                    <asp:TextBox ID="tbWhereGo" runat="server" Width="100%" Height="26px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvWhereGo" runat="server" ErrorMessage="<%$Resources:Vikkisoft, RequiredField %>" ControlToValidate="tbWhereGo" Display="Dynamic" ValidationGroup="HomeSEARCHING"></asp:RequiredFieldValidator>
                  </td>
              </tr>
              <tr>
                  <td>
                      <table border="0" width="100%" class="dateCheckInOut"  cellpadding="0" cellspacing="0">
                          <tr>
                              <td>
                                  <%=CheckInRes%>
                              </td> 
                              <td style="padding-left:10px">
                                  <%=CheckOutRes%>
                              </td>
                          </tr>
                          <tr>
                              <td><uc1:DatePicker Width="160"  id="dpCheckInDate" runat="server" IsRequire="true"  ValidationGroup="HomeSEARCHING" OnClientDateSelected="VIKKI_CheckInDateSelected"></uc1:DatePicker></td> 
                              <td align="right"><uc1:DatePicker  Width="160"  id="dpCheckOutDate" runat="server" IsRequire="true" ValidationGroup="HomeSEARCHING"></uc1:DatePicker></td>
                          </tr>
                      </table>
                   <asp:Label ID="dateCompare" runat="server" Visible="False" ForeColor="white" Text="<%$Resources:Vikkisoft, DateCompareError %>"></asp:Label>
                  </td>
              </tr>
              <tr>
                  <td style="padding:0px; margin:0px">
                    <table id="tblRooms" runat="server" border="0" width="100%" cellpadding="5" cellspacing="0">
                        <tr>
                            <td style="width:40px; text-align:left;">
                                <%=RoomsRes%>
                            </td>
                            <td  ></td>
                            <td>
                                <%=AdultsRes%>
                            </td>
                            <td>
                                <%=ChildrenRes%>
                            </td>
                            <td style="visibility:hidden; display:none;">
                                <%=AgeOfChildren%>
                            </td>
                        </tr>
                    </table>
                  </td>
              </tr>
              <tr>
                  <td style="padding-right:5px; "> 
                      <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="<%$Resources:Vikkisoft, Search %>" ValidationGroup="HomeSEARCHING" CssClass="formbutton" Width="250"  Height="50px"/>
                  </td>
              </tr>
          </table>
        </div>
                <uc1:SiteTableView id="siteTableView" runat="server"></uc1:SiteTableView>  
                <asp:HyperLink ID="hlMore" runat="server" Text="More" CssClass="moreSites" NavigateUrl="Sites.aspx?st=1"></asp:HyperLink>  </li>
         <li style=" width:680px; float:right">           
             <div id="header">
	 <div class="container" id="header-content">
	     <div class="slideshow">
		     <ul id="slider" style="overflow: hidden;">
			     <li class="slide">
					<img width="680" height="410" class="slide-img" alt="" src="Images/1.jpg">
					<div class="sliding-image">
					</div>
					<div class="sliding-text">
					     <div style="width:400px; height:100px; top:250px; left: 100px; position:absolute; z-index:9999;">
						     <p> Text1</p>
							 <p>Text2</p>
						 </div>
					</div>
				</li>
				<li class="slide">
					 <img width="680" height="410" class="slide-img" alt="" src="Images/3.jpg">
					<div class="sliding-image">   					   
					</div>
					<div class="sliding-text">
					     <div style="width:400px; height:100px; top:270px; left: 100px; position:absolute; z-index:9999;">
						     <p> Text1</p>
						</div>
					</div>
				</li>
				<li class="slide">
					 <img width="680" height="410" class="slide-img" alt="" src="Images/5.jpg">
					 <div class="sliding-image"> 					
					 </div>
					 <div class="sliding-text">
					     <div style="width:400px; height:100px; top:240px; left: 100px; position:absolute; z-index:9999;">
						     <p>Text1</p>
							 </div>
					 </div>
				</li>
				<li class="slide">
					 <img width="680" height="410" class="slide-img" alt="" src="Images/7.jpg">
					 <div class="sliding-image"> 					    
				     </div>
					 <div class="sliding-text">
					     <div style="width:400px; height:200px; top:200px; right: 0px; position:absolute; z-index:9999;">
						     <p>Text1</p>
							 <p><a title="Узнать больше" href="http://ru.wikipedia.org/wiki/%D0%96%D0%B0%D0%BA%D0%BE%D1%82%D0%B5,_%D0%90%D0%BB%D0%B8%D0%B7%D0%B5">Подробнее</a></p>
								
						</div>
					</div>
				</li>
			</ul> 
		</div>
		<div class="controls"> 
		     <span style="" id="resumeButton"><a title="Плей" href="">Плей</a></span> 
			 <span style="" id="pauseButton"><a title="Пауза" href="">Пауза</a></span>
			 <div style="" id="nav"></div>
		</div>
<!-- pcvector.net -->
<script type="text/javascript" src="/templates/pcv/js/pcvector.js"></script>
<!-- /pcvector.net -->    

	 </div>
            </div>   
         <div style="top: 20px;  margin-bottom:20px; height:40px;"><h1> <%=PopulardestinationsRes%> </h1></div>
                       <div class="homecitybannerleft" style="margin-top:20px;"> 
                           <a href="http://reservations.yourtravel.biz/templates/407972/hotels/list?lang=en&currency=USD&mcicid=407972.homepage.hotel.city-AREA-9b0681e3-6d9f-47e8-8e14-5389f83569dd&secureUrlFromDataBridge=https%3A%2F%2Fwww.travelnow.com&requestVersion=V2&targetId=AREA-9b0681e3-6d9f-47e8-8e14-5389f83569dd|cities&checkout=&checkin=&roomsCount=1&rooms[0].adultsCount=2&rooms[0].childrenCount=0&dateless=true&search=true&mcicid=407972.homepage.hotel.city-AREA-9b0681e3-6d9f-47e8-8e14-5389f83569dd&pagename=ToSearchResults">
                       <div class="homecitybannerimg">
                           <asp:ImageButton ID="ImageButton2" ImageUrl="~/Images/parisbanner.jpg" runat="server" CssClass="homecitybannerimg1" />
                       </div>
                           <div class="homecitybannertext">Paris<br /><div class="citytext">1,554 hotels <br /><%=SearchhotelsRes%> >></div></div>
                          </a>
                       </div>
                      
                                  
                       <div class="homecitybannerright" style="margin-top:20px;"> 
                           <a href="http://reservations.yourtravel.biz/templates/407972/hotels/list?secureUrlFromDataBridge=https%3A%2F%2Fwww.travelnow.com&requestVersion=V2&lang=en&currency=USD&targetId=AREA-9b0681e3-6d9f-47e8-8e14-5389f83569dd%7Ccities&destination=Paris%2C%20France&checkout=11%2F27%2F2012&checkin=11%2F25%2F2012&roomsCount=1&rooms[0].adultsCount=2&rooms[0].childrenCount=0&datelessValidating=false&pagename=ToSearchResults&linkId=Home:Hot:SrcWiz:Search#linkId=HotSearch%3AHot%3ASrcWiz%3ASearch&bookmark=%257B%2522hotelIds%2522%253A%2522%2522%252C%2522requestVersion%2522%253A%2522V2%2522%252C%2522lang%2522%253A%2522en%2522%252C%2522currency%2522%253A%2522USD%2522%252C%2522targetId%2522%253A%2522AREA-3d931ace-e3fe-46b4-a243-61d44a22053b%257Ccities%2522%252C%2522destination%2522%253A%2522London%252C%2520United%2520Kingdom%2522%252C%2522checkout%2522%253A%252211/27/2012%2522%252C%2522checkin%2522%253A%252211/25/2012%2522%252C%2522roomsCount%2522%253A%25221%2522%252C%2522rooms%255B0%255D.adultsCount%2522%253A%25222%2522%252C%2522rooms%255B0%255D.childrenCount%2522%253A%25220%2522%252C%2522tab%2522%253A%2522list%2522%252C%2522widgets%2522%253A%255B%2522filter-bar%2522%252C%2522search-details%2522%252C%2522select-rooms%2522%252C%2522results-total%2522%252C%2522results%2522%252C%2522paging%2522%252C%2522select-destination%2522%252C%2522content-links-bar%2522%252C%2522change-view-mode%2522%252C%2522change-destination-errors%2522%252C%2522change-destination%2522%252C%2522pageTitle%2522%252C%2522properties-count%2522%255D%252C%2522search%2522%253Atrue%252C%2522savedDestination%2522%253A%2522London%252C%2520United%2520Kingdom%2522%257D">
                       <div class="homecitybannerimg">
                           <asp:ImageButton ID="ImageButton1" ImageUrl="~/Images/londonbanner.jpg" runat="server" CssClass="homecitybannerimg1" />
                       </div>
                           <div class="homecitybannertext">London<br /><div class="citytext">1,025 hotels <br /><%=SearchhotelsRes%> >></div></div>
                          </a>
                       </div>
            
                       <div class="homecitybannerleft"> 
                           <a href="http://reservations.yourtravel.biz/templates/407972/hotels/list?lang=en&currency=USD&mcicid=407972.homepage.hotel.city-AREA-9b0681e3-6d9f-47e8-8e14-5389f83569dd&secureUrlFromDataBridge=https%3A%2F%2Fwww.travelnow.com&requestVersion=V2&targetId=AREA-9b0681e3-6d9f-47e8-8e14-5389f83569dd|cities&checkout=&checkin=&roomsCount=1&rooms[0].adultsCount=2&rooms[0].childrenCount=0&dateless=true&search=true&mcicid=407972.homepage.hotel.city-AREA-9b0681e3-6d9f-47e8-8e14-5389f83569dd&pagename=ToSearchResults#linkId=HotSearch%3AHot%3ASrcWiz%3ASearch&bookmark=%257B%2522hotelIds%2522%253A%2522%2522%252C%2522requestVersion%2522%253A%2522V2%2522%252C%2522lang%2522%253A%2522en%2522%252C%2522currency%2522%253A%2522USD%2522%252C%2522targetId%2522%253A%2522AREA-572B0850-4E3F-469B-87B2-C17ED3EA049B%257Ccities%2522%252C%2522destination%2522%253A%2522New%2520York%252C%2520NY%252C%2520United%2520States%2522%252C%2522checkout%2522%253A%2522%2522%252C%2522checkin%2522%253A%2522%2522%252C%2522roomsCount%2522%253A%25221%2522%252C%2522rooms%255B0%255D.adultsCount%2522%253A%25222%2522%252C%2522rooms%255B0%255D.childrenCount%2522%253A%25220%2522%252C%2522tab%2522%253A%2522list%2522%252C%2522mcicid%2522%253A%255B%2522407972.homepage.hotel.city-AREA-9b0681e3-6d9f-47e8-8e14-5389f83569dd%2522%252C%2522407972.homepage.hotel.city-AREA-9b0681e3-6d9f-47e8-8e14-5389f83569dd%2522%255D%252C%2522widgets%2522%253A%255B%2522filter-bar%2522%252C%2522search-details%2522%252C%2522select-rooms%2522%252C%2522results-total%2522%252C%2522results%2522%252C%2522paging%2522%252C%2522select-destination%2522%252C%2522content-links-bar%2522%252C%2522change-view-mode%2522%252C%2522change-destination-errors%2522%252C%2522change-destination%2522%252C%2522pageTitle%2522%252C%2522properties-count%2522%255D%252C%2522search%2522%253Atrue%252C%2522savedDestination%2522%253A%2522New%2520York%252C%2520NY%252C%2520United%2520States%2522%257D">
                       <div class="homecitybannerimg">
                           <asp:ImageButton ID="ImageButton3" ImageUrl="~/Images/newyorkbanner.jpg" runat="server" CssClass="homecitybannerimg1" />
                       </div>
                           <div class="homecitybannertext">New York<br /><div class="citytext">556 hotels <br /><%=SearchhotelsRes%> >></div></div>
                          </a>
                       </div>
                      
                                
                       <div class="homecitybannerright"> 
                           <a href="http://reservations.yourtravel.biz/templates/407972/hotels/list?lang=en&currency=USD&mcicid=407972.homepage.hotel.city-AREA-9b0681e3-6d9f-47e8-8e14-5389f83569dd&secureUrlFromDataBridge=https%3A%2F%2Fwww.travelnow.com&requestVersion=V2&targetId=AREA-9b0681e3-6d9f-47e8-8e14-5389f83569dd|cities&checkout=&checkin=&roomsCount=1&rooms[0].adultsCount=2&rooms[0].childrenCount=0&dateless=true&search=true&mcicid=407972.homepage.hotel.city-AREA-9b0681e3-6d9f-47e8-8e14-5389f83569dd&pagename=ToSearchResults&search=true#linkId=HotSearch%3AHot%3ASrcWiz%3ASearch&bookmark=%257B%2522hotelIds%2522%253A%2522%2522%252C%2522requestVersion%2522%253A%2522V2%2522%252C%2522lang%2522%253A%2522en%2522%252C%2522currency%2522%253A%2522USD%2522%252C%2522targetId%2522%253A%2522AREA-a117d333-7373-719e-c8b2-bb5e43907ff4%257Ccities%2522%252C%2522destination%2522%253A%2522Rome%252C%2520Italy%2522%252C%2522checkout%2522%253A%2522%2522%252C%2522checkin%2522%253A%2522%2522%252C%2522roomsCount%2522%253A%25221%2522%252C%2522rooms%255B0%255D.adultsCount%2522%253A%25222%2522%252C%2522rooms%255B0%255D.childrenCount%2522%253A%25220%2522%252C%2522tab%2522%253A%2522list%2522%252C%2522mcicid%2522%253A%255B%2522407972.homepage.hotel.city-AREA-9b0681e3-6d9f-47e8-8e14-5389f83569dd%2522%252C%2522407972.homepage.hotel.city-AREA-9b0681e3-6d9f-47e8-8e14-5389f83569dd%2522%255D%252C%2522widgets%2522%253A%255B%2522filter-bar%2522%252C%2522search-details%2522%252C%2522select-rooms%2522%252C%2522results-total%2522%252C%2522results%2522%252C%2522paging%2522%252C%2522select-destination%2522%252C%2522content-links-bar%2522%252C%2522change-view-mode%2522%252C%2522change-destination-errors%2522%252C%2522change-destination%2522%252C%2522pageTitle%2522%252C%2522properties-count%2522%255D%252C%2522search%2522%253Atrue%252C%2522savedDestination%2522%253A%2522Rome%252C%2520Italy%2522%257D">
                       <div class="homecitybannerimg">
                           <asp:ImageButton ID="ImageButton4" ImageUrl="~/Images/Romebanner.jpg" runat="server" CssClass="homecitybannerimg1" />
                       </div>
                           <div class="homecitybannertext">Rome<br /><div class="citytext">1,673 hotels <br /><%=SearchhotelsRes%> >></div></div>
                          </a>
                       </div>
             </td>
               </tr>
           </table>
         </li>
    </ul>
    </div>
</asp:Content>

