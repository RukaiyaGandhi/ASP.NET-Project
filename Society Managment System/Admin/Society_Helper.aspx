<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Society_Helper.aspx.cs" Inherits="_Default" %>


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
            
            <td class="tblHead"> Add Society Helper </td>

        </tr>

         <tr> <td style="text-align:center"> 

             <table align="center" class="style1">

                 <tr>
                        <td> &nbsp; </td>

                        <td> &nbsp;</td>

                        <td> &nbsp;</td>

                 </tr>
                 <tr>
                        <td class="lbl">Full Name:</td>

                        <td> <asp:TextBox ID="txtHname" runat="server" CssClass="txt1"></asp:TextBox></td> 


                      <td>
                           <asp:RequiredFieldValidator ID="RFVHname" runat="server" 
                                ControlToValidate="txtHname" ErrorMessage="Enter Name" ForeColor="Red" 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                      </td>

                         

                 </tr>

                  <tr>
                        
                        <td class="lbl">Address:</td>

                        <td> <asp:TextBox ID="txtHAdd" runat="server" TextMode="MultiLine" CssClass="txt1"> </asp:TextBox> </td> 

                       <td>
                           <asp:RequiredFieldValidator ID="RFVaddress" runat="server" 
                                ControlToValidate="txtHAdd" ErrorMessage="Enter Address" ForeColor="Red" 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                      </td>

                 </tr>
                 <tr>

                     <td class="lbl">Contact no.:</td>

                      <td> <asp:TextBox ID="txtphonenum" runat="server" CssClass="txt1"></asp:TextBox> </td>

                      <td>

                          <asp:RegularExpressionValidator ID="REVcontact" runat="server" ErrorMessage="!!" ForeColor="Red" ControlToValidate="txtphonenum" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>

                            <asp:RequiredFieldValidator ID="RFVcontact" runat="server" 
                                ControlToValidate="txtphonenum" ErrorMessage="Enter Contact" ForeColor="Red"></asp:RequiredFieldValidator>
                       </td>     

                 </tr>
                  <tr>

                     <td class="lbl">Age:</td>

                      <td> <asp:TextBox ID="txtAge" runat="server" CssClass="txt1"></asp:TextBox> </td>

                      <td>
                           

                          <asp:CompareValidator ID="CVage" runat="server" ErrorMessage="!!" Operator="DataTypeCheck" Type="Integer" ControlToValidate="txtAge" ForeColor="Red"></asp:CompareValidator>

                            <asp:RequiredFieldValidator ID="RFVage" runat="server" 
                                ControlToValidate="txtAge" ErrorMessage="Enter Age" ForeColor="Red"></asp:RequiredFieldValidator>
                       </td>   

       

                 </tr>


                  <tr>

                     <td class="lbl">Gender:</td>

                      <td>
                           <asp:DropDownList ID="ddlGender" runat="server" CssClass="txt1" AppendDataBoundItems="true" AutoPostBack="true">
                          <asp:ListItem Value="0">---Select Gender---</asp:ListItem>
                          <asp:ListItem Value="1">Male</asp:ListItem>
                          <asp:ListItem Value="2">Female</asp:ListItem>
                          <asp:ListItem Value="3">Others</asp:ListItem>
                          </asp:DropDownList>

                      </td>

                      <td>
                          
                          <asp:CompareValidator ID="CVSociety" runat="server" ErrorMessage="Select Gender" Display="Dynamic" ControlToValidate="ddlGender" Operator="NotEqual" ValueToCompare="0" Type="Integer" ForeColor="Red"></asp:CompareValidator>

                      </td>

                 </tr>

                 <tr>

                     <td class="lbl">Designation:</td>

                      <td> <asp:DropDownList ID="ddlDesignation" runat="server" CssClass="txt1" AppendDataBoundItems="true" AutoPostBack="true"></asp:DropDownList> </td>
                      <td>

                            <asp:CompareValidator ID="CVdesign" runat="server" ErrorMessage="Select Designation" Display="Dynamic" ControlToValidate="ddlDesignation" Operator="NotEqual" ValueToCompare="0" Type="Integer" ForeColor="Red"></asp:CompareValidator>
                       
                      </td>   

                 </tr>
                  <tr>
                        
                        <td class="lbl">Refrence Society:</td>

                        <td> <asp:TextBox ID="txtrefsociety" runat="server" CssClass="txt1"></asp:TextBox> </td> 


                    <td>  <asp:RequiredFieldValidator ID="RFVRefSociety" runat="server" 
                                ControlToValidate="txtrefsociety" ErrorMessage="Enter Society" ForeColor="Red" 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>

                    </td>

                 </tr>
                   <tr>

                     <td class="lbl">Refrence Contact:</td>

                      <td> <asp:TextBox ID="txtRefcontact" runat="server" CssClass="txt1"></asp:TextBox> </td>

                      <td>
                           <asp:RegularExpressionValidator ID="REVRefContact" runat="server" ErrorMessage="!!" ForeColor="Red" ControlToValidate="txtRefcontact" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>

                            <asp:RequiredFieldValidator ID="RFVRefContact" runat="server" 
                                ControlToValidate="txtRefcontact" ErrorMessage="Enter Contact" ForeColor="Red"></asp:RequiredFieldValidator>
                       </td>   

                 </tr>
                  <tr>

                     <td class="lbl">Society:</td>

                      <td> <asp:DropDownList ID="ddlSociety" runat="server" CssClass="txt1" AppendDataBoundItems="true" AutoPostBack="true"></asp:DropDownList> </td>
                      <td>
                        <asp:CompareValidator ID="CSociety" runat="server" ErrorMessage="Select Society" Display="Dynamic" ControlToValidate="ddlSociety" Operator="NotEqual" ValueToCompare="0" Type="Integer" ForeColor="Red"></asp:CompareValidator>
                       </td>   

                 </tr>


                   <tr>

                     <td class="lbl">Shift:</td>

                      <td> <asp:TextBox ID="txtShift" runat="server" CssClass="txt1"></asp:TextBox> </td>

                      <td>
                           <asp:RequiredFieldValidator ID="RFVshift" runat="server" 
                                ControlToValidate="txtShift" ErrorMessage="Enter Shift" ForeColor="Red" 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                       </td>   

                 </tr>
                   <tr>

                        <td class="lbl">Joining Date:</td>

                        <td> <asp:TextBox ID="txtCal" runat="server" CssClass="txt1" TextMode="Date"></asp:TextBox></td>
   
                        <td>

                             <asp:RequiredFieldValidator ID="RFVdate" runat="server" 
                                ControlToValidate="txtCal" ErrorMessage="Enter Date" ForeColor="Red" 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                         
                    </tr>

                    <tr>
                        <td class="lbl">Image:</td>

           

                        <td>   <asp:FileUpload ID="Simageupload" runat="server" CssClass="txt1" BorderStyle="None"/> </td>


                      <td>   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="Simageupload" ErrorMessage="Enter Image" ForeColor="Red" 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>

                          </td>
                    </tr>


                 <tr>

                      <td> &nbsp;</td>

                 </tr>

                 <tr>
                        <td> &nbsp;</td>

                        <td style="text-align: left"> <asp:Button ID="btnAdd" runat="server" CssClass="btn" Text="ADD Helper" OnClick="btnAdd_Click" Height="30px" /> </td>

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
                        <asp:GridView ID="grvCmember" runat="server" AutoGenerateColumns="False" style="text-align:center" ForeColor="#497174">
                            <Columns>
                                <asp:BoundField DataField="SHelper_ID" d HeaderText="Helper ID"/>
                                <asp:BoundField DataField="HName" HeaderText="Name"/>
                                <asp:BoundField DataField="HAddress" HeaderText="Address"/>
                                <asp:BoundField DataField="Contact_No" HeaderText="Contact No"/>
                                <asp:BoundField DataField="Age" HeaderText="Age"/>
                                <asp:BoundField DataField="Gender" HeaderText="Gender"/>
                                <asp:BoundField DataField="Designation_ID" HeaderText="Designation ID"/>
                                <asp:BoundField DataField="Ref_Sname" HeaderText="Refrence Society"/>
                                <asp:BoundField DataField="Ref_Contact_No" HeaderText="Refrence Contact"/>
                                <asp:BoundField DataField="Society_ID" HeaderText="Society ID"/>
                                <asp:BoundField DataField="Swift" HeaderText="Shift"/>
                                <asp:BoundField DataField="Joining_Date" HeaderText="Joining Date"/>
                                <asp:TemplateField >
                                    <ItemTemplate>
                                        <asp:Image runat="server" ID="image" ImageUrl='<%#"~/ImageHandlerSocietyHelpers.ashx?id="+Eval("SHelper_ID")%>' CssClass="img"/>
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

