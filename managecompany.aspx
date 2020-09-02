<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="managecompany.aspx.cs" Inherits="managecompany" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Manage Company
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="container" style=" background-color: rgba(237,237,237,0.8); border-radius:5px; min-height:500px;">
            <div class="row" style="width:95%; margin-bottom: 10px">
                <div class="col-12 col-md-12" style="text-align: center;  font-size: 30px; padding-top:30px; padding-bottom:15px;">
                    <b>Company Management</b>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-2" style="margin-left:-90px;"></div>
                    <div class="col-md-5 col-12 col-lg-5">
                        <div class="form-group">
                            <label><b>Company Name</b></label>
                            <asp:TextBox runat="server" ID="txtCompanyName" CssClass="form-control" placeholder="Company Name"/>
                            <asp:RequiredFieldValidator runat="server" ID="CompanyValidator" ControlToValidate="txtCompanyName" Text="Enter Medicine Name!" ForeColor="Red"/>
                        </div>
                    </div>                
                   <div class="col-md-5 col-12 col-lg-5">
                        <div class="form-group">
                            <label><b>Moblie No</b></label>
                            <asp:TextBox runat="server" ID="txtMobileNo" CssClass="form-control"  placeholder="03xx-xxxxxxx or +92xxxxxxxxxx or 03xxxxxxxxx" />
                            <asp:RequiredFieldValidator Display="Dynamic" runat="server" ID="MobileNoValidator2" ControlToValidate="txtMobileNo" Text="Enter Moblie No!" ForeColor="Red"/>
                            <asp:regularexpressionvalidator runat="server" ID="MobileNoValidator" ControlToValidate="txtMobileNo" Text="Invalid Mobile No!" ForeColor="Red" ValidationExpression="^((\+92)|(0092))-{0,1}\d{3}-{0,1}\d{7}$|^\d{11}$|^\d{4}-\d{7}$"/> 
                            
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

