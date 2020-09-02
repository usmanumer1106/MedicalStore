<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="manageusertype.aspx.cs" Inherits="manageusertype" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Manage User Type
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="container" style=" background-color:rgba(237,237,237,0.8); border-radius:5px; min-height:500px;">
            <div class="row" style="width:95%; margin-bottom: 10px">
                <div class="col-12 col-md-12" style="text-align: center;  font-size: 30px; padding-bottom:15px; padding-top:30px;">
                    <b>UserType Management</b>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-2" style="margin-left:-90px;"></div>
                    <div class="col-md-5 col-12 col-lg-5">
                        <div class="form-group">
                            <label><b>User Type</b></label>
                            <asp:TextBox runat="server" ID="txtUserType" CssClass="form-control" placeholder="User Type"/>
                            <asp:RequiredFieldValidator runat="server" ID="UserTypeValidator" ControlToValidate="txtUserType" Text="Enter UserType!" ForeColor="Red"/>
                        </div>
                    </div>
                <div class="col-lg-6"></div>
                
                <div class="col-md-6 col-12 col-lg-10">
                         <div class="form-group" style="text-align:center;">
                            <asp:Button runat="server" ID="save" Text="Add" CssClass="btn btn-primary align-content-lg-center" Width="100px" BackColor="Green" BorderColor="Green" OnClick="save_Click" />
                        </div>
                    </div>
                
                
           </div>
        </div>
</asp:Content>

