<%@ Page Title="" Language="C#" MasterPageFile="~/MemberMaster.master" AutoEventWireup="true" CodeFile="mMyRent.aspx.cs" EnableSessionState="True" Inherits="mMyRent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">


    .style1
    {
        width: 827px;
        height: 68px;
    }
    .style2
    {
        width: 23px;
    }
    .style3
    {
        width: 213px;
    }
    .style4
    {
        width: 15px;
    }
    .style5
    {
        width: 551px;
    }
    .style9
    {
        width: 168px;
    }
    </style>




</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table class="tbl"> 

        <tr>

            <td class="tblHead"> My Rent </td>

        </tr>

        <tr>

            <td>  &nbsp; </td>

        </tr>

        <tr>

            <td>

                <table class="style1">

                    <tr>

                        <td class="style2" style="text-align:center">  &nbsp; </td>

                        <td class="style3" style="text-align: center"> &nbsp;</td>

                        <td class="style4"> &nbsp; </td>

                        <td> &nbsp; </td>

                    </tr>

                    <tr>

                        <td class="style2"> &nbsp; </td>

                        <td class="style3" valign="top">

                            &nbsp;</td>

                         <td class="style4"> &nbsp; </td>

                        <td valign="top">

                            <table class="style5">

                                <tr>

                                    <td class="lbl" style="color: #EB6440; font-size:16px; font-weight:bold;"> Society Name : </td>

                                    <td> <asp:Label ID="lblSname" runat="server" Font-Bold="True" Font-Size="16px" ForeColor="#EB6440"></asp:Label> </td>

                                </tr>

                                <tr>

                                    <td class="lbl"> Block No : </td>

                                    <td> <asp:Label ID="lblBlockNo" runat="server"></asp:Label> </td>

                                </tr>

                                <tr>

                                    <td class="lbl"> Type : </td>

                                    <td> <asp:Label ID="lblType" runat="server"></asp:Label> </td>

                                </tr>

                                 <tr>

                                    <td class="lbl"> &nbsp; </td>

                                    <td> &nbsp; </td>
                                </tr>

                                 <tr>

                                    <td class="lbl"> Rent Price : </td>

                                    <td> <asp:Label ID="lblRent" runat="server"></asp:Label> </td>

                                </tr>

                                <tr>

                                     <td class="style9"> &nbsp; </td>

                                    <td> &nbsp;</td>

                                </tr>

                                <tr>

                                    <td class="style9"> &nbsp; </td>

                                    <td> &nbsp; </td>

                                </tr>

                                <tr>

                                    <td class="style6" colspan="2">
                                           <asp:GridView ID="Gridview1" runat="server" AutoGenerateColumns="false" style="text-align:center" ForeColor="#497174">
                                <Columns>
                                    <asp:BoundField  DataField="Rent_ID" HeaderText="Rent ID"/>
                                    <asp:BoundField  DataField="House_ID" HeaderText="House ID"/>
                                    <asp:BoundField DataField="Society_ID" HeaderText="Society ID"/>
                                    <asp:BoundField DataField="Owner_ID" HeaderText="Owner ID" />
                                    <asp:BoundField DataField="House_Rent" HeaderText="Rent Price" />
                                 
                                </Columns>
                            </asp:GridView>
                        
                                        &nbsp;</td>

                                </tr>

                                <tr>

                                    <td class="style9" colspan="2">  
                                        &nbsp;
                                        <asp:Label ID="lbl" runat="server"></asp:Label>
                                    </td>

                                    <td> &nbsp; </td>

                                </tr>

                            </table>


                        </td>

                    </tr>

                    <tr>

                        <td class="style2"> &nbsp; </td>

                        <td class="style3"> &nbsp; </td>

                        <td class="style4"> &nbsp; </td>

                        <td> &nbsp; </td>

                    </tr>

                </table>

            </td>


        </tr>

    </table>


</asp:Content>

