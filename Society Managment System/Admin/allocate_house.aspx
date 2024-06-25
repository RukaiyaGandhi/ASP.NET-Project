<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="allocate_house.aspx.cs" Inherits="Admin_allocate_house" %>

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
            
            <td class="tblHead"> Allocate House To Member </td>

        </tr>

         <tr> <td style="text-align:center"> 

             <table align="center" class="style1">

                 <tr>
                        <td> &nbsp; </td>

                        <td> &nbsp;</td>

                        <td> &nbsp;</td>

                 </tr>

                 <tr>

                     <td> &nbsp; </td>

                     <td class="lbl"> Name: </td>

                     <td> <asp:TextBox ID="txtFname" runat="server" CssClass="txt1"></asp:TextBox> </td>

                      <td>
                           <asp:RequiredFieldValidator ID="RFVFname" runat="server" 
                                ControlToValidate="txtFname" ErrorMessage="Enter Name" ForeColor="Red" 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                      </td>

                 </tr>

                 <tr>

                     <td> &nbsp; </td>

                     <td class="lbl"> Surame: </td>

                      <td> <asp:TextBox ID="txtLname" runat="server" CssClass="txt1"></asp:TextBox> </td>

                      <td>
                            <asp:RequiredFieldValidator ID="RFVLname" runat="server" 
                                ControlToValidate="txtLname" ErrorMessage="Enter Name" ForeColor="Red"></asp:RequiredFieldValidator>
                       </td>   

                 </tr>
                <tr>

                    <td> &nbsp; </td>

                     <td class="lbl"> Age: </td>

                      <td> <asp:TextBox ID="txtage" runat="server" CssClass="txt1"></asp:TextBox> </td>

                      <td>

                          <asp:CompareValidator ID="CVage" runat="server" ErrorMessage="!!" Operator="DataTypeCheck" Type="Integer" ControlToValidate="txtage" ForeColor="Red"></asp:CompareValidator>

                            <asp:RequiredFieldValidator ID="RFVage" runat="server" 
                                ControlToValidate="txtage" ErrorMessage="Enter Age" ForeColor="Red"></asp:RequiredFieldValidator>
                       </td>   

                 </tr>
                 <tr>

                     <td> &nbsp; </td>

                     <td class="lbl">Family Member:</td>

                      <td> <asp:TextBox ID="txtmembercount" runat="server" CssClass="txt1"></asp:TextBox> </td>

                      <td>

                          <asp:CompareValidator ID="CVmemberCount" runat="server" ErrorMessage="!!" Operator="DataTypeCheck" Type="Integer" ControlToValidate="txtmembercount" ForeColor="Red"></asp:CompareValidator>

                            <asp:RequiredFieldValidator ID="RFVmemberNo" runat="server" 
                                ControlToValidate="txtmembercount" ErrorMessage="Enter Members" ForeColor="Red"></asp:RequiredFieldValidator>
                       </td>   

                 </tr>
                
                

                  <tr>

                      <td> &nbsp; </td>

                     <td class="lbl">  Email: </td>

                      <td> <asp:TextBox ID="txtemail" runat="server" CssClass="txt1"></asp:TextBox> </td>

                      <td>

                           <asp:RegularExpressionValidator ID="REVemail" runat="server" ErrorMessage="!!" ControlToValidate="txtemail" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"></asp:RegularExpressionValidator>

                            <asp:RequiredFieldValidator ID="RFVemail" runat="server" 
                                ControlToValidate="txtemail" ErrorMessage="Enter Email" ForeColor="Red"></asp:RequiredFieldValidator>
                       </td>   

                 </tr>

                  <tr>

                      <td> &nbsp; </td>

                     <td class="lbl">  Contact: </td>

                      <td> <asp:TextBox ID="txtContact" runat="server" CssClass="txt1"></asp:TextBox> </td>

                      <td>

                          <asp:RegularExpressionValidator ID="REVcontact" runat="server" ErrorMessage="!!" ForeColor="Red" ControlToValidate="txtContact" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>

                            <asp:RequiredFieldValidator ID="RFVcontact" runat="server" 
                                ControlToValidate="txtContact" ErrorMessage="Enter Contact" ForeColor="Red"></asp:RequiredFieldValidator>
                       </td>   

                 </tr>

                  <tr>

                      <td> &nbsp; </td>

                     <td class="lbl">  Society: </td>

                      <td> <asp:DropDownList ID="ddlSociety" runat="server" CssClass="txt1" OnSelectedIndexChanged="ddlSociety_SelectedIndexChanged" AutoPostBack="true" AppendDataBoundItems="true"></asp:DropDownList> </td>

                      <td> <asp:CompareValidator ID="CVSociety" runat="server" ErrorMessage="Select Society" Display="Dynamic" ControlToValidate="ddlSociety" Operator="NotEqual" ValueToCompare="0" Type="Integer" ForeColor="Red"></asp:CompareValidator></td>

                 </tr>

                  <tr>

                      <td> &nbsp; </td>

                        <td class="lbl"> House No:</td>

                        <td> <asp:DropDownList ID="ddlHouse" runat="server" CssClass="txt1" AppendDataBoundItems="true" AutoPostBack="true"> </asp:DropDownList> </td> 

                         <td> <asp:CompareValidator ID="CVhouseNo" runat="server" ErrorMessage="Select House No." Display="Dynamic" ControlToValidate="ddlHouse" Operator="NotEqual" ValueToCompare="0" Type="Integer" ForeColor="Red"></asp:CompareValidator> </td>

                 </tr>
                  <tr>

                      <td> &nbsp; </td>

                        <td class="lbl"> State:</td>

                        <td> <asp:DropDownList ID="ddlState" runat="server" CssClass="txt1" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="ddlState_SelectedIndexChanged"> </asp:DropDownList> </td> 

                         <td> <asp:CompareValidator ID="CVstate" runat="server" ErrorMessage="Select State" Display="Dynamic" ControlToValidate="ddlState" Operator="NotEqual" ValueToCompare="0" Type="Integer" ForeColor="Red"></asp:CompareValidator></td>

                 </tr>
                 <tr>

                     <td> &nbsp; </td>

                        <td class="lbl"> City:</td>

                        <td style="margin-left: 40px"> <asp:DropDownList ID="ddlCity" runat="server" CssClass="txt1" AppendDataBoundItems="true" AutoPostBack="true"> </asp:DropDownList> </td> 

                         <td> <asp:CompareValidator ID="CVcity" runat="server" ErrorMessage="Select City" Display="Dynamic" ControlToValidate="ddlCity" Operator="NotEqual" ValueToCompare="0" Type="Integer" ForeColor="Red"></asp:CompareValidator></td>

                 </tr>

                  <tr>
                      <td> &nbsp; </td>

                        <td class="lbl"> Photo: </td>

                        <td> <asp:FileUpload ID="uploadOPhoto" runat="server" Width="160px" /> </td>

                        <td> <asp:RequiredFieldValidator ID="RFVupload" runat="server" ErrorMessage="Insert Image" 
                                ForeColor="Red" ControlToValidate= "uploadOPhoto" Display="Dynamic"></asp:RequiredFieldValidator></td>

                  </tr>

                 <tr>
                        <td class="lbl"> &nbsp;</td>

                        <td> &nbsp;</td>

                        <td> &nbsp;</td>

                 </tr>

                  <tr>

                      <td> &nbsp; </td>

                        <td class="lbl"> UserName:</td>

                        <td> <asp:TextBox ID="txtUname" runat="server" CssClass="txt1"></asp:TextBox> </td>

                        <td> &nbsp;</td>

                  </tr>


                  <tr>

                        <td> &nbsp; </td>

                        <td class="lbl"> Password:</td>

                        <td> <asp:TextBox ID="txtUpassword" runat="server" CssClass="txt1" TextMode="Password" > </asp:TextBox> </td>

                        <td> &nbsp; </td>

                 </tr>


                 <tr>

                        <td> &nbsp;</td>

                     <td> &nbsp; </td>

                  <td  style="text-align: center"> &nbsp; <asp:Button ID="btnAdd" runat="server" CssClass="btn" Text="ADD MEMBER" OnClick="btnAdd_Click" Height="30px"/></td>

                     <td> &nbsp; </td>

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
            <table align="center">
                <tr>
                 <td>
                    <asp:GridView runat="server" ID="GVAllocateHouse" AutoGenerateColumns="False" style="text-align:center" ForeColor="#497174">
                        <Columns>
                            <asp:BoundField HeaderText="Name" DataField="Fname"/>
                            <asp:BoundField HeaderText="Surame" DataField="Lname"/>
                            <asp:BoundField HeaderText="Contact" DataField="Contact_No"/>
                            <asp:BoundField HeaderText="Email" DataField="Email_ID"/>
                            <asp:BoundField HeaderText="Age" DataField="OAge"/>
                            <asp:BoundField HeaderText="Total Members" DataField="O_No_Of_FamilyMember"/>

                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Image ID="image1" runat="server" ImageUrl='<%#"~/ImageHandler.ashx?id="+Eval("Owner_ID") %>' CssClass="img"/>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
               </td>
                </tr>
            </table>
        </tr>

    </table>    

</asp:Content>

