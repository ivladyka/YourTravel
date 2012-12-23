<%@ Page Title="" Language="C#" MasterPageFile="~/BookMasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ Register TagPrefix="uc1" TagName="SiteTableView" Src="Controls/SiteTableView.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphLeftSide" Runat="Server">
                <uc1:SiteTableView id="siteTableView" runat="server"></uc1:SiteTableView>  
                <asp:HyperLink ID="hlMore" runat="server" Text="More" CssClass="moreSites" NavigateUrl="Sites.aspx?st=1"></asp:HyperLink>  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphRightSide" Runat="Server">
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
         
</asp:Content>

