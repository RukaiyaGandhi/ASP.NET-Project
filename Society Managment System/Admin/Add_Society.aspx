<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Add_Society.aspx.cs" Inherits="Add_Society" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type ="text/css">

        .style1 {
            width:466px;
        }
                    .img {
                width:166px;
                height:100px;
            }

    </style>
</asp:Content>

<asp:Content ID="Content2"  ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table class="tbll">

        <tr> <td class="tblHead"> Add New Society </td>  </tr>

         <tr>
            <td style="text-align: center">
                <table align="center" class="style1">
                    <tr>
                        <td> &nbsp;</td>
                        <td> &nbsp;</td>
                        <td> &nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>

                    <tr> <td>  Society Name : </td>

                         <td align="left">  <asp:TextBox ID="txtSocietyname" runat="server" CssClass="txt1" > </asp:TextBox> </td>

                        <td>

                            <asp:RequiredFieldValidator ID="RFVSName" runat="server" ErrorMessage="Enter Society" 
                                ForeColor="Red" ControlToValidate= "txtSocietyname" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>   
                     </tr>

                    <tr>

                        <td> No of Houses : </td>

                        <td align="left"> <asp:TextBox ID="txtNoHouse" runat="server" CssClass="txt1"> </asp:TextBox> </td>

                        <td>  
                    
                            <asp:RequiredFieldValidator ID="RVFHouseCount" runat="server" ErrorMessage="Enter Total House" 
                                ForeColor="Red" ControlToValidate= "txtNoHouse" Display="Dynamic" ></asp:RequiredFieldValidator>
                            <br/>
                                  <asp:RegularExpressionValidator ID="RFVHouseNumber" runat="server" ErrorMessage="Enter House no."
                                       ForeColor="Red" ControlToValidate= "txtNoHouse" ValidationExpression="[0-9]{2}" 
                                      Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator>
                        </td>

                    </tr>

                    <tr>

                        <td>  Address : </td>

                         <td align="left">  <asp:TextBox ID="txtAddress" runat="server" CssClass="txt1" TextMode="MultiLine"> </asp:TextBox> </td>

                        <td>
                             
                        <asp:RequiredFieldValidator ID="RFVAddress" runat="server" ErrorMessage="Enter Address"
                             ControlToValidate="txtAddress" BorderStyle="None" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>

                        </td>
                    </tr>


                     <tr> 

                         <td>  State : </td>

                         <td align="left">  

                             <asp:DropDownList ID="ddlState" runat="server" CssClass="txt1" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="ddlState_SelectedIndexChanged"></asp:DropDownList>

                         </td>

                        <td> 
                             
                            <asp:CompareValidator ID="CVState" runat="server" ErrorMessage="Select State" Display="Dynamic" ControlToValidate="ddlState" Operator="NotEqual" ValueToCompare="0" Type="Integer" ForeColor="Red"></asp:CompareValidator>

                         </td>
                         <td>
                             &nbsp;</td>
                    </tr>

                    <tr> 

                         <td>  City : </td>

                         <td align="left">

                             <asp:DropDownList ID="ddlCity" runat="server" CssClass="txt1" AppendDataBoundItems="True" AutoPostBack="True"></asp:DropDownList>

                         </td>

                        <td> 
                            <asp:CompareValidator ID="CVcity" runat="server" ErrorMessage="Select City" Display="Dynamic" ControlToValidate="ddlCity" Operator="NotEqual" ValueToCompare="0" Type="Integer" ForeColor="Red"></asp:CompareValidator>

                        </td>
                        
                    </tr>


                    <tr>

                        <td> Establish Date :</td>

                        <td align="left"> <asp:TextBox ID="txtCal" runat="server" CssClass="txt1" TextMode="Date"   ></asp:TextBox></td>
                        <td>

                             <asp:RequiredFieldValidator ID="RFVcal" runat="server" ErrorMessage="Insert Date" 
                                ForeColor="Red" ControlToValidate= "txtCal" Display="Dynamic"></asp:RequiredFieldValidator>

                        </td>

                        <td > </td>

                    </tr>

                    <tr>
                        <td>  Image : </td>

                        <td style="text-align:left">
                               <asp:FileUpload ID="Simageupload" runat="server" CssClass="txt1" BorderStyle="None"/> </td>

                        <td>  <asp:RequiredFieldValidator ID="RFVupload" runat="server" ErrorMessage="Insert Image" 
                                ForeColor="Red" ControlToValidate= "Simageupload" Display="Dynamic"></asp:RequiredFieldValidator></td> 
                    </tr>

                    <tr>

                        <td> &nbsp; </td>

                         <td style="text-align: left"> <asp:Button ID="addSocietyBtn" runat="server" Text="Add Society" CssClass="btn" Height="28px" OnClick="addSocietyBtn_Click"  /></td>

                         <td>  &nbsp; </td>
                    </tr>

                    <tr>

                         <td>  &nbsp; </td>

                                <td align="left"> 
                                    <asp:Label ID="lblpractice" runat="server" Text="" CssClass="lbl"></asp:Label>
                         </td>
                                <td align="left"> &nbsp;</td>
                         <td>   &nbsp; </td>

                    </tr>

                 
   </table>
                </td>
                    </tr>

                 <tr>
                    <td>
                        <table class="tbll" align="center">
                            <tr>
                                <td>
                                    <asp:GridView ID="Gvsociety" runat="server" AutoGenerateColumns="false" style="text-align:center" ForeColor="#497174">
                                        <Columns>
                                            <asp:BoundField DataField="Society_ID" HeaderText="Society ID">
                                            </asp:BoundField>
                                            <asp:BoundField DataField="SName" HeaderText="Society">
                                                </asp:BoundField>
                                            <asp:BoundField DataField="SAddress" HeaderText="Address">
                                                </asp:BoundField>
                                            <asp:BoundField DataField="State_ID" HeaderText="State ">
                                            </asp:BoundField>
                                          
                                            <asp:BoundField DataField="City_ID" HeaderText="City"/>
                                            <asp:BoundField DataField="No_Of_Houses" HeaderText="Total House"/>
                                            <asp:BoundField DataField="Establishment_date" HeaderText="Established Date"/>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Image ID="img1" runat="server"  ImageUrl='<%#"~/ImageHandlerSociety.ashx?id="+Eval("Society_ID")%>' CssClass="img"/>
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
