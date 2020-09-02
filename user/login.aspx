<%@ Page Title="" Language="C#" MasterPageFile="~/user/MasterPageUser.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="user_login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Login
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <div class="container" style=" background-color: rgba(237,237,237,0.8); border-radius:5px; min-height:500px; ">

   
           <div style="height:50px" ></div>
            <div class="row">
                <div class="col-1 col-md-4">
                </div>
                <div class="col-10 col-md-4" style="background-color: rgba(237,238,237,0.8); border-radius: 10px; padding-top: 20px;">
                    <h2 style="text-align: center;">Login</h2>
                    <div class=" col-12 col-md-12">
                        <div class="form-group">
                            <label><b>Email:</b></label>
                            <asp:TextBox runat="server" ID="txtemail" CssClass="form-control" Placeholder="Email" />
                            <asp:RequiredFieldValidator runat="server" ID="v1" ControlToValidate="txtemail" Text="Please Enter Email!" ForeColor="Red" Display="Dynamic" />
                            <asp:RegularExpressionValidator runat="server" ID="v2" ControlToValidate="txtemail" Text="Enter Valid Email !" ValidationExpression="^[\w-]+(\.[\w-]+)*@([a-z0-9-]+(\.[a-z0-9-]+)*?\.[a-z]{2,6}|(\d{1,3}\.){3}\d{1,3})(:\d{4})?$" ForeColor="Red" />
                        </div>
                    </div>
                    <div class=" col-12 col-md-12">
                        <div class="form-group">
                            <label><b>Password:</b></label>
                            <asp:TextBox runat="server" ID="txtpassword" CssClass="form-control" TextMode="Password" Placeholder="Password" />
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="txtpassword" Text="Please Enter Password!" ForeColor="Red" />
                        </div>
                    </div>
                   
                    <div class="col-md-12" style="text-align:left; margin-left:50px;">
                        <div class="form-group">
                            <asp:Button runat="server" ID="btnlogin" Text="Log In" CssClass="btn btn-primary align-content-center" OnClick="btnlogin_Click" />
                            <a href="forgotpassword.aspx" style="margin-left:5px;">Forgot Password?</a>
                        <a href="../loginpage.aspx">---Admin?</a> 
                        </div>
                          
                    </div>
                    <div class="col-md-12" style="padding: 10px">
                        <asp:Label runat="server" ID="lblmsg" ForeColor="Red"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>

