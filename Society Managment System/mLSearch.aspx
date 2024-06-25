<%@ Page Title="" Language="C#" MasterPageFile="~/MemberMaster.master" AutoEventWireup="true" CodeFile="mLSearch.aspx.cs" Inherits="mLSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
     
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table class="tbl">

        <tr>

            <td>  Search of</td>
            <td>  <asp:DropDownList ID="ddlSociety" runat="server" CssClass="txt1" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="SName" DataValueField="Society_ID">
                <asp:ListItem>---Select House---</asp:ListItem>
                </asp:DropDownList>
                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Society_MANAGEMENTConnectionString2 %>" SelectCommand="SELECT [Society_ID], [SName] FROM [SocietyDetails]"></asp:SqlDataSource>
                 <asp:Label ID="lblSname" runat="server" Visible="false"></asp:Label> </td>

        </tr>

         <tr>

        <td>  &nbsp; </td>

        </tr>

        <tr>

            <td align ="center">

                <asp:GridView ID="GridView1" runat="server"></asp:GridView>

            </td>

        </tr>

    </table>

</asp:Content>

