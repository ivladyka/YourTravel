<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CountryEdit.ascx.cs" Inherits="CountryEdit" %>
<%@ Register TagPrefix="uc1" TagName="EditorHTML" Src="ValueControls/EditorHTML.ascx" %>
<%@ Register TagPrefix="uc1" TagName="IntInput" Src="ValueControls/IntInput.ascx" %>
<%@ Register TagPrefix="uc1" TagName="CityChoice" Src="ChoiceControls/CityChoice.ascx" %>
<TABLE id="Table3" class="EditControl3" cellpadding="2" cellspacing="7"  align="center" border="0" width="550px">	
    <tr>
        <td align="right">
            Назва:
        </td>
        <td>
            <asp:TextBox ID="text_Name_uk" runat="server" CssClass="textBoxStyle" MaxLength="50" Width="300px"></asp:TextBox>
            &nbsp;
            <asp:RequiredFieldValidator ID="rfvName_uk" runat="server" ControlToValidate="text_Name_uk" Display="Dynamic" 
                ErrorMessage="Обов'язкове поле."></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td align="right">
            Назва (рос.):
        </td>
        <td>
            <asp:TextBox ID="text_Name_ru" runat="server" CssClass="textBoxStyle" MaxLength="50" Width="300px"></asp:TextBox>
            &nbsp;
            <asp:RequiredFieldValidator ID="rfvName_ru" runat="server" ControlToValidate="text_Name_ru" Display="Dynamic" 
                ErrorMessage="Обов'язкове поле."></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td align="right">
            Назва (анг.):
        </td>
        <td>
            <asp:TextBox ID="text_Name_en" runat="server" CssClass="textBoxStyle" MaxLength="50" Width="300px"></asp:TextBox>
            &nbsp;
            <asp:RequiredFieldValidator ID="rfvName_en" runat="server" ControlToValidate="text_Name_en" Display="Dynamic" 
                ErrorMessage="Обов'язкове поле."></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td align="right" valign="top">
            Опис:
        </td>
        <td>
            <uc1:EditorHTML ID="editor_Content_uk" runat="server" />
        </td>
    </tr>
    <tr>
        <td align="right" valign="top">
            Опис (рос.):
        </td>
        <td>
            <uc1:EditorHTML ID="editor_Content_ru" runat="server" />
        </td>
    </tr>
    <tr>
        <td align="right" valign="top">
            Опис (анг.):
        </td>
        <td>
            <uc1:EditorHTML ID="editor_Content_en" runat="server" />
        </td>
    </tr>
    <tr>
        <td align="right" valign="top">
            Площа, кв. км.:
        </td>
        <td>
            <uc1:IntInput ID="int_Area" runat="server" />
        </td>
    </tr>
    <tr>
        <td align="right" valign="top">
            Населення:
        </td>
        <td>
            <uc1:IntInput ID="int_Population" runat="server" />
        </td>
    </tr>
    <tr>
        <td align="right">
            Kод валюти:
        </td>
        <td>
            <asp:TextBox ID="text_CurrencyCode" runat="server" CssClass="textBoxStyle" MaxLength="3" Width="50px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="right">
            Валюта:
        </td>
        <td>
            <asp:TextBox ID="text_CurrencyName_uk" runat="server" CssClass="textBoxStyle" MaxLength="50" Width="300px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="right">
            Валюта (рос.):
        </td>
        <td>
            <asp:TextBox ID="text_CurrencyName_ru" runat="server" CssClass="textBoxStyle" MaxLength="50" Width="300px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="right">
            Валюта (анг.):
        </td>
        <td>
            <asp:TextBox ID="text_CurrencyName_en" runat="server" CssClass="textBoxStyle" MaxLength="50" Width="300px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="right">
            Ключові слова:
        </td>
        <td>
            <asp:TextBox ID="text_Keywords_uk" runat="server" CssClass="textBoxStyle" MaxLength="250" Width="300px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="right">
            Ключові слова, рос.:
        </td>
        <td>
            <asp:TextBox ID="text_Keywords_ru" runat="server" CssClass="textBoxStyle" MaxLength="250" Width="300px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="right">
            Ключові слова, анг.:
        </td>
        <td>
            <asp:TextBox ID="text_Keywords_en" runat="server" CssClass="textBoxStyle" MaxLength="250" Width="300px"></asp:TextBox>
        </td>
    </tr>
    <tr>
		<td align="right">Активний:
		</td>
		<td>
           <asp:CheckBox id="chk_Active" runat="server" Text="" Checked="false"></asp:CheckBox>
		</td>
    </tr>
    <tr>
	    <td align="right">Столиця:
		</td>
		<td>
            <uc1:CityChoice id="choice_CapitalID" runat="server" UseValueInsteadText="true" Width="300"></uc1:CityChoice>
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