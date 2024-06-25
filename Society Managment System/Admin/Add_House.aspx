<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Add_House.aspx.cs" Inherits="_Default" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <style type ="text/css">

        .style1 {
            width : 571px;
        }

        .style2
        {
            width: 163px;
        }
    .style3
    {
    }
    .style4
    {
        width: 152px;
    }
    .style5
    {
        text-align: right;
        color: #333;
        width: 152px;
    }
    .style6
    {
        width: 166px;
    }
            .img {
                width:166px;
                height:100px;
            }
     


    </style>

</asp:Content>

<asp:Content ID="Content2"  ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table class="tbll" align="right">


          <tr>
            <td style ="text-align:center"> <asp:Label ID="lbl" runat="server" ></asp:Label>
            </td>
            </tr>

        <tr>
            <td class ="tblHead"> Add New House</td>
   </tr>

        <tr>

            <td style="text-align:center">

                <table align="center" class="style1">

                    <tr>

                        <td class="style4"> &nbsp;</td>

                        <td class="style6"> &nbsp;</td>

                        <td> &nbsp;</td>

                    </tr>

            <tr>

                <td class="style5"> Society:</td>

                   <td class="style6">

                        <asp:DropDownList ID="ddlSociety" runat="server" CssClass="txt1" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="ddlSociety_SelectedIndexChanged"></asp:DropDownList>


                    </td>
                    <td>

                        <asp:CompareValidator ID="CVSociety" runat="server" ErrorMessage="Select Society" Display="Dynamic" ControlToValidate="ddlSociety" Operator="NotEqual" ValueToCompare="0" Type="Integer" ForeColor="Red"></asp:CompareValidator>

                        

                    </td>


            </tr>
                     <tr>

                        <td class ="style5"> &nbsp; </td>

                         <td class ="style6"> &nbsp; </td>

                        <td align="left"> &nbsp; </td>

                    </tr>

                     <tr>

                        <td class="style5">  &nbsp; </td>


                         <td align="left" class="style6"><asp:Label ID="Total" runat="server" Text=""> </asp:Label></td>
                        <td align="left" class="style6" colspan="2"> <asp:Label ID="lblAllocate" runat="server" Text=""></asp:Label></td>

                        <td align="left"> &nbsp; </td>

                    </tr>

                      <tr>

                          <td class="style5">  &nbsp; </td>

                        <td align="left" class="style6"> <asp:Label ID="lblRem" runat="server" Text=""></asp:Label></td>

                          <td align="left"> &nbsp; </td>

                    </tr>

                      <tr>

                    

                        <td> &nbsp; </td>

                         <td> &nbsp; </td>

                        <td align="left"> &nbsp; </td>

                  </tr>

                    <tr>

                        <td class="style5"> House No. : </td>

                        <td class="style6"> <asp:TextBox ID="texthouseNum" runat="server" CssClass="txt1"></asp:TextBox> </td>

                        <td align="left" class="style6">

                         <asp:RequiredFieldValidator ID="RVFHouseCount" runat="server" ErrorMessage="Enter Total House" 
                                ForeColor="Red" ControlToValidate= "texthouseNum" Display="Dynamic" ></asp:RequiredFieldValidator>
                            <br/>
                                  <asp:RegularExpressionValidator ID="RFVHouseNumber" runat="server" ErrorMessage="Enter House no."
                                       ForeColor="Red" ControlToValidate= "texthouseNum" ValidationExpression="[0-9]{2}" 
                                      Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator>

                        </td>
                    </tr>

                     <tr>

                        <td class="style5"> House Type: </td>

                         <td class="style6">
                             <asp:DropDownList ID="ddlHouseType" runat="server" CssClass="txt1" AppendDataBoundItems="true" AutoPostBack="true"> 
                                 
                             </asp:DropDownList>
                            
                        </td>

                         <td>
                             
                             <asp:CompareValidator ID="CVSHouseType" runat="server" ErrorMessage="Select House Type" Display="Dynamic" ControlToValidate="ddlHouseType" Operator="NotEqual" ValueToCompare="0" Type="Integer" ForeColor="Red"></asp:CompareValidator>

                         </td>

                     </tr>
                         <tr>

                        <td class="style5"> House Status : </td>

                         <td class="style6">
                             <asp:DropDownList ID="ddlhouseStatus" runat="server" CssClass="txt1" AppendDataBoundItems="true" AutoPostBack="true">
                                 
                             </asp:DropDownList>

                        </td>

                         <td><asp:CompareValidator ID="CVhouseStatus" runat="server" ErrorMessage="Select House Status" Display="Dynamic" ControlToValidate="ddlhouseStatus" Operator="NotEqual" ValueToCompare="0" Type="Integer" ForeColor="Red"></asp:CompareValidator></td>

                    </tr>
                    <tr>                    
                        <td class="style5"> House Price: </td>

                        <td class="style6"> <asp:TextBox ID="txthouseprice" runat="server" CssClass="txt1"></asp:TextBox></td>

                        <td align="left"> 
                            
                             <asp:RequiredFieldValidator ID="RFVHousePrice" runat="server" ErrorMessage="Enter Price" 
                                ForeColor="Red" ControlToValidate= "txthouseprice" Display="Dynamic"></asp:RequiredFieldValidator>

                            <asp:RegularExpressionValidator ID="REVprice" runat="server" ErrorMessage="!!" ValidationExpression="^\d{0,8}(\.\d{1,4})?$" ControlToValidate="txthouseprice"
                                Display="Dynamic" ForeColor="Red" SetFocusOnError="true"> </asp:RegularExpressionValidator>
                        </td>


                    </tr>

                    <tr>

                        <td class="style5"> Other Detail: </td>

                        <td class="style6"> <asp:TextBox ID="txtOtherDetail" runat="server" CssClass="txt1"></asp:TextBox></td>

                        <td align="left">
                            
                            <asp:RequiredFieldValidator ID="RFVotherDetails" runat="server" ErrorMessage="Enter Details" 
                                ForeColor="Red" ControlToValidate= "txtOtherDetail" Display="Dynamic"></asp:RequiredFieldValidator></td>


                    </tr>
                    <tr>

                        <td class="style5"> Image: </td>

                        <td style="text-align:left"> <asp:FileUpload ID="Fudhimage" runat="server" Width="181px" CssClass="txt1" BorderStyle="None" /> </td>

                        <td align="left"> 
                            
                            <asp:RequiredFieldValidator ID="RFVupload" runat="server" ErrorMessage="Insert Image" 
                                ForeColor="Red" ControlToValidate= "Fudhimage" Display="Dynamic"></asp:RequiredFieldValidator> </td>


                    </tr>

                    <tr>

                        <td class="style5"> &nbsp; </td>

                        <td class="style6"> &nbsp; </td>

                        <td align="left"> &nbsp;</td>


                    </tr>

                    <tr>

                        <td class="style4"> &nbsp; </td>

                        <td style="text-align:left" class="style6"> <asp:Button ID="addHouseBtn" runat="server" Text="Add House" CssClass="btn" OnClick="addHouseBtn_Click" Height="30px" /></td>

                    </tr>

                     <tr>
                        <td class="style4"> &nbsp; </td>

                        <td align="left" class="style3" colspan="2">
                            <asp:Label ID="lblmsg" runat="server"></asp:Label>
                        </td>
                    </tr>


                </table>
                    
            </td>

        </tr>
        <tr>
            <td>
                <table align="center">
                        <tr>
                            <td>
                                <asp:GridView ID="GrvHouseDetails" runat="server" AutoGenerateColumns="False" style="text-align:center" ForeColor="#497174">
                                    <Columns>
                                        <asp:BoundField DataField="Society_ID" HeaderText="Society ID"/>
                                        <asp:BoundField DataField="House_No" HeaderText="House No" />
                                        <asp:BoundField DataField="HouseType_ID" HeaderText="HouseType ID"/>
                                        <asp:BoundField DataField="Status_ID" HeaderText="Status ID"/>
                                        <asp:BoundField DataField="House_Price" HeaderText="Price"/>
                                        <asp:BoundField DataField="Other_Facility" HeaderText="Other Facility"/>
                                        <asp:TemplateField>
                                             <ItemTemplate>
                                                <asp:Image ID="image1" runat="server" ImageUrl='<%#"~/HouseImageHandler.ashx?id="+Eval("House_ID")%>' CssClass="img" />
                                             </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                             
                            </td>
                        </tr>

                </table>

            </td>
        </tr>

    </table>


</asp:Content>

