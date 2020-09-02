<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="sales.aspx.cs" Inherits="sales" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Sales
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container" style="background-color: rgba(237,237,237,0.8); border-radius: 5px; min-height: 500px;">
        <div class="row" style="width: 95%; margin-bottom: 10px">
            <div class="col-12 col-md-12" style="text-align: center; font-size: 30px; padding-top: 30px; padding-bottom: 15px;">
                <b>Sales Management</b>
            </div>
        </div>
        <div class="row">

            <div class="col-md-3 col-12 col-lg-3">
                <div>
                    <label><b>First Name</b></label>
                    <asp:TextBox runat="server" ID="txtFirstName" CssClass="form-control" placeholder="First Name" />
                </div>
            </div>
            <div class="col-md-3 col-12 col-lg-3">
                <div>
                    <label><b>Last Name</b></label>
                    <asp:TextBox runat="server" ID="TextBox1" CssClass="form-control" placeholder="Last Name" />
                </div>
            </div>
            <div class="col-md-3 col-12 col-lg-3">
                <div>
                    <label><b>Phone No</b></label>
                    <asp:TextBox runat="server" ID="TextBox2" CssClass="form-control" placeholder="Phone Number" />
                </div>
            </div>
            <div class="col-md-3 col-12 col-lg-3">
                <div>
                    <label><b>Date</b></label>
                    <asp:TextBox runat="server" ID="txtdate" CssClass="form-control" ReadOnly="true" />
                </div>
            </div>
            <div class="col-md-3 col-12 col-lg-3">
                <div>
                    <label><b>Medicine</b></label>
                    <asp:DropDownList runat="server" ID="ddlmedicine" CssClass="form-control" placeholder="Medicine Name" AutoPostBack="true" />
                </div>

            </div>
            <div class="col-md-3 col-12 col-lg-3">
                <div>
                    <label><b>Quantity</b></label>
                    <asp:TextBox runat="server" ID="txtquantity" CssClass="form-control" placeholder="Quantity" AutoPostBack="true" />
                </div>
            </div>
            <div class="col-md-3 col-12 col-lg-3">
                <div>
                    <label><b>Price</b></label>
                    <asp:TextBox runat="server" ID="txtprice" CssClass="form-control" placeholder="Price Per Unit" ReadOnly="true" />
                </div>
            </div>
            <div class="col-md-3 col-12 col-lg-3">
                <div>
                    <label><b>Total</b></label>
                    <asp:TextBox runat="server" ID="txttotalprice" CssClass="form-control" placeholder="Total Price" ReadOnly="true" />
                </div>
            </div>
            <div class="col-md-12 col-12 col-lg-12">
                <div class="form-group">
                    <asp:Button runat="server" OnClick="add_Click" ID="add" Text="Add" CssClass="btn btn-primary align-content-center" Width="100px" BackColor="Green" BorderColor="Green" />
                    
                </div>
            </div>
        </div>

         <asp:GridView runat="server" ID="GV" AutoGenerateColumns="false" CssClass="table border-success table-responsive-lg table-responsive-sm table-responsive-md">
                        <Columns>
                            <asp:TemplateField HeaderText="Sr#">
                                <ItemTemplate>
                                    <%#Container.DataItemIndex+1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Medicine_Name" HeaderText="Medicine Name" />
                            <asp:BoundField DataField="Price" HeaderText="Price" />
                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                            <asp:BoundField DataField="Total" HeaderText="Total" />
                        </Columns>
                    </asp:GridView>

    </div>
</asp:Content>


