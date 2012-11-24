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
                           <a id="aParis" runat="server">
                       <div class="homecitybannerimg">
                           <asp:ImageButton ID="ImageButton2" ImageUrl="~/Images/parisbanner.jpg" runat="server" CssClass="homecitybannerimg1" />
                       </div>
                           <div class="homecitybannertext">Paris<br /><div class="citytext">1,554 hotels <br /><%=SearchhotelsRes%> >></div></div>
                          </a>
                       </div>
                      
                                  
                       <div class="homecitybannerright" style="margin-top:20px;"> 
                           <a id="aLondon" runat="server">
                       <div class="homecitybannerimg">
                           <asp:ImageButton ID="ImageButton1" ImageUrl="~/Images/londonbanner.jpg" runat="server" CssClass="homecitybannerimg1" />
                       </div>
                           <div class="homecitybannertext">London<br /><div class="citytext">1,025 hotels <br /><%=SearchhotelsRes%> >></div></div>
                          </a>
                       </div>
            
                       <div class="homecitybannerleft"> 
                           <a id="aNewYourk" runat="server">
                       <div class="homecitybannerimg">
                           <asp:ImageButton ID="ImageButton3" ImageUrl="~/Images/newyorkbanner.jpg" runat="server" CssClass="homecitybannerimg1" />
                       </div>
                           <div class="homecitybannertext">New York<br /><div class="citytext">556 hotels <br /><%=SearchhotelsRes%> >></div></div>
                          </a>
                       </div>
                      
                                
                       <div class="homecitybannerright"> 
                           <a id="aRome" runat="server">
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

