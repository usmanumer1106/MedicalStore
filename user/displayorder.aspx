<%@ Page Title="" Language="C#" MasterPageFile="~/user/MasterPageUser.master" AutoEventWireup="true" CodeFile="displayorder.aspx.cs" Inherits="user_displayorder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    My Order
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container" style=" background-color: rgba(237,237,237,.8); min-height:500px; border-radius:5px;"> 
  
          
   <div class="col-12 col-md-12 col-lg-12" style="text-align: center; margin-bottom: 30px; font-size: 40px; padding-top:30px; padding-bottom:15px;">
                    <b>My Orders</b>
                </div>
              
        <asp:GridView HeaderStyle-BackColor="#0A6EB2" HeaderStyle-ForeColor="White" runat="server" ID="GV" AutoGenerateColumns="false" CssClass="table border-success table-responsive-lg table-responsive-sm table-responsive-md" OnRowCommand="GV_RowCommand">
                        <Columns>
                            <asp:TemplateField HeaderText="Sr#" >
                                <ItemTemplate>
                                    <%#Container.DataItemIndex+1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="firstname" HeaderText="First Name" />
                            <asp:BoundField DataField="lastname" HeaderText="Last Name" />
                            <asp:BoundField DataField="email" HeaderText="Email" />
                           <asp:BoundField DataField="phone" HeaderText="Phone Number" />
                            <asp:BoundField DataField="city" HeaderText="City" />
                             <asp:BoundField DataField="postalcode" HeaderText="Postal Code"/>
                            <asp:BoundField DataField="address" HeaderText="Address" />
                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:linkButton runat="server" ID="btnfullorder" Text="View full order" CommandName="viewfullorder" CommandArgument='<%# Eval("id") %>' />
      
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
        </div>
</asp:Content>

