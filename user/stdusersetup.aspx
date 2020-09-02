<%@ Page Title="" Language="C#" MasterPageFile="~/user/MasterPageUser.master" AutoEventWireup="true" CodeFile="stdusersetup.aspx.cs" Inherits="user_stdusersetup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    User Setup
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="container" style=" background-color: rgba(237,237,237,.8); min-height:500px; border-radius:5px;">
            <div class="row" >
                <div class="col-12 col-md-12 col-lg-12" style="text-align: center; margin-bottom: 30px; font-size: 40px; padding-top:30px; padding-bottom:15px;">
                    <b>User Setup</b>
                </div>
                </div>

           <div class="row">
                <div class="col-lg-2" style="margin-left:-90px;"></div>
                    <div class="col-md-5 col-12 col-lg-5">
                        <div class="form-group">
                            <label><b>First Name</b></label>
                             <asp:Textbox CssClass="form-control" runat="server" ID="txtfirstname" placeholder="First Name"/>

                        </div>
                    </div>
                
                    <div class="col-md-5 col-12 col-lg-5">
                        <div class="form-group">
                             <label><b>Last Name</b></label>
                            <asp:Textbox CssClass="form-control" runat="server" ID="txtlastname" placeholder="Last Name"/>
                               </div>
                    </div>
                <div class="col-lg-2" style="margin-left:-90px;"></div>
                    <div class="col-md-5 col-12 col-lg-5">
                        <div class="form-group">
                            <label><b>Email</b></label>
                            <asp:Textbox CssClass="form-control" runat="server" ID="txtemail" placeholder="Email"/>

                        </div>
                    </div>
                <div class="col-md-5 col-12 col-lg-5">
                        <div class="form-group">
                            <label><b>Date Of Birth</b></label>
                           
                             <asp:Textbox CssClass="form-control" runat="server" ID="txtdob" placeholder="Date/Month/Year"/>
                              </div>
                    </div>
                <div class="col-lg-2" style="margin-left:-90px;"></div>
                <div class="col-md-5 col-12 col-lg-5">
                        <div class="form-group">
                            <label><b>State</b></label>
                           <asp:Textbox CssClass="form-control" runat="server" ID="txtState" placeholder="State/Province"/>                      
                        </div>
                    </div>
                <div class="col-md-5 col-12 col-lg-5">
                        <div class="form-group">
                            <label><b>Postal Code</b></label>
                           <asp:Textbox CssClass="form-control" runat="server" ID="txtpostalcode" placeholder="State/Province"/>                      
                        </div>
                    </div>
                 <div class="col-lg-2" style="margin-left:-90px;"></div>
                 <div class="col-md-5 col-12 col-lg-5">
                        <div class="form-group">
                            <label><b>Address</b></label>
                           <asp:Textbox CssClass="form-control" runat="server" ID="txtaddress" placeholder="Address" TextMode="MultiLine"/>
                        </div>
                    </div>
                    <div class="col-md-5 col-12 col-lg-3">
                        <div class="form-group">
                            <label><b>Moblie No</b></label>
                           <asp:TextBox CssClass="form-control" runat="server" ID="txtphonenumber" placeholder="Phone Number"/>
                        </div>
                    </div>
                <div class="col-md-5 col-12 col-lg-2">
                        <div class="form-group">
                            <label><b>City</b></label>
                          <asp:Textbox CssClass="form-control" runat="server" ID="txtcity" placeholder="City"/>                     
                        </div>
                    </div>
                <div class="col-lg-2" style="margin-left:-90px;"></div>
                 <div class="col-md-5 col-12 col-lg-5">
                        <div class="form-group">
                            <label><b>Password</b></label>
                           <asp:Textbox CssClass="form-control" runat="server" ID="txtpassword" placeholder="Password" TextMode="Password"/>
                               <asp:RequiredFieldValidator Display="Dynamic" runat="server" ID="PasswordValidator" ControlToValidate="txtpassword" Text="Enter Password!" ForeColor="Red"/>
                            <asp:regularexpressionvalidator runat="server" ID="PasswordValidator2" ControlToValidate="txtpassword" Text="Password Must be More than 8 Character Should Contain one upercass one lower case and 1 number!" ForeColor="Red" ValidationExpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,15})$"/>
                        </div>
                    </div>
                <div class="col-md-5 col-12 col-lg-5">
                        <div class="form-group">
                            <label><b>Confirm Password</b></label>
                             <asp:Textbox CssClass="form-control" runat="server" ID="txtconfirmpassword" placeholder="Confirm Password" TextMode="Password"/>
                              <asp:RequiredFieldValidator Display="Dynamic" runat="server" ID="ConfirmPasswordValidator" ControlToValidate="txtconfirmpassword" Text="Confirm Password!" ForeColor="Red"/>
                            <asp:CompareValidator runat="server" ID="CompareValidator" ControlToValidate="txtconfirmpassword" ControlToCompare="txtpassword"  Text="Password Not Match" ForeColor="Red"/> 
                       </div>
                    </div>
                <div class="col-md-12 col-12 col-lg-12">
                         <div class="form-group" style="text-align:center; margin-left:500px;">
                           
                               <asp:Button CssClass="form-control btn-primary" runat="server" ID="btnregister" Text="Register" Width="80px" OnClick="btnregister_Click"  />

                         </div>
                   
                    </div>
                
                
           </div>
        </div>
            
            
      <asp:DropDownList runat="server" ID="status" >
                    <asp:ListItem Value="0" Text="Inactive"/>
                    <asp:ListItem Value="1" Text="Active"/>
                </asp:DropDownList>
                     <asp:DropDownList runat="server" ID="ddlrole"></asp:DropDownList>
</asp:Content>

