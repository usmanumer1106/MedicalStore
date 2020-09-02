<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="displayfullorder.aspx.cs" Inherits="displayfullorder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Display Full Order
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

      <div class="container" style=" background-color: rgba(237,237,237,.8); min-height:500px; border-radius:5px;">
            <div class="row" >
                <div class="col-12 col-md-12 col-lg-12" style="text-align: center; margin-bottom: 30px; font-size: 40px; padding-top:30px; padding-bottom:15px;">
                    <b>Order Information</b>
                </div>
                



                 <div class="col-12 col-md-12 col-lg-12" style="margin-top:30px;">
                    <asp:GridView HeaderStyle-BackColor="#0A6EB2" HeaderStyle-ForeColor="White" runat="server" ID="GV2" AutoGenerateColumns="false" CssClass="table border-success table-responsive-lg table-responsive-sm table-responsive-md" >
                        <Columns>
                           
                            <asp:BoundField DataField="firstname" HeaderText="First Name" />
                            <asp:BoundField DataField="lastname" HeaderText="Last Name" />
                            <asp:BoundField DataField="email" HeaderText="Email" />
                           <asp:BoundField DataField="phone" HeaderText="Phone Number" />
                            <asp:BoundField DataField="city" HeaderText="City" />
                             <asp:BoundField DataField="postalcode" HeaderText="Postal Code"/>
                            <asp:BoundField DataField="address" HeaderText="Address" />
                            <asp:BoundField DataField="Status" HeaderText="Status" />
                           
                        </Columns>
                    </asp:GridView>

                </div>




               
                <div class="col-12 col-md-12 col-lg-12" style="margin-top:20px;">
                    <div style="text-align:center; font-size:15px; color:green; margin-bottom:20px;"><b>Order Contain</b></div>
                    <asp:GridView HeaderStyle-BackColor="#0A6EB2" HeaderStyle-ForeColor="White" runat="server" ID="GV" AutoGenerateColumns="false" CssClass="table border-success table-responsive-lg table-responsive-sm table-responsive-md" >
                        <Columns>
                            <asp:TemplateField HeaderText="Sr#">
                                <ItemTemplate>
                                    <%#Container.DataItemIndex+1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            

                            <asp:TemplateField HeaderText="Image">
                             <ItemTemplate>
                                 <asp:Image ID="image" runat="server" Height="35px" Width="35px" ImageUrl='<%# Eval("productimage")  %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                           
                            <asp:BoundField DataField="productname" HeaderText="Medicine Name" />
                            <asp:BoundField DataField="productprice" HeaderText="Price" />
                           <asp:BoundField DataField="productquantity" HeaderText="Quantity" />
                          
                        </Columns>
                    </asp:GridView>
                    
                    <table style="margin-bottom:20px; margin-left:50px;">
                    <tr>
                        <td style="width:400px;">
                            <asp:DropDownList runat="server" CssClass="form-control" ID="status">
                                <asp:ListItem Value="0" Text="In Process" />
                                <asp:ListItem Value="1" Text="Complete" />
                                <asp:ListItem Value="2" Text="Cancled" />
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Button runat="server" ID="btnchangestatus" Text="Change Status" Height="33px" CssClass=" btn-primary rounded" OnClick="btnchangestatus_Click" />
                        </td>
                        <td style="padding-left:50px; padding-top:10px;">
                            <p style="color: green; float: right; font-size: 20px;">
                                Full Order Price:---:<asp:Label runat="server" ID="lbltotalprice"></asp:Label>
                            </p>
                        </td>
                    </tr>
                </table>
                </div>
                
                
            </div>
          

        </div>
</asp:Content>

