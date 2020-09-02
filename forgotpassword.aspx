<%@ Page Language="C#" AutoEventWireup="true" CodeFile="forgotpassword.aspx.cs" Inherits="forgotpassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forgot Password</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <script src="js/bootstrap.js"></script>
</head>
<body style="background-image: url(Pictures/Online-Medical-Store-visakhapatnam.jpg)">
    <form id="form1" runat="server">
        <div class="container" style="margin-top: 50px; padding-bottom: 50px; margin-bottom: 50px; border-bottom-right-radius: 100px; border-top-left-radius: 100px;">
            <div class="row" style="margin-top: 50px; margin-bottom: 10px">
                <div class="col-12 col-md-12" style="text-align: center; margin-bottom: 30px; font-size: 40px;">
                    <b>Online Medical Store</b>
                </div>
            </div>
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
                            <asp:TextBox runat="server" ID="email" CssClass="form-control" Placeholder="Email" />
                            <asp:RequiredFieldValidator runat="server" ID="v1" ControlToValidate="email" Text="Please Enter Email!" ForeColor="Red" Display="Dynamic" />
                            <asp:RegularExpressionValidator runat="server" ID="v2" ControlToValidate="email" Text="Enter Valid Email !" ValidationExpression="^[\w-]+(\.[\w-]+)*@([a-z0-9-]+(\.[a-z0-9-]+)*?\.[a-z]{2,6}|(\d{1,3}\.){3}\d{1,3})(:\d{4})?$" ForeColor="Red" />
                        </div>
                    </div>
                    <div class="col-md-12" style="text-align:center; ">
                        <div class="form-group">
                            <asp:Button runat="server" ID="sendemail" Text="Send Email" CssClass="btn btn-primary align-content-center" OnClick="sendemail_Click" />
                        </div>
                          
                    </div>
                    <div class="col-md-12" style="padding: 10px">
                        <asp:Label runat="server" ID="label" ForeColor="Red"></asp:Label>
                    </div>
                </div>
            </div>

        </div>
    </form>
</body>
</html>
