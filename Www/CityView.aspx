<%@ Page Title="" Language="C#" MasterPageFile="~/BookMasterPage.master" AutoEventWireup="true" CodeFile="CityView.aspx.cs" Inherits="CityView" %>
<%@ MasterType VirtualPath="~/BookMasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphLeftSide" Runat="Server">
    Other Cities in this Country
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphRightSide" Runat="Server">
    <asp:Label id="lblName" runat="server"></asp:Label>
    <asp:Panel ID="pnlCountry" runat="server">
        <%=Country%>: <asp:HyperLink id="hlCountry" runat="server"></asp:HyperLink>
    </asp:Panel>
    <asp:Label ID="lblCityContent" runat="server" Text=""></asp:Label>
</asp:Content>

