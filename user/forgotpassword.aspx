<%@ Page Title="" Language="C#" MasterPageFile="~/user/MasterPageUser.master" AutoEventWireup="true" CodeFile="forgotpassword.aspx.cs" Inherits="user_forgotpassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Forgot Password
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div class="container" style=" background-color: rgba(237,237,237,0.8); border-radius:5px; min-height:500px; ">
   <div style="height:90px" ></div>
            <div class="row">
                <div class="col-1 col-md-4">
                </div>
                <div class="col-10 col-md-4" style="background-color: rgba(237,238,237,0.8); border-radius: 10px; padding-top: 20px;">
                    <h2 style="text-align: center;">Forgot Password</h2>
                    <div class="col-md-12" style="text-align:center; ">
                        <br />
                       

                        <p style="color:red;"><b>Enter Your Email, If Email founded in our database You will recieve your password on that email.</b></p>
                          
                    </div>
                    <div class=" col-12 col-md-12">
                        <div class="form-group">
                            <label><b>Email:</b></label>
                            <asp:TextBox runat="server" ID="forgotpass" CssClass="form-control" Placeholder="Email" />
                            <asp:RequiredFieldValidator runat="server" ID="v1" ControlToValidate="forgotpass" Text="Please Enter Email!" ForeColor="Red" Display="Dynamic" />
                            <asp:RegularExpressionValidator runat="server" ID="v2" ControlToValidate="forgotpass" Text="Enter Valid Email !" ValidationExpression="^[\w-]+(\.[\w-]+)*@([a-z0-9-]+(\.[a-z0-9-]+)*?\.[a-z]{2,6}|(\d{1,3}\.){3}\d{1,3})(:\d{4})?$" ForeColor="Red" />
                        </div>
                    </div>
                    <div class="col-md-12" style="text-align:center; ">
                        <div class="form-group">
                            <asp:Button runat="server" ID="btnforgot" Text="Send Email" CssClass="btn btn-primary align-content-center" OnClick="btnforgot_Click" />
                        </div>
                          
                    </div>
                    <div class="col-md-12" style="padding: 10px">
                        <asp:Label runat="server" ID="label" ForeColor="Red"></asp:Label>
                    </div>
                </div>
            </div>

        </div>
        </div>



</asp:Content>

