<%@ Page Title="" Language="C#" MasterPageFile="~/MemberMaster.master" AutoEventWireup="true" CodeFile="changePassword.aspx.cs" Inherits="changePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
    .style1
    {
        
    }
    .style2
    {
        }
    .style3
    {
        text-align: right;
        color: #333;
        
    }
        .auto-style1 {
            width: 202px;
        }
        .auto-style2 {
            text-align: right;
            color: #333;
            height: 26px;
            width: 223px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table class="tbl">

        <tr>

            <td class="tblHead"> Change Password </td>

        </tr>

         <tr> <td> &nbsp;</td> </tr>

        <tr>

            <td>

                <table align="center" style="border:thin solid #EB6440">

                    <tr>

                        <td class="tblHead" colspan="2"> Change Password </td>

                    </tr>


                     <tr>

                    <td class="auto-style2"> &nbsp;</td>

                    <td class="auto-style1"> &nbsp;</td>

                    </tr>

                    <tr>

                    <td class="auto-style2"> Enter Current Password&nbsp; : </td>

                    <td class="auto-style1">

                        <asp:TextBox ID="txtCurrentPass" runat="server" CssClass="txt" Width="180px"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RFVCurent" runat="server" 
                            ControlToValidate="txtCurrentPass" ErrorMessage="!!" ForeColor="Red" 
                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>

                    </tr>


                    <tr>

                    <td class="auto-style2"> Enter New Password&nbsp; : </td>

                    <td class="auto-style1">

                        <asp:TextBox ID="txtNewPass" runat="server" CssClass="txt" Width="180px"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RFVNew" runat="server" 
                            ControlToValidate="txtNewPass" ErrorMessage="!!" ForeColor="Red" 
                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>

                    </tr>

                    <tr>
                        
                         <td class="auto-style2"> Confirm Password : </td>

                        <td>

                             <asp:TextBox ID="txtConfirm" runat="server" CssClass="txt" Width="180px"></asp:TextBox>

                            <asp:RequiredFieldValidator ID="RFVConfirm" runat="server" ControlToValidate="txtConfirm" ErrorMessage="!!" ForeColor="Red" 
                             SetFocusOnError="True"></asp:RequiredFieldValidator>

                            <asp:CompareValidator ID="CompareConfirm" runat="server" 
                            ControlToCompare="txtnewpass" ControlToValidate="txtConfirm" 
                            ErrorMessage="password not same" ForeColor="Red"></asp:CompareValidator>

                        </td>

                    </tr>

                    <tr>

                        <td class="style3"> &nbsp; </td>

                        <td>
                            <asp:Button ID="btnChangePass" runat="server" Text="Change Password" CssClass="btn" OnClick="btnChangePass_Click" /></td>

                    </tr>

                    <tr>

                        <td class="style3"> &nbsp; </td>

                        <td> <asp:Label ID="lblPass" runat="server" Font-Size="11pt"></asp:Label></td>

                    </tr>

                </table>

            </td>

        </tr>

    </table>

</asp:Content>

