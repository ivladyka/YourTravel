<%@ Page Title="" Language="C#" MasterPageFile="~/DefaultMP.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphWithoutScroll" Runat="Server">
    <div id="formdiv"style=" bottom: 0px; position: absolute;">       
           <asp:Image ID="logo" runat="server" ImageUrl="~/Images/logo.gif"  /><br />
        <div>
            <asp:Label ID="Label1" runat="server" Text="YourTravel" CssClass="CompanyName">Your</asp:Label><asp:Label ID="Label2" runat="server" Text="YourTravel" CssClass="CompanyName1">Travel</asp:Label>
            <br /><asp:Label ID="Label3" runat="server" Text="Coming soon" CssClass="Comingsoom">Coming  soon</asp:Label>
        </div>
    </div> 
</asp:Content>

