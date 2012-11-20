<%@ Page Title="" Language="C#" MasterPageFile="~/DefaultMP.master" AutoEventWireup="true" CodeFile="Sites.aspx.cs" Inherits="Controls_Sites" %>
<%@ Register TagPrefix="uc1" TagName="SiteTableView" Src="Controls/SiteTableView.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphWithoutScroll" Runat="Server">
    <table cellpadding="10" cellspacing="2" border="0" width="100%" class="sitesbaner">
    <tr>
        <td>
            <uc1:SiteTableView id="siteTableView" runat="server"></uc1:SiteTableView>
        </td>
    </tr>
    </table>
</asp:Content>

