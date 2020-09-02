<%@ Page Title="" Language="C#" MasterPageFile="~/user/MasterPageUser.master" AutoEventWireup="true" CodeFile="viewcart.aspx.cs" Inherits="user_viewcart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    View Cart
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container" style="background-color: rgba(237,237,237,.8); min-height: 500px; border-radius: 5px;">
        <div class="row">
            <div class="col-12 col-md-12 col-lg-12" style="text-align: center; margin-bottom: 30px; font-size: 40px; padding-top: 30px; padding-bottom: 15px;">
                <b>My Cart</b>
            </div>
            <div class="col-12 col-md-12 col-lg-12 " style="margin-top: 30px;">
                <asp:GridView HeaderStyle-BackColor="#0A6EB2" HeaderStyle-ForeColor="White" runat="server" ID="GV" AutoGenerateColumns="false" CssClass="table border-success table-responsive-lg table-responsive-sm table-responsive-md" OnRowCommand="GV_RowCommand">


                    <Columns>
                        <asp:TemplateField HeaderText="Sr#">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                                <img src="<%# Eval("Image") %>" height="50px" width="50px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Medicine_Name" HeaderText="Medicine Name" />
                        <asp:BoundField DataField="Price_Per_Unit" HeaderText="Price Per Unit" />
                        <asp:BoundField DataField="Description" HeaderText="Description" />
                        <asp:BoundField DataField="Company_Name" HeaderText="Company Name" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                        <asp:BoundField DataField="Total_Price" HeaderText="Total Price" />
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="edit" Text="Edit" Width="70px" CommandName="Edit" CommandArgument='<%# Eval("sno") %>' />
                                <asp:LinkButton runat="server" ID="delete" Text="Delete" Width="50px" CommandName="Delete" CommandArgument='<%# Eval("sno") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>





                </asp:GridView>
            </div>
            <br />
            <br />

            <div style="text-align: center; margin-left: 100px;">
                <table>
                    <tr>
                        <td>
                            <b style="font-size: 15px;">Total Price:  </b>
                            <asp:Label runat="server" ID="lbltotal"></asp:Label>
                        </td>
                        <td>
                            <asp:Button Style="margin-left: 10px;" CssClass="form-control btn-primary" runat="server" ID="btnorder" Text="Check Out" OnClick="btnorder_Click" />

                        </td>
                    </tr>
                </table>

                <br />

            </div>
        </div>
    </div>
</asp:Content>


