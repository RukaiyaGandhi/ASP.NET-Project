<%@ Page Title="" Language="C#" MasterPageFile="~/MemberMaster.master" AutoEventWireup="true" CodeFile="MAccount.aspx.cs" EnableSessionState="True" Inherits="MAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
        .style1
        {
            width: 682px;
        }
        .style2
        {
            width: 189px;
        }
        .style3
        {
            width: 414px;
        }
        .style4
        {
            text-align: right;
            color: #333;
            width: 178px;
        }
        .auto-style1 {
            width: 149px;
            height: 25px;
        }
    </style>


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table class="tbl">

        <tr> <td class="tblHead"> My Account </td> </tr>

        <tr> <td>  &nbsp; </td> </tr>
        <tr>

            <td>

                <table class="style1">

                    <tr>

                        <td class="auto-style1"> &nbsp </td>
                         
                        <td>

                                 <table align="center" class="tbll">

                                <tr>

                                    <td class="tblHead" colspan="2" style="text-align:center"> Account Detail </td>

                                </tr>


                                <tr>

                                    <td class="lbl"> &nbsp; </td>

                                     <td> &nbsp; </td>

                                </tr>


                                <tr>
                                     <td class="lbl">First Name:</td>

                                      <td> <asp:Label ID="lblfname" runat="server" Text=""></asp:Label> </td>
                                </tr>

                                <tr>


                                    <td class="lbl">Last Name:</td>

                                      <td> <asp:Label ID="lblLName" runat="server" Text=""></asp:Label> </td>

                                 </tr>


                                  <tr>


                                    <td class="lbl">Email:</td>

                                      <td> <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label> </td>

                                 </tr>



                                  <tr>


                                    <td class="lbl">Contact no.:</td>
                                       
                                    <td> <asp:Label ID="lblContact" runat="server" Text=""></asp:Label> </td>

                                 </tr>


                                 <tr>


                                    <td class="lbl">Society Name:</td>
                                       
                                    <td> <asp:Label ID="lblSName" runat="server" Text=""></asp:Label> </td>

                                 </tr>

                                    
                                 <tr>


                                    <td class="lbl">Member :</td>
                                       
                                    <td> <asp:Label ID="lblMember" runat="server" Text=""></asp:Label> </td>

                                 </tr>



                                 <tr>

                                 <td class="style4"> &nbsp;</td>

                                 <td> &nbsp;</td>

                                 </tr>


                                <tr>

                                    <td class="style4"> &nbsp </td>

                                    <td> &nbsp;</td>

                                </tr>


                            </table>

                            
                        </td>
                    </tr>

                </table>

            </td>

        </tr>


    </table>


</asp:Content>

