<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="sellList.aspx.cs" Inherits="sellList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

     <style type="text/css">
        .style1
        {
            width: 100px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table class="tbl">

        <tr>

            <td class="tblHead"> Sell List </td>    
                    
        </tr>


        <tr align="center"> <td>


            <asp:Label ID="lblSociety" runat="server" Text="Select Society"></asp:Label>

            <asp:DropDownList ID="ddlSociety" runat="server"  AppendDataBoundItems="true"></asp:DropDownList> 
            
            <asp:Button ID="Button1" runat="server" Text="View Report" OnClick="Button1_Click" /> 

          </td>

        </tr>

        <tr align="center">

            <td><asp:Label ID="lbl" runat="server"></asp:Label></td>

        </tr>

        <tr>

 

            <td>

                <table class="style1" align="center">

                    <tr>

                        <td> &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; </td>

                        

                            <td colspan="2">
                            <asp:GridView ID="GRVSell" runat="server" AutoGenerateColumns="false" style="text-align:center" ForeColor="#497174">
                                <Columns>
                                    <asp:BoundField  DataField="Sell_ID" HeaderText="Sell ID"/>
                                    <asp:BoundField  DataField="House_ID" HeaderText="House ID"/>
                                    <asp:BoundField DataField="Society_ID" HeaderText="Society ID"/>
                                    <asp:BoundField DataField="Owner_ID" HeaderText="Owner ID" />
                                    <asp:BoundField DataField="Sell_Price" HeaderText="Sell Price" />
                                </Columns>
                            </asp:GridView>
                        
                        </td>
                   
                    </tr>

                </table>

            </td>

        </tr>

        <tr>

            <td align="center" style="text-align:center"> &nbsp; </td>

        </tr>

        <tr>

            <td> &nbsp; </td>

        </tr>


    </table>


</asp:Content>

