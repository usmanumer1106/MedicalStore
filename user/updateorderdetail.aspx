﻿<%@ Page Title="" Language="C#" MasterPageFile="~/user/MasterPageUser.master" AutoEventWireup="true" CodeFile="updateorderdetail.aspx.cs" Inherits="user_updateorderdetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="container" style=" background-color: rgba(237,237,237,.8); min-height:500px; border-radius:5px;">
            <div class="row" >
                <div class="col-12 col-md-12 col-lg-12" style="text-align: center; margin-bottom: 30px; font-size: 40px; padding-top:30px; padding-bottom:15px;">
                    <b>Update Shipping Detail</b>
                </div>
   <table style=" margin-left:350px;" class=" border-dark table table-responsive  table-responsive-lg table-responsive-md table-responsive-sm">
        
        <tr>
            <td>
                <b>Name:</b>
            </td>
            <td>
                <asp:Label runat="server" ID="lblname"></asp:Label>
            </td>
        </tr>
       
         <tr>
            <td>
                <b>Email:</b>
            </td>
            <td>
                <asp:Label runat="server" ID="lblemail"></asp:Label>
            </td>
        </tr>
         <tr>
            <td>
                <b>Phone Number:</b>
            </td>
            <td>
                <asp:Label runat="server" ID="lblphoneno"></asp:Label>
            </td>
        </tr>
         <tr>
            <td>
                <b>City:</b>
            </td>
            <td>
                <asp:Label runat="server" ID="lblcity"></asp:Label>
            </td>
        </tr>
         <tr>
            <td>
                <b>Postal Code:</b>
            </td>
            <td>
                <asp:Label runat="server" ID="lblpostalcode"></asp:Label>
            </td>
        </tr>
         <tr>
            <td>
                <b>State:</b>
            </td>
            <td>
                <asp:Label runat="server" ID="lblstate"></asp:Label>
            </td>
        </tr>
         <tr>
            <td>
                <b>Address:</b>
            </td>
            <td>
                <asp:Label runat="server" ID="lbladdress"></asp:Label>
            </td>
        </tr>
          <tr></tr>
          <tr>
              
              <td  style="text-align:center"><asp:Button CssClass="form-control btn-primary" runat="server" ID="btnupdate" Text="Update Detail" OnClick="btnupdate_Click" /></td>
            <td>
                <asp:Button CssClass="form-control btn-primary" runat="server" ID="btcontinue" Text="Continue" OnClick="btcontinue_Click" />
            </td>
          </tr>
        
    </table>
                </div>
          </div>

</asp:Content>



