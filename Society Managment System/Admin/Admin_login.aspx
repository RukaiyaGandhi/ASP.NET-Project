<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_login.aspx.cs" Inherits="Admin_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Admin_StyleSheet.css" rel="stylesheet" />

    <style type="text/css">
        .auto-style1 {
            width: 202px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
    <div id="head">

        <asp:Image ID="logo" runat="server" ImageUrl="~/Images/logoo.png" Height="123px" Width="259px" />
    
    </div>

        <div id="login">

            <table class="tbl">

                <tr>

                    <td class="tblHead" colspan="2" style="text-align:center"> Admin Login </td>

                </tr>

                 <tr> <td> &nbsp; </td>

                <td class="auto-style1"> <asp:Label ID="lblmsg" runat="server"> </asp:Label> </td>

                </tr>

                <tr>

                    <td class="lbl">  Username: </td>

                    <td class="auto-style1"> <asp:TextBox ID="txtUser" runat="server" CssClass ="txt" Height="25px"></asp:TextBox></td>
               </tr>

                <tr>

                      <td class="lbl">  Password: </td>

                    <td class="auto-style1"> <asp:TextBox ID="TxtPassword" runat="server" CssClass ="txt" Height="25px" TextMode="Password"></asp:TextBox></td>


                </tr>

                 <tr>
                <td class="style1"> </td>

                <td class="style1">  <asp:Button ID="loginBtn" runat="server" Text="Login" CssClass="btn" Width="129px" OnClick="loginBtn_Click" Height="27px" /></td>
                 </tr>

                <tr>

                    <td> &nbsp;</td>

                    <td>  &nbsp;</td>


                </tr>




            </table>


        </div>

    </form>
</body>

</html>
