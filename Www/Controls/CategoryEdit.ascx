<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CategoryEdit.ascx.cs" Inherits="CategoryEdit" %>
<%@ Register TagPrefix="uc1" TagName="EditorHTML" Src="ValueControls/EditorHTML.ascx" %>
  <table id="Table3" align="center" border="0" cellpadding="2" cellspacing="5" >
            <tr>
                <td align="right">
                    Назва:
                </td>
                <td>
                    <asp:TextBox ID="text_Name_uk" runat="server" CssClass="textBoxStyle" 
                        MaxLength="255" Width="300px"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:RequiredFieldValidator ID="rfvName_uk" runat="server" 
                        ControlToValidate="text_Name_uk" Display="Dynamic" 
                        ErrorMessage="Обов'язкове поле."></asp:RequiredFieldValidator>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td align="right">
                    Назва (рос.):
                </td>
                <td>
                    <asp:TextBox ID="text_Name_ru" runat="server" CssClass="textBoxStyle" 
                        MaxLength="255" Width="300px"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:RequiredFieldValidator ID="rfvName_ru" runat="server" 
                        ControlToValidate="text_Name_ru" Display="Dynamic" 
                        ErrorMessage="Обов'язкове поле." ></asp:RequiredFieldValidator>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td align="right">
                    Назва (анг.):
                </td>
                <td>
                    <asp:TextBox ID="text_Name_en" runat="server" CssClass="textBoxStyle" 
                        MaxLength="255" Width="300px"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:RequiredFieldValidator ID="rfvName_en" runat="server" 
                        ControlToValidate="text_Name_en" Display="Dynamic" 
                        ErrorMessage="Обов'язкове поле."></asp:RequiredFieldValidator>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td align="right" valign="top">
                    Опис:
                </td>
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <uc1:EditorHTML ID="editor_CategoryContent_uk" runat="server" />
                </td>
            </tr>
            <tr>
                <td align="right" valign="top">
                    Опис (рос.):
                </td>
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <uc1:EditorHTML ID="editor_CategoryContent_ru" runat="server" />
                </td>
            </tr>
            <tr>
                <td align="right" valign="top">
                    Опис (анг.):
                </td>
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <uc1:EditorHTML ID="editor_CategoryContent_en" runat="server" />
                </td>
            </tr>
            <tr>
               <td align="right" colspan="2">
                        &nbsp;                    
                           <asp:Button ID="btnCancel" runat="server" CommandArgument="False" ForeColor="Black" BorderStyle="None" Font-Size="10pt"  Height="30px" BackColor="#ffc33f"
                            commandname="Cancel" CssClass="formbutton1" Text="Відмінити" />     
                   <asp:Button ID="btnUpdate" runat="server" CommandArgument="Update" ForeColor="Black" BorderStyle="None" Font-Size="10pt"  Height="30px" BackColor="#ffc33f"
                            commandname="Update" CssClass="formbutton1" Text="Зберегти"/>
                </td>
             </tr>
            
    </table>