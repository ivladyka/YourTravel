﻿<%@ Page Title="" Language="C#" MasterPageFile="~/DefaultMP.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ Register TagPrefix="uc1" TagName="DatePicker" Src="Controls/ValueControls/DatePicker.ascx" %>
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
    <div style="width:1100px; display:block;">
    <ul class="ulblock" >
        <li class="li1block">
     <div class="bookingblock" >
    <table border="0" width="350px" class="bookingblocktabl"  >
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
                      <table border="0" width="100%" class="dateCheckInOut">
                          <tr>
                              <td><%=CheckInRes%></td> 
                              <td><%=CheckOutRes%></td>
                          </tr>
                          <tr>
                              <td><uc1:DatePicker Width="160" id="dpCheckInDate" runat="server" IsRequire="true"  ValidationGroup="HomeSEARCHING" OnClientDateSelected="VIKKI_CheckInDateSelected"></uc1:DatePicker></td> 
                              <td><uc1:DatePicker  Width="160"  id="dpCheckOutDate" runat="server" IsRequire="true" ValidationGroup="HomeSEARCHING"></uc1:DatePicker></td>
                          </tr>
                      </table>
                   <asp:Label ID="dateCompare" runat="server" Visible="False" ForeColor="white" Text="<%$Resources:Vikkisoft, DateCompareError %>"></asp:Label>

                  </td>
              </tr>
              <tr>
                  <td>
                    <table id="tblRooms" runat="server" border="0" width="100%" cellpadding="0" cellspacing="4">
                        <tr>
                            <td style="width:40px; text-align:left;">
                                <%=RoomsRes%>
                            </td>
                            <td></td>
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
                  <td style="padding-right:5px; padding-top:5px;"> 
                      <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="<%$Resources:Vikkisoft, Search %>" ValidationGroup="HomeSEARCHING" CssClass="formbutton" Width="250"  Height="50px"/>
                  </td>
              </tr>
          </table>
        </div>
        </li>
         <li> <div style=" width:680px; float:right">
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
<!-- /pcvector.net -->    </div>

            </div> 
         </li>
    </ul>
  


    </div>
</asp:Content>

