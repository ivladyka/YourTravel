<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SettingsEdit.ascx.cs" Inherits="SettingsEdit" %>
<TABLE id="Table3" class="EditControl3" cellpadding="2" cellspacing="7"  align="center" border="0" width="950px">	
    <tr>
        <td align="right">
            Заголовок:
        </td>
        <td>
            <asp:TextBox ID="text_Title_uk" runat="server" CssClass="textBoxStyle" MaxLength="100" Width="675px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="right">
            Заголовок (рос.):
        </td>
        <td>
            <asp:TextBox ID="text_Title_ru" runat="server" CssClass="textBoxStyle" MaxLength="100" Width="675px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="right">
            Заголовок (анг.):
        </td>
        <td>
            <asp:TextBox ID="text_Title_en" runat="server" CssClass="textBoxStyle" MaxLength="100" Width="675px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="right">
            Ключові слова:
        </td>
        <td>
            <asp:TextBox ID="text_Keywords_uk" runat="server" CssClass="textBoxStyle" MaxLength="250" Width="675px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="right">
            Ключові слова, рос.:
        </td>
        <td>
            <asp:TextBox ID="text_Keywords_ru" runat="server" CssClass="textBoxStyle" MaxLength="250" Width="675px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="right">
            Ключові слова, анг.:
        </td>
        <td>
            <asp:TextBox ID="text_Keywords_en" runat="server" CssClass="textBoxStyle" MaxLength="250" Width="675px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="right">
            Description meta tag:
        </td>
        <td>
            <asp:TextBox ID="text_Description_uk" runat="server" CssClass="textBoxStyle" MaxLength="200" Width="675px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="right">
            Description meta tag, рос.:
        </td>
        <td>
            <asp:TextBox ID="text_Description_ru" runat="server" CssClass="textBoxStyle" MaxLength="200" Width="675px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="right">
            Description meta tag, анг.:
        </td>
        <td>
            <asp:TextBox ID="text_Description_en" runat="server" CssClass="textBoxStyle" MaxLength="200" Width="675px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="right">
            Заголовок суфікс:
        </td>
        <td>
            <asp:TextBox ID="text_TitleSuffix_uk" runat="server" CssClass="textBoxStyle" MaxLength="100" Width="675px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="right">
            Заголовок суфікс (рос.):
        </td>
        <td>
            <asp:TextBox ID="text_TitleSuffix_ru" runat="server" CssClass="textBoxStyle" MaxLength="100" Width="675px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="right">
            Заголовок суфікс (анг.):
        </td>
        <td>
            <asp:TextBox ID="text_TitleSuffix_en" runat="server" CssClass="textBoxStyle" MaxLength="100" Width="675px"></asp:TextBox>
        </td>
    </tr>
  	<tr>
	    <td colspan="2" align="right">
	      <asp:Button ID="btnCancel" runat="server" CommandArgument="False" ForeColor="Black" BorderStyle="None" Font-Size="10pt"  Height="30px" BackColor="#ffc33f"
                            commandname="Cancel" CssClass="formbutton1" Text="Відмінити" />     
                   <asp:Button ID="btnUpdate" runat="server" CommandArgument="Update" ForeColor="Black" BorderStyle="None" Font-Size="10pt"  Height="30px" BackColor="#ffc33f"
                            commandname="Update" CssClass="formbutton1" Text="Зберегти"/>
			 </td>
	</tr>
</TABLE>