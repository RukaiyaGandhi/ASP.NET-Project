<%@ Page Title="" Language="C#" MasterPageFile="~/MemberMaster.master" EnableSessionState="True" AutoEventWireup="true" CodeFile="MHome.aspx.cs" Inherits="MHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

     <style type="text/css">
         .style1
    {
        width: 706px;
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
    .style6
    {
        width: 153px;
    }
    .style7
    {
        text-align: right;
        color: #333;
        width: 153px;
    }
    .style8
    {
        width: 729px;
    }
</style>


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   

    <table class="tbl" align="center">

        <tr>

            <td class="tblHead">

                Welcome to DreamScape

            </td>

        </tr>

        <tr>

            <td>

                <table class="style1">

                    <tr>

                        <td class="style2" style="text-align:center"> &nbsp; </td>

                        <td class="style4"> &nbsp; </td>

                         <td> &nbsp; </td>
                    </tr>

                    <tr align="center">


                        <td valign="top" align="center">

                            <table class="style5" align="center">
                                
                                <tr>

                                   <td> &nbsp;</td>

                                    <td class="style7" style="color:#EB6440; font-size:16px; font-weight:bold;"> Society Name: </td> 

                                    <td> <asp:Label ID="lblSocietyName" runat="server" Font-Size="16px" ForeColor="#EB6440" Font-Bold="true" ></asp:Label> </td> 

                                </tr>

                                <tr>

                                    <td> &nbsp; </td>

                                    <td class="style7"> <b> Block No: </b> </td>

                                    <td> <asp:Label ID="lblBlockNo" runat="server" style="font-weight:bold"></asp:Label> </td>

                                </tr>

                                <tr>

                                    <td> &nbsp; </td>

                                    <td class="style7"> <b>Type: </b></td>

                                    <td> <asp:Label ID="lblType" runat="server" style="font-weight:bold"></asp:Label></td>

                                </tr>

                                 <tr>

                                    <td class="style6"> &nbsp;  </td>

                                    <td> &nbsp; </td>

                                </tr>

                                 <tr>

                                    <td class="style6"> &nbsp;</td>

                                    <td> &nbsp; </td>

                                </tr>

                                <tr>

                                     <td class="style6"> &nbsp; </td>

                                    <td> <asp:Label ID="lblSell" runat="server" ForeColor="#497174"></asp:Label> </td>

                               </tr>

                                <tr>
                                    <td>  &nbsp; </td>

                                    <td class="style6"> <asp:Button ID="btnRent" runat="server" Text="Rent Now" CssClass="btn" Width="150px" Height="30px" OnClick="btnRent_Click" /> </td>

                                    <td> <asp:Button ID="btnSell" runat="server" Text="Sell Now" CssClass="btn" Width="150px" Height="30px" OnClick="btnSell_Click" /> </td>

                                </tr>

                                <tr>

                                    <td> &nbsp; </td>

                                    <td class="style6">   
                                        
                                    <asp:TextBox ID="txtRent" runat="server" CssClass="txt" MaxLength="10" Visible="false" Width="90px"> </asp:TextBox>  

                                   <%-- <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtRent" ErrorMessage="!!" ForeColor="Red" MaximumValue="9999999999" MinimumValue="0" SetFocusOnError="true" Type="Double"></asp:RangeValidator>--%>

                                    </td>


                                    <td>   
                                        
                                    <asp:TextBox ID="txtSell" runat="server" CssClass="txt" Columns="10" Visible="false" Width="90px"> </asp:TextBox>  

                                   <%-- <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtSell" ErrorMessage="!!" ForeColor="Red" MaximumValue="9999999999" MinimumValue="0" SetFocusOnError="true" Type="Double"></asp:RangeValidator>--%>

                                    </td>

                                </tr>

                                <tr>

                                    <td> &nbsp; </td>

                                    <td class="style6"> <asp:Button ID="btnRentNow" runat="server" Text="RENT" CssClass="btn" Visible="false" Width="90px" Height="30px" OnClick="btnRentNow_Click" />  </td>

                                        <td> <asp:Button ID="btnSellNow" runat="server" Text="SELL" CssClass="btn" Visible="false" Width="90px" Height="30px" OnClick="btnSellNow_Click" />  </td>

                                </tr>

                        </table>
                                </td> </tr>



 
            </table>
                    </td> </tr>

        <tr>

            <td style="border-top-style: solid; border-top-width: thin; border-top-color: #EB6440">

                &nbsp;</td>

        </tr>




    </table>



    </asp:Content>





