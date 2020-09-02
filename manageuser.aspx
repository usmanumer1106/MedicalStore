<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="manageuser.aspx.cs" Inherits="manageuser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Manage User
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="container" style=" background-color: rgba(237,237,237,0.8); border-radius:5px; min-height:500px;">
            <div class="row" style="width:95%; margin-bottom: 10px; text-align:center;">
                <div class="col-12 col-md-12" style="text-align: center;  font-size: 30px; padding-top:30px; padding-bottom:15px;">
                    <b>User Management</b>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-2" style="margin-left:-90px;"></div>
                    <div class="col-md-5 col-12 col-lg-5">
                        <div class="form-group">
                            <label><b>First Name</b></label>
                            <asp:TextBox runat="server" ID="txtFirstName" CssClass="form-control" placeholder="First Name"/>
                            <asp:RequiredFieldValidator Display="Dynamic" runat="server" ID="FirstNameValidator" ControlToValidate="txtFirstName" Text="Please Enter First Name!" ForeColor="Red"/>
                            <asp:RegularExpressionValidator ID="FirstNameValidator2" runat="server" ControlToValidate="txtFirstName" ValidationExpression="^[a-zA-Z'.\s]{1,50}" Text="Invalid First Name!" ForeColor="Red" />
                        </div>
                    </div>
                
                    <div class="col-md-5 col-12 col-lg-5">
                        <div class="form-group">
                            <label><b>Last Name</b></label>
                            <asp:TextBox runat="server" ID="txtLastName" CssClass="form-control" placeholder="Last Name" />
                            <asp:RequiredFieldValidator Display="Dynamic" runat="server" ID="LastNameValidator" ControlToValidate="txtLastName" Text="Please Enter Last Name!" ForeColor="Red"/>
                            <asp:RegularExpressionValidator ID="LastNameValidator2" runat="server" ControlToValidate="txtLastName" ValidationExpression="^[a-zA-Z'.\s]{1,50}" Text="Invalid Last Name!" ForeColor="Red" />
                          </div>
                    </div>
                <div class="col-lg-2" style="margin-left:-90px;"></div>
                    <div class="col-md-5 col-12 col-lg-5">
                        <div class="form-group">
                            <label><b>Email</b></label>
                            <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control"  placeholder="Email"/>
                            <asp:RequiredFieldValidator Display="Dynamic" runat="server" ID="EmailValidator" ControlToValidate="txtEmail" Text="Please Enter Email!" ForeColor="Red"/>
                            <asp:RegularExpressionValidator runat="server" ID="EmailValidator2" ControlToValidate="txtEmail" Text="Enter Valid Email !" ValidationExpression="^[\w-]+(\.[\w-]+)*@([a-z0-9-]+(\.[a-z0-9-]+)*?\.[a-z]{2,6}|(\d{1,3}\.){3}\d{1,3})(:\d{4})?$" ForeColor="Red" />

                        </div>
                    </div>
                <div class="col-md-5 col-12 col-lg-3">
                        <div class="form-group">
                            <label><b>Date Of Birth</b></label>
                            <asp:TextBox runat="server" ID="txtDateOfBirth"  CssClass="form-control" placeholder="Date/Month/Year" MaxLength="10"/>
                            <asp:RequiredFieldValidator Display="Dynamic" runat="server" ID="dobValidator" ControlToValidate="txtDateOfBirth" Text="Please Enter Date Of Birth!" ForeColor="Red"/>
                            <asp:RegularExpressionValidator runat="server" ForeColor = "Red" ControlToValidate="txtDateOfBirth" ValidationExpression="(((0|1)[0-9]|2[0-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$" ErrorMessage="Invalid Format."/>
                        </div>
                    </div>
                <div class="col-md-5 col-12 col-lg-2">
                        <div class="form-group">
                            <label><b>Status</b></label>
                           <asp:DropDownList runat="server" CssClass="form-control" ID="status" >
                               <asp:ListItem Value="0" Text="Inactive"/>
                               <asp:ListItem Value="1" Text="Active" />
                           </asp:DropDownList>                         
                        </div>
                    </div>
                 <div class="col-lg-2" style="margin-left:-90px;"></div>
                 <div class="col-md-5 col-12 col-lg-5">
                        <div class="form-group">
                            <label><b>Role</b></label>
                           <asp:DropDownList runat="server" CssClass="form-control" ID="ddlrole" >   
                           </asp:DropDownList>  
                        </div>
                    </div>
                    <div class="col-md-5 col-12 col-lg-5">
                        <div class="form-group">
                            <label><b>Moblie No</b></label>
                            <asp:TextBox runat="server" ID="txtMobileNo" CssClass="form-control"  placeholder="03xx-xxxxxxx or +92xxxxxxxxxx or 03xxxxxxxxx" />
                            <asp:RequiredFieldValidator Display="Dynamic" runat="server" ID="MobileNoValidator2" ControlToValidate="txtMobileNo" Text="Please Enter Moblie No!" ForeColor="Red"/>
                            <asp:regularexpressionvalidator runat="server" ID="MobileNoValidator" ControlToValidate="txtMobileNo" Text="Invalid Mobile No!" ForeColor="Red" ValidationExpression="^((\+92)|(0092))-{0,1}\d{3}-{0,1}\d{7}$|^\d{11}$|^\d{4}-\d{7}$"/> 
                            
                        </div>
                    </div>
                <div class="col-lg-2" style="margin-left:-90px;"></div>
                 <div class="col-md-5 col-12 col-lg-5">
                        <div class="form-group">
                            <label><b>Password</b></label>
                            <asp:TextBox runat="server" ID="Password" CssClass="form-control"  placeholder="Password" TextMode="Password"/>
                             <asp:RequiredFieldValidator Display="Dynamic" runat="server" ID="PasswordValidator" ControlToValidate="Password" Text="Enter Password!" ForeColor="Red"/>
                            <asp:regularexpressionvalidator runat="server" ID="PasswordValidator2" ControlToValidate="Password" Text="Password Must be More than 8 Character Should Contain one upercass one lower case and 1 number!" ForeColor="Red" ValidationExpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,15})$"/>
                        </div>
                    </div>
                <div class="col-md-5 col-12 col-lg-5">
                        <div class="form-group">
                            <label><b>Confirm Password</b></label>
                            <asp:TextBox runat="server" ID="ConfirmPassword" CssClass="form-control"  placeholder="Confirm Password" TextMode="Password"/>
                            <asp:RequiredFieldValidator Display="Dynamic" runat="server" ID="ConfirmPasswordValidator" ControlToValidate="ConfirmPassword" Text="Confirm Password!" ForeColor="Red"/>
                            <asp:CompareValidator runat="server" ID="CompareValidator" ControlToValidate="ConfirmPassword" ControlToCompare="Password"  Text="Password Not Match" ForeColor="Red"/> 
                       </div>
                    </div>
                <div class="col-md-12 col-12 col-lg-12">
                         <div class="form-group" style="text-align:center;">
                            <asp:Button runat="server" ID="save" Text="Add" CssClass="btn btn-primary align-content-center" Width="100px" BackColor="Green" BorderColor="Green" OnClick="save_Click" />
                        </div>
                    </div>
                
                
           </div>
        </div>
</asp:Content>

