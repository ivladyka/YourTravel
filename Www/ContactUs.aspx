<%@ Page Title="" Language="C#" MasterPageFile="~/DefaultMP.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphWithoutScroll" Runat="Server">
    <table cellpadding="0" cellspacing="0"  border="0" style=" float:right; margin:0px 20px 0px 20px;" >
        <tr style="height:27px;">
            <td style="width: 110px; text-align:left;  padding-right:5px;">
                <asp:Label ID="lblYourName" runat="server" Text="<%$Resources:Vikkisoft, YourName %>"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="padding:0px;" >
                <asp:TextBox ID="tbName" runat="server" TabIndex="1" Width="240px" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="<%$Resources:Vikkisoft, RequiredField %>" ControlToValidate="tbName" Display="Dynamic" ValidationGroup="ContactUsValidation"></asp:RequiredFieldValidator>
            </td>
        </tr>                           
        <tr style="height:27px;">
            <td style="width: 110px; text-align:left;  padding-right:5px;">
                E-mail:</td>
            </tr>
        <tr>
            <td style="padding:0px;">
                <asp:TextBox ID="tbEmailAddress" runat="server" TabIndex="2" Width="240px" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="<%$Resources:Vikkisoft, RequiredField %>" ControlToValidate="tbEmailAddress" Display="Dynamic" ValidationGroup="ContactUsValidation"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="<%$Resources:Vikkisoft, IncorrectEmail %>" ControlToValidate="tbEmailAddress" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="ContactUsValidation"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr style="height:27px;">
            <td style="width: 110px; text-align:left; vertical-align:top; padding-right:5px; padding-top:5px;">
                <asp:Label ID="Label3" runat="server" Text="<%$Resources:Vikkisoft, Message %>">:</asp:Label>
            </td>
        </tr>
        <tr>
            <td style="padding:0px;">
                <asp:TextBox ID="tdComments"  runat="server" TabIndex="6" Width="400px"  TextMode="MultiLine" Rows="7" MaxLength="7"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvComment" runat="server" ErrorMessage="<%$Resources:Vikkisoft, RequiredField %>" ControlToValidate="tdComments" Display="Dynamic" ValidationGroup="ContactUsValidation"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr class="VIKKI_HiddenButton">
            <td>
            </td>
            <td>
                <asp:TextBox ID="tbCFH" runat="server" TabIndex="7" Width="400px" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="text-align:left;  padding:10px 15px 0px 3px;">
                <asp:Button ID="btnSendMessage" runat="server" OnClick="btnSendMessage_Click" Text=" <%$Resources:Vikkisoft, SendMessage %> "  CssClass="formbutton" ValidationGroup="ContactUsValidation" />
            </td>
        </tr>
        <tr>
            <td>
                <div style="font-size:10pt; color:#d60000; font-weight:bold;">
                    <asp:Label ID="lbError" runat="server" Text="" Visible="False"></asp:Label>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>

