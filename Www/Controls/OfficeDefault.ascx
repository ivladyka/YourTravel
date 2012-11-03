<%@ Control Language="C#" AutoEventWireup="true" CodeFile="OfficeDefault.ascx.cs" Inherits="OfficeDefault" %>
<asp:HyperLink ID="hlSites" runat="server" Text="Сайти" NavigateUrl="~/Office/Office.aspx?content=SiteList"></asp:HyperLink><br />
<asp:HyperLink ID="hlChangePassword" runat="server" Text="Змінити пароль" NavigateUrl="~/Office/Office.aspx?content=ChangePassword"></asp:HyperLink><br />
<asp:HyperLink ID="hlLogOff" runat="server" Text="Вийти" NavigateUrl="~/LogOff.aspx"></asp:HyperLink>