<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="committeeMember.aspx.cs" Inherits="Admin_committeeMember" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">

        .style1
        {
            width: 338px;
        }
        .style2
        {
            width: 347px;
        }
                    .img {
                width:166px;
                height:100px;
            }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table class="tbll">

        <tr> 
            
            <td class="tblHead"> Add Committee Members </td>

        </tr>

         <tr> <td style="text-align:center"> 

             <table align="center" class="style1">

                 <tr>
                        <td> &nbsp; </td>

                        <td> &nbsp;</td>

                        <td> &nbsp;</td>

                 </tr>
                 <tr>
                        <td class="lbl"> Society ID:</td>

                        <td> <asp:DropDownList ID="ddlSociety" runat="server" CssClass="txt1" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="ddlSociety_SelectedIndexChanged"> </asp:DropDownList> </td> 

                        <td>  <asp:CompareValidator ID="CVsociety" runat="server" ErrorMessage="Select ID" Display="Dynamic" ControlToValidate="ddlHouse" Operator="NotEqual" ValueToCompare="0" Type="Integer" ForeColor="Red"></asp:CompareValidator> </td> 
                 </tr>

                  <tr>
                        <td class="lbl"> House ID:</td>

                        <td> <asp:DropDownList ID="ddlHouse" runat="server" CssClass="txt1" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="ddlHouse_SelectedIndexChanged"> </asp:DropDownList> </td> 

                         <td>  <asp:CompareValidator ID="CVhouse" runat="server" ErrorMessage="Select ID" Display="Dynamic" ControlToValidate="ddlHouse" Operator="NotEqual" ValueToCompare="0" Type="Integer" ForeColor="Red"></asp:CompareValidator> </td>
                 </tr>

        
                 <tr>

                     <td class="lbl"> First Name : </td>

                     <td> <asp:TextBox ID="txtFname" runat="server" CssClass="txt1"></asp:TextBox> </td>

                      <td>
                          <asp:RequiredFieldValidator ID="RFVFname" runat="server" 
                                ControlToValidate="txtFname" ErrorMessage="Enter Name" ForeColor="Red" 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                      </td>

                 </tr>

                 <tr>

                     <td class="lbl">  Last Name: </td>

                      <td> <asp:TextBox ID="txtLname" runat="server" CssClass="txt1"></asp:TextBox> </td>

                      <td>
                           <asp:RequiredFieldValidator ID="RFVLname" runat="server" 
                                ControlToValidate="txtLname" ErrorMessage="Enter Name" ForeColor="Red"></asp:RequiredFieldValidator>
                       </td>   

                 </tr>
                

                  <tr>

                     <td class="lbl">  Age: </td>

                      <td> <asp:TextBox ID="txtAge" runat="server" CssClass="txt1"></asp:TextBox> </td>

                      <td>
                           <asp:CompareValidator ID="CVage" runat="server" ErrorMessage="!!" Operator="DataTypeCheck" Type="Integer" ControlToValidate="txtAge" ForeColor="Red"></asp:CompareValidator>

                            <asp:RequiredFieldValidator ID="RFVage" runat="server" 
                                ControlToValidate="txtAge" ErrorMessage="Enter Age" ForeColor="Red"></asp:RequiredFieldValidator>
                       </td>   

                 </tr>


                 <tr>

                     <td class="lbl">Address:</td>

                      <td> <asp:TextBox ID="txtAddress" runat="server" CssClass="txt1"></asp:TextBox> </td>

                      <td>
                            <asp:RequiredFieldValidator ID="RFVaddress" runat="server" 
                                ControlToValidate="txtAddress" ErrorMessage="Enter Address" ForeColor="Red" 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                       </td>   

                 </tr>


                  <tr>

                     <td class="lbl">  Contact No. : </td>

                      <td> <asp:TextBox ID="txtContact" runat="server" CssClass="txt1"></asp:TextBox> </td>

                      <td>
                             <asp:RegularExpressionValidator ID="REVcontact" runat="server" ErrorMessage="!!" ForeColor="Red" ControlToValidate="txtContact" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>

                            <asp:RequiredFieldValidator ID="RFVcontact" runat="server" 
                                ControlToValidate="txtContact" ErrorMessage="Enter Contact" ForeColor="Red"></asp:RequiredFieldValidator>
      
                       </td>   

                 </tr>

                  <tr>

                     <td class="lbl">  Gender : </td>

                      <td>
                           <asp:DropDownList ID="ddlGender" runat="server" CssClass="txt1" AppendDataBoundItems="true" AutoPostBack="true">
                          <asp:ListItem Value="0">---Select Gender---</asp:ListItem>
                          <asp:ListItem Value="1">Male</asp:ListItem>
                          <asp:ListItem Value="2">Female</asp:ListItem>
                          <asp:ListItem Value="3">Others</asp:ListItem>
                          </asp:DropDownList>

                      </td>

                      <td> <asp:CompareValidator ID="CVgender" runat="server" ErrorMessage="Select Gender" Display="Dynamic" ControlToValidate="ddlGender" Operator="NotEqual" ValueToCompare="0" Type="Integer" ForeColor="Red"></asp:CompareValidator> </td>

                 </tr>

                 <tr>

                     <td class="lbl">  Designation: </td>

                      <td> <asp:DropDownList ID="ddlDesignation" runat="server" CssClass="txt1" AppendDataBoundItems="true" AutoPostBack="true"></asp:DropDownList> </td>

                      <td>
                             <asp:CompareValidator ID="CVdesign" runat="server" ErrorMessage="Select Designation" Display="Dynamic" ControlToValidate="ddlDesignation" Operator="NotEqual" ValueToCompare="0" Type="Integer" ForeColor="Red"></asp:CompareValidator> '

                      </td>   

                 </tr>


                 <tr>

                      <td> &nbsp;</td>

                 </tr>

                 <tr>
                        <td> &nbsp;</td>

                        <td style="text-align: left"> <asp:Button ID="btnAdd" runat="server" CssClass="btn" Text="ADD MEMBER" OnClick="btnAdd_Click"/> </td>

                        <td> &nbsp;</td>

                </tr>


             </table>

              </td> 

         </tr>

        <tr>

            <td>

                <table class="tbll">

                <tr>
                        <td class="style2"> &nbsp;</td>

                        <td> <asp:Label ID="lblMsg" runat="server"></asp:Label> </td>

                </tr>

                </table>

            </td>

        </tr>
             <table class="tbll" align="center">
                <tr>
                    
                    <td class="style2">
                       
                        <asp:GridView ID="GrvCommitee" runat="server" AutoGenerateColumns="False" style="text-align:center" ForeColor="#497174">
                            <Columns>
                                <asp:BoundField DataField="Commitee_ID" HeaderText="Commitee ID"  />
                                <asp:BoundField DataField="FName" HeaderText="Name"  />
                                <asp:BoundField DataField="LName" HeaderText="Surname"  />
                                <asp:BoundField DataField="Age" HeaderText="Age"  />
                                <asp:BoundField DataField="Address" HeaderText="Address" />
                                <asp:BoundField DataField="Contact_No" HeaderText="Contact"  />
                                <asp:BoundField DataField="Gender" HeaderText="Gender"  />
                                <asp:BoundField DataField="House_ID" HeaderText="House ID"  />
                                <asp:BoundField DataField="Designation1_ID" HeaderText="Designation ID" />
                            </Columns>
                        </asp:GridView>
                 
                        
                 
                    </td>
                </tr>
                
            </table>
        </tr>

    </table>



</asp:Content>

