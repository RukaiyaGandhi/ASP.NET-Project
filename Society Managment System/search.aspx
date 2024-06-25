<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="search.aspx.cs" Inherits="search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
    .style1
    {
        width: 603px;
    }
    .style2
    {
        text-align: right;
        color: #333;
        width: 140px;
    }
    .style3
    {
    }
    .style4
    {
        width: 656px;
    }
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table class="tbl">

        <tr>

            <td class="tblHead"> Search Page </td>

        </tr>

        <tr>

            <td> &nbsp; </td>

        </tr>

        <tr>

            <td>

                <table align="center" class="style1">

                    <tr>

                        <td class="style2">  Select Society : </td>

                        <td>  <asp:DropDownList ID="ddlSociety" runat="server" CssClass="txt" AutoPostBack="true" AppendDataBoundItems="true"></asp:DropDownList></td>

                        <td> &nbsp; </td>

                        <td class="lbl"> Select Type : </td>

                        <td>

                            <asp:DropDownList ID="drpSelectType" runat="server" CssClass="txt">
                                <asp:ListItem Value="0">SELECT</asp:ListItem>
                                <asp:ListItem Value="1">Rent</asp:ListItem>
                                <asp:ListItem Value="2">Sell</asp:ListItem>

                            </asp:DropDownList>

                        </td>

                    </tr>

                    <tr>

                        <td class="style3"> &nbsp; </td>

                        <td> &nbsp; </td>

                        <td> &nbsp;</td>

                        <td> &nbsp;</td>

                        <td> <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn" Width="110px" OnClick="btnSearch_Click" Height="30px" /> </td>
  

                    </tr>

                    <tr>

                        <td align="center" class="style3" colspan="4">  <asp:Label ID="lblSearch" runat="server"></asp:Label> </td>

                        <td>  &nbsp; </td>

                    </tr>


                </table>

            </td>

        </tr>

        <tr>


            <td style="border-top-style: solid; border-top-width: thin; border-top-color: #EB6440">  &nbsp;</td>

        </tr>

        <tr>

            <td>

                <table align="center" class="style4">

                    <tr>

                        <td>

                              <asp:GridView ID="GrvRentDetails" runat="server" AutoGenerateColumns="False" style="text-align:center" Visible="false" CssClass="style2" ForeColor="#497174">
                              <Columns>
                                          <asp:BoundField  DataField="Rent_ID" HeaderText="Rent ID"/>
                                    <asp:BoundField  DataField="House_ID" HeaderText="House ID"/>
                                    <asp:BoundField DataField="Society_ID" HeaderText="Society ID"/>
                                    <asp:BoundField DataField="Owner_ID" HeaderText="Owner ID" />
                                    <asp:BoundField DataField="House_Rent" HeaderText="Rent Price" />
                                  
                                      
                                    </Columns>
                                </asp:GridView>
                            <asp:Label runat="server" ID="lbl" Visible="false"></asp:Label>
                        </td>
                    </tr>

                    <tr> 
                        
                            <asp:GridView ID="GRVSellDetails" runat="server" AutoGenerateColumns="false" style="text-align:center" Visible="false" ForeColor="#497174">
                                <Columns>
                                    <asp:BoundField  DataField="Sell_ID" HeaderText="Sell ID"/>
                                    <asp:BoundField  DataField="House_ID" HeaderText="House ID"/>
                                    <asp:BoundField DataField="Society_ID" HeaderText="Society No."/>
                                    <asp:BoundField DataField="Owner_ID" HeaderText="Owner ID" />
                                    <asp:BoundField DataField="Sell_Price" HeaderText="Sell Price" />
                                </Columns>
                            </asp:GridView>

                        <td> &nbsp; </td>

                    </tr>

                </table>

            </td>

        </tr>


         <tr> <td> &nbsp;</td> </tr>

    </table>


</asp:Content>

