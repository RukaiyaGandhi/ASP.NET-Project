<%@ Page Title="" Language="C#" MasterPageFile="~/MemberMaster.master" AutoEventWireup="true" CodeFile="message.aspx.cs" Inherits="message" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table class="tbl">

        <tr>

            <td class="tblHead"> My Message - <asp:Label ID="lbl" runat="server"></asp:Label></td>

        </tr>

         <tr> <td> &nbsp; </td> </tr>

        <tr>

            <td> <asp:GridView ID="GridView1" runat="server"></asp:GridView> </td>

        </tr>

        <tr> <td> &nbsp; </td> </tr>

    </table>

</asp:Content>

