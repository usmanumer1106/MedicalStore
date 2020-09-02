<%@ Page Title="" Language="C#" MasterPageFile="~/user/MasterPageUser.master" AutoEventWireup="true" CodeFile="productdiscription.aspx.cs" Inherits="user_productdiscription" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Product Description
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <div class="container" style=" background-color: rgba(237,237,237,0.8); border-radius:5px; min-height:500px; ">
         <div class="col-12 col-md-12 col-lg-12" style="text-align: center; margin-bottom: 30px; font-size: 40px; padding-top:30px; padding-bottom:15px;">
                    <b>Product Discription</b>
                </div>
         <div class="row">
    <asp:Repeater runat="server" ID="GV">
        <HeaderTemplate>

            <table style="margin-left:170px">
                <tr>
        </HeaderTemplate>
        <ItemTemplate>

            <td style="border-style: solid; border-width: 3px;">
                <div style="height: 250px; width: 715px; /*border-style: solid; border-width: 1px;*/">


                    <div style="height: 250px; width: 250px; border-style: solid; border-width: 1px; float: left;">
                        <asp:Image ID="image" runat="server" Height="250px" Width="250px" ImageUrl='<%# Eval("Image")  %>' />
                    </div>
                    <div style="height: 250px; width: 460px; border-style: solid; border-width: 1px; float: left; font-size:12px;">
                        <table style="padding-left:50px; padding-top:20px;" class=" table table-active table-bordered">
                            <tr>
                                <td>
                                    <b>Medicine Name: </b>
                                </td>
                                <td>
                                     <%# Eval("Medicine_Name") %>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b>Company Name:</b>
                                </td>
                                <td>
                                     <%# Eval("Company_Name") %>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b>Descprition:</b>
                                </td>
                                <td>
                                     <%# Eval("Description") %>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b>Price:</b>
                                </td>
                                <td>
                                      <%# Eval("Price_Per_Unit") %>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b>Availible??</b>
                                </td>
                                <td>
                                    <label style="color:green;" >Availible</label>
                                </td>
                            </tr>
                        </table>

                  
                       
                    </div>

                </div>






            </td>
        </ItemTemplate>

        <FooterTemplate>
            </tr>
                                </table>
        </FooterTemplate>
       



    </asp:Repeater>
     <br />
    <br />
    <table style="margin-left:270px; margin-top:30px;" >
        <tr>
            
            <td><label id="lblenter" runat="server" style="font-size:22px;"><b>Enter Quantity:</b></label></td>
            <td><asp:TextBox CssClass="form-control" runat="server" ID="txtquantity" placeholder="Enter Quantity" Text="1"/></td>
            <td><asp:Button CssClass="form-control btn-primary" runat="server" ID="btnaddtocart" Text="Add To Cart" OnClick="btnaddtocart_Click" /></td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Label runat="server" ID="lblquantity" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
    
         </div>

         </div>
</asp:Content>

