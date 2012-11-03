<%@ Page Title="" Language="C#" MasterPageFile="~/DefaultMP.master" AutoEventWireup="true" CodeFile="Office.aspx.cs" Inherits="Office_Office" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphWithoutScroll" Runat="Server"><br />
    &nbsp;&nbsp;&nbsp;
    <asp:HyperLink ID="hlSites" runat="server" Text="Сайти" NavigateUrl="~/Office/Office.aspx?content=SiteList"></asp:HyperLink>&nbsp;&nbsp;&nbsp;
    <asp:HyperLink ID="hlChangePassword" runat="server" Text="Змінити пароль" NavigateUrl="~/Office/Office.aspx?content=ChangePassword"></asp:HyperLink>&nbsp;&nbsp;&nbsp;
    <asp:HyperLink ID="hlLogOff" runat="server" Text="Вийти" NavigateUrl="~/LogOff.aspx"></asp:HyperLink>
</asp:Content>

