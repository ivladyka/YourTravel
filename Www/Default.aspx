<%@ Page Title="" Language="C#" MasterPageFile="~/DefaultMP.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
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
</script>
</telerik:RadCodeBlock>
    <div style="width:1100px; display:block;">
    <ul class="ulblock" >
        <li class="li1block">
     <div class="bookingblock" >
    <table border="0" style="width:210PX" >
              <tr>
                  <td colspan="3"><%=WhereGo%></td>
              </tr>
              <tr>
                  <td colspan="3">
                    <asp:TextBox ID="tbWhereGo" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvWhereGo" runat="server" ErrorMessage="<%$Resources:Vikkisoft, RequiredField %>" ControlToValidate="tbWhereGo" Display="Dynamic" ValidationGroup="HomeSEARCHING"></asp:RequiredFieldValidator>
                  </td>
              </tr>
              <tr>
                  <td colspan="3" style="padding-top:2px;"><%=CheckInRes%></td>
              </tr>
              <tr>
                  <td colspan="3"> 
                    <uc1:DatePicker id="dpCheckInDate" runat="server" IsRequire="true" Width="170" ValidationGroup="HomeSEARCHING" OnClientDateSelected="VIKKI_CheckInDateSelected"></uc1:DatePicker>
                   </td>
              </tr>
                <tr>
                  <td colspan="3"><%=CheckOutRes%></td>
              </tr>
                 <tr>
                  <td colspan="3">
                    <uc1:DatePicker id="dpCheckOutDate" runat="server" IsRequire="true" Width="170" ValidationGroup="HomeSEARCHING"></uc1:DatePicker>
                    </td>
                    </tr> 
                    <tr>
                  <td colspan="3">  
                    <asp:Label ID="dateCompare" runat="server" Visible="False" ForeColor="Red" Text="<%$Resources:Vikkisoft, DateCompareError %>"></asp:Label>
                  </td>
              </tr>                
                 <tr>
                  <td style="width:33%; text-align:center"><%=RoomsRes%></td>
                  <td style="width:33%; text-align:center"><%=AdultsRes%></td>
                  <td style="width:33%; text-align:center"><%=ChildrenRes%></td>
              </tr>
              <tr>
                  <td style="padding-left: 0px;">
                      <telerik:RadComboBox ID="ddlRooms" runat="server" Width="50px"  EnableLoadOnDemand="false" CssClass="homedropdown">
                      </telerik:RadComboBox> 
                  </td>
                  <td style="padding-left: 0px;">
                    <telerik:RadComboBox ID="ddlAdults" runat="server" Width="50px" EnableLoadOnDemand="false" CssClass="homedropdown">
                       </telerik:RadComboBox></td>
                  <td style="padding: 0px;">
                      <telerik:RadComboBox ID="ddlChildren" runat="server" Width="50px"  EnableLoadOnDemand="false" CssClass="homedropdown">                       
                      </telerik:RadComboBox>
                  </td>
              </tr>
                 <tr>
                  <td colspan="3" style="padding-right:5px; padding-top:5px;"> 
                      <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="<%$Resources:Vikkisoft, Search %>" ValidationGroup="HomeSEARCHING" CssClass="formbutton" Width="160px" />
                  </td>
              </tr>
          </table>
        </div>
        </li>
         <li> <div style=" width:650px; float:right">
             <div id="header">
	 <div class="container" id="header-content">
	     <div class="slideshow">
		     <ul id="slider" style="overflow: hidden;">
			     <li class="slide">
					<img width="630" height="410" class="slide-img" alt="" src="Images/1.jpg">
					<div class="sliding-image">
					</div>
					<div class="sliding-text">
					     <div style="width:550px; height:100px; top:250px; left: 0px; position:absolute; z-index:9999;">
						     <p><strong>Катберт</strong> пробовалась на роль Мери-Джейн Уотсон в фильме <strong>«Человек-паук»</strong>, но роль досталась Кирстен Данст. Она начала свою карьеру в Голливуде с маленьких ролей в фильмах <strong>«Реальная любовь»</strong> и <strong>«Старая закалка»</strong> (2001).</p>
							 <p>В следующем фильме <strong>«Соседка»</strong> она получила свою первую главную роль. У актрисы были сомнения по поводу съёмок в фильме, но режиссёр Люк Гринфилд не оставлял её в покое. Во время подготовки к съёмкам Элиша разговаривала с настоящими порноактрисами.</p>
						 </div>
					</div>
				</li>
				<li class="slide">
					 <img width="630" height="410" class="slide-img" alt="" src="Images/3.jpg">
					<div class="sliding-image">   					   
					</div>
					<div class="sliding-text">
					     <div style="width:610px; height:100px; top:270px; left: 270px; position:absolute; z-index:9999;">
						     <p>В 2007 году к Меган Фокс пришёл настоящий успех, поскольку она приняла участие в главной и самой зрелищной кинокартине 2007 года — <strong>«Трансформеры»</strong>, где исполнила роль Микаэлы Бейнс. В 2008 году снялась в роли восходящей звезды кино в фильме <strong>«Как потерять друзей и заставить всех тебя ненавидеть»</strong>.</p>
						</div>
					</div>
				</li>
				<li class="slide">
					 <img width="630" height="410" class="slide-img" alt="" src="Images/5.jpg">
					 <div class="sliding-image"> 					
					 </div>
					 <div class="sliding-text">
					     <div style="width:560px; height:100px; top:240px; left: 25px; position:absolute; z-index:9999;">
						     <p>В 1994 году Натали прошла кастинг к фильму Люка Бессона <strong>«Леон»</strong> (фр. Leon), где сыграла свою первую главную роль, девочку по имени Матильда, которая дружит с наёмным убийцей Леоном (Жан Рено). Вскоре после получения роли актриса в целях секретности взяла псевдоним «Портман», однако на DVD-диске с режиссёрской версией фильма она упоминается в титрах как Натали Хершлаг. Фильм вышел в прокат 18 ноября 1994 года и в целом получил положительные отзывы. Таким образом, её дебют в художественном кино состоялся, когда ей было всего 13 лет.</p>
							 </div>
					 </div>
				</li>
				<li class="slide">
					 <img width="630" height="410" class="slide-img" alt="" src="Images/7.jpg">
					 <div class="sliding-image"> 					    
				     </div>
					 <div class="sliding-text">
					     <div style="width:485px; height:200px; top:200px; right: 0px; position:absolute; z-index:9999;">
						     <p>В 1995 году, в одиннадцатилетнем возрасте, Ализе участвовала в конкурсе, организованном бывшей французской авиакомпанией <strong>«Air Outre Mer»</strong> (ныне Swissair). Необходимо было нарисовать рисунок на корпусе самолёта, изображённого на специальном бланке. Ализе победила в этом конкурсе, и, помимо выигранной ей поездки на Мальдивские острова, её рисунок изобразили на настоящем самолёте в полную величину, а самолёт был назван её именем.</p>
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

