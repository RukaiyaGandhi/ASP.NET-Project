<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="rentList.aspx.cs" Inherits="rentList" %>

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

            <td class="tblHead"> Rent List

                
            </td>
           
            
        </tr>


        <tr align="center"> <td>

            <asp:Label ID="lblSname" runat="server"></asp:Label>
                <asp:DropDownList ID="ddlSociety" runat ="server" AppendDataBoundItems ="true"></asp:DropDownList>

             <asp:Button ID="btnrentlist" runat="server" Text="View" OnClick="btnrentlist_Click"> 
            </asp:Button>
            
             </td>

        </tr>

        <tr align="center">

    <td> <asp:Label ID="lbl" runat="server"></asp:Label> </td>

        </tr>

        <tr>

            <td>

                <table class="style1" align="center">

                    <tr>

                        <td> &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; </td>

                        
                        <td colspan="2">
                            <asp:GridView ID="GRVRENT" runat="server" AutoGenerateColumns="false" style="text-align:center" ForeColor="#497174" >
                                <Columns>
                                    <asp:BoundField  DataField="Rent_ID" HeaderText="Rent ID"/>
                                    <asp:BoundField  DataField="House_ID" HeaderText="House ID"/>
                                    <asp:BoundField DataField="Society_ID" HeaderText="Society ID"/>
                                    <asp:BoundField DataField="Owner_ID" HeaderText="Owner ID" />
                                    <asp:BoundField DataField="House_Rent" HeaderText="Rent Price" />
                                    
                                </Columns>
                            </asp:GridView>&nbsp;</td>
                        <td align="center" style="text-align:center"></td>
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

