<%@ Page Title="" Language="C#" MasterPageFile="~/user/MasterPageUser.master" AutoEventWireup="true" CodeFile="medicine.aspx.cs" Inherits="user_product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    The Store
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="container" style=" background-color: rgba(237,237,237,.8); min-height:500px; border-radius:5px;">
            <div class="row" >
                <div class="col-12 col-md-12 col-lg-12" style="text-align: center; margin-bottom: 30px; font-size: 40px; padding-top:30px; padding-bottom:15px;">
                    <b>Medicine Avalible In The Store</b>
                </div>
                
                <div class="col-12 col-md-12 col-lg-12" style="margin-top:30px; margin-left:110px;">
                    
                     <table style="margin-bottom:30px;">
                         <tr>
                             <td>
                                  <asp:TextBox runat="server" ID="txtSearch" Height="30px"  placeholder="Search Medicine"  CssClass="form-control"/>
                 
                             </td>
                             
                             <td style=" padding-left:20px;">
  <asp:Button runat="server" ID="btnsearch" CssClass=" btn-primary rounded" Width="100" Height="30px"  OnClick="btnsearch_Click" Text="Search" />
                       
                             </td>
                         </tr>
                     </table>
                    <div class=" col-lg-12" style="margin-left:-110px;">

                    
                    <asp:datalist runat="server" ID="GV" RepeatColumns="4" CssClass=" table table-active table-bordered"  >
                      <HeaderTemplate>
                          <ul>
                          <table style="text-align:center;">
                              <tr">
                          
                      </HeaderTemplate>
                            <ItemTemplate>
                              
                          <td style="border-style:solid; border-width:3px; width:200px; margin-left:20px;">
                                
                            <a href="productdiscription.aspx?id=<%# Eval("Medicine_ID") %>">  <asp:Image ID="image" runat="server" Height="200px" Width="200px" ImageUrl='<%# Eval("Image")  %>' />
                              <p style="padding-top:6px; background-color:#0A6EB2; height:30px; color:white; font-size:15px;" ><%# Eval("Medicine_Name") %></p> <br />
                             
                             <p style="padding-top:6px; margin-top:-9px; background-color:#0A6EB2; height:30px; color:white; font-size:15px;"> Price Per Unit:<%# Eval("Price_Per_Unit") %></p>
                                </a>

                          </td>  
                                
                                    
                                 
                            </ItemTemplate>

                            <FooterTemplate>
                                </ul>
                               </tr>
                                </table>
                            </FooterTemplate>
                           
                    
                    </asp:datalist>
                        </div>

                </div>
            </div>

        </div>
</asp:Content>

