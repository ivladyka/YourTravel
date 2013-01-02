<%@ Page Title="" Language="C#" MasterPageFile="~/BookMasterPage.master" AutoEventWireup="true" CodeFile="CountryView.aspx.cs" Inherits="CountryView" %>
<%@ MasterType VirtualPath="~/BookMasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphLeftSide" Runat="Server">
    Other Cities in this Country
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphRightSide" Runat="Server">
    <asp:Label id="lblName" runat="server"></asp:Label>
    <asp:Panel ID="pnlCapital" runat="server">
        <%=Capital%>: <asp:HyperLink id="hlCapital" runat="server"></asp:HyperLink>
    </asp:Panel>
    <asp:Panel ID="pnlArea" runat="server">
        <%=Area%>: <asp:Label ID="lblArea" runat="server"></asp:Label>
    </asp:Panel>
    <asp:Panel ID="pnlPopulation" runat="server">
        <%=Population%>: <asp:Label ID="lblPopulation" runat="server"></asp:Label>
    </asp:Panel>
    <asp:Panel ID="pnlCurrency" runat="server">
        <%=Currency%>: <asp:Label ID="lblCurrency" runat="server"></asp:Label>
    </asp:Panel>
    <asp:Label ID="lblCountryContent" runat="server" Text=""></asp:Label>
</asp:Content>

