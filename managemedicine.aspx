<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="managemedicine.aspx.cs" Inherits="managemedicine" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Manage Medicine
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="container" style=" background-color: rgba(237,237,237,0.8); border-radius:5px; min-height:500px;">
            <div class="row" style="width:95%; margin-bottom: 10px">
                <div class="col-12 col-md-12" style="text-align: center;  font-size: 30px; padding-top:30px; padding-bottom:15px;">
                    <b>Medicine Management</b>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-2" style="margin-left:-90px;"></div>
                    <div class="col-md-5 col-12 col-lg-5">
                        <div class="form-group">
                            <label><b>Medicine Name</b></label>
                            <asp:TextBox runat="server" ID="txtMedicineName" CssClass="form-control" placeholder="Medice Name"/>
                            <asp:RequiredFieldValidator runat="server" ID="MedicineValidator" ControlToValidate="txtMedicineName" Text="Enter Medicine Name!" ForeColor="Red"/>
                        </div>
                    </div>
                
                    <div class="col-md-5 col-12 col-lg-5">
                        <div class="form-group">
                            <label><b>Price Per Unit</b></label>
                            <asp:TextBox runat="server" ID="txtppu" CssClass="form-control" placeholder="Price Per Unit" />
                            <asp:RequiredFieldValidator runat="server" ID="ppuValidator" ControlToValidate="txtppu" Text="Enter Price Per Unit!" ForeColor="Red"/>
                          </div>
                    </div>
                <div class="col-lg-2" style="margin-left:-90px;"></div>
                    <div class="col-md-5 col-12 col-lg-5">
                        <div class="form-group">
                            <label><b>Location</b></label>
                            <asp:TextBox runat="server" ID="txtLocation" CssClass="form-control"  placeholder="Location"/>
                            <asp:RequiredFieldValidator runat="server" ID="LocationValidator" ControlToValidate="txtLocation" Text="Enter Location!" ForeColor="Red"/>
               
                        </div>
                    </div>
                <div class="col-md-5 col-12 col-lg-5">
                        <div class="form-group">
                            <label><b>Expiry Date</b></label>
                            <asp:TextBox runat="server" ID="txtExpDate"  CssClass="form-control" placeholder="Date/Month/Year" MaxLength="10"/>
                            <asp:RequiredFieldValidator runat="server" display="Dynamic" ID="ExpDateValidator" ControlToValidate="txtExpDate" Text="Enter Expiry Date!" ForeColor="Red"/>
                            <asp:RegularExpressionValidator runat="server" ForeColor = "Red" ControlToValidate="txtExpDate" ValidationExpression="(((0|1)[0-9]|2[0-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$" ErrorMessage="Invalid Format."/>
                        </div>
                    </div>
<div class="col-lg-2" style="margin-left:-90px;"></div>
                 <div class="col-md-5 col-12 col-lg-5">
                        <div class="form-group">
                            <label><b>Medicine Company</b></label>
                           <asp:DropDownList runat="server" CssClass="form-control" ID="ddlcompany" >   
                           </asp:DropDownList>  
                        </div>
                    </div>
                    <div class="col-md-5 col-12 col-lg-5">
                        <div class="form-group">
                            <label><b>Quantity</b></label>
                            <asp:TextBox runat="server" ID="txtQuantity" CssClass="form-control"  placeholder="Quantity" />
                            <asp:RequiredFieldValidator runat="server" ID="QuantityValidator" ControlToValidate="txtQuantity" Text="Enter Quantity!" ForeColor="Red"/>
                        </div>
                    </div>    
                <div class="col-lg-2" style="margin-left:-90px;"></div>
                <div class="col-md-5 col-12 col-lg-5">
                        <div class="form-group">
                            <label><b>Description</b></label>
                            <asp:TextBox runat="server" ID="txtDescription" CssClass="form-control"  placeholder="Discription" TextMode="MultiLine" />
                           
                        </div>
                    </div>
                <div class="col-md-5 col-12 col-lg-5">
                         <div class="form-group">
                             <label><b>Select Image    </b></label><br />
                            <asp:FileUpload ID="FileUpload" runat="server" Font-Size="Medium" CssClass="form-control"  style="text-align:center;" Height="62px"/>
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


