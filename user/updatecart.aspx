<%@ Page Title="" Language="C#" MasterPageFile="~/user/MasterPageUser.master" AutoEventWireup="true" CodeFile="updatecart.aspx.cs" Inherits="user_updatecart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Update Cart
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="container" style=" background-color: rgba(237,237,237,.8); min-height:500px; border-radius:5px;">
            <div class="row" >
                <div class="col-12 col-md-12 col-lg-12" style="text-align: center; margin-bottom: 30px; font-size: 40px; padding-top:30px; padding-bottom:15px;">
                    <b>Update Cart</b>
                </div>
    <table border="1" style="margin-left:310px; height:200px; width:500px;" class=" table ">
        <tr>
            <td>
                Medicine Name
            </td>
            <td>
        <asp:Label runat="server" ID="lblname"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>Description</td>
            <td>
                <asp:Label runat="server" ID="lbldes"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Price Per Unit
            </td>
            <td>
        <asp:Label runat="server" ID="lblprice"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>Quantity</td>
            <td>
                 <asp:Label runat="server" ID="lblqty"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox CssClass="form-control" runat="server" ID="txtqty" placeholder="Enter New Amount"></asp:TextBox>
            </td> 
            <td> 
            <asp:Button CssClass="form-control btn-primary" runat="server" ID="btnupdat" Text="Update" OnClick="btnupdat_Click"/>
             </td>
           
        </tr>
    </table>
                </div>
          </div>
</asp:Content>

