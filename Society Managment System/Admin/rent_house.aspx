<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="rent_house.aspx.cs" Inherits="Admin_rent_house" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">



<style type="text/css">
        .style1
        {
            width: 811px;
        }
        .style2
        {
            width: 157px;
        }
    </style>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <table class="tbl">

        <tr> <td class="tblHead"> Rent House </td> </tr>

         <tr> <td>  &nbsp; </td> </tr>

        <tr>

            <td>

                <table class="style1">


                    <tr>

                        <td class="style2"> &nbsp; </td>

                        <td> <asp:Label ID="lblSociety" runat="server" Text="Select Society"></asp:Label>  </td>
                        <td> <asp:DropDownList ID="ddlSociety" runat="server" AppendDataBoundItems="true"></asp:DropDownList>  
                
                            <asp:Button ID="Button1" runat="server" Text="View Report" OnClick="Button1_Click" />

                        </td>
                        <td>
                                        
                        </td>
                    </tr>

                    <tr>
                        <td>&nbsp;</td>
                        <td colspan="2">
                            <asp:GridView ID="GRVRENT" runat="server" AutoGenerateColumns="false" style="text-align:center" ForeColor="#497174" >
                                <Columns>
                                    <asp:BoundField  DataField="Rent_ID" HeaderText="Rent ID"/>
                                    <asp:BoundField  DataField="House_ID" HeaderText="House ID"/>
                                    <asp:BoundField DataField="Society_ID" HeaderText="Society ID"/>
                                    <asp:BoundField DataField="Owner_ID" HeaderText="Owner ID" />
                                    <asp:BoundField DataField="House_Rent" HeaderText="Rent Price" />
                                    
                                </Columns>
                            </asp:GridView>
                        </td>

                    </tr>

                     <tr>

                    <td class="style2"> &nbsp;</td>
                         <td>
                             <asp:Label ID="lbl" runat="server"></asp:Label>
                         </td>
                    <td> &nbsp; </td>
                </tr>




                </table>

            </td>

        </tr>


    </table>




</asp:Content>

