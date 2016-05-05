<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="bevoulunteers.aspx.cs" Inherits="VersityFinalProject.page.bevoulunteers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headerContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <section class="transparent-bg" id="feature">
        <div class="container">
            <div class="center wow fadeInDown animated" style="visibility: visible; animation-name: fadeInDown;">
                <h2>Be Volunteers</h2>
                <p class="lead">Be a volunteers and make great opportunity to help those people who need your help badly</p>
            </div>
            <div class="row">
                <div class="row">
                    <div class="col-md-12">
                        <div id="msgBox" runat="server">
                            <div class="">
                                <button type="button" class="close close-sm" data-dismiss="alert">
                                    <i class="fa fa-times"></i>
                                </button>
                                <h4>
                                    <i class="fa fa-ok-sign"></i>
                                    <asp:Label ID="msgBoxTitle" runat="server" Text=""></asp:Label>
                                </h4>
                                <p>
                                    <asp:Label ID="msgBoxDetails" runat="server" Text=""></asp:Label>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="features">
                    <div class="col-md-12 wow fadeInDown animated">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>First Name :</label>
                                <asp:TextBox runat="server" ID="firstNameTxtBx" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Last Name :</label>
                                <asp:TextBox runat="server" ID="lastNameTxtBx" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 wow fadeInDown animated">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Email : <small style="color: green">N.B : Your email id is your username. If you can login with facebook then go to login</small></label>
                                <asp:TextBox runat="server" ID="emailTxtBx" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 wow fadeInDown">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Date of Birth :</label>
                                <asp:TextBox runat="server" ID="dobTxtBx" CssClass="form-control default-date-picker"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Gender :</label>
                                <asp:DropDownList runat="server" ID="genderDrpDwnList" CssClass="form-control">
                                    <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                                    <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                                    <asp:ListItem Text="Not Specified" Value="Not Specified"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Blood Group :</label>
                                <asp:DropDownList ID="bllodGroupDrpDwn" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="--Select Bloog Group--" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="A+" Value="A+"></asp:ListItem>
                                    <asp:ListItem Text="A-" Value="A-"></asp:ListItem>
                                    <asp:ListItem Text="B+" Value="B+"></asp:ListItem>
                                    <asp:ListItem Text="B-" Value="B-"></asp:ListItem>
                                    <asp:ListItem Text="AB+" Value="AB+"></asp:ListItem>
                                    <asp:ListItem Text="AB-" Value="AB-"></asp:ListItem>
                                    <asp:ListItem Text="O+" Value="O+"></asp:ListItem>
                                    <asp:ListItem Text="O-" Value="O-"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 wow fadeInDown">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Nationality :</label>
                                <asp:TextBox runat="server" ID="nationalityTxtBx" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Street Address :</label>
                                <asp:TextBox runat="server" ID="preferedAreasTxtBx" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>City :</label>
                                <asp:TextBox runat="server" ID="presentAddressTxtBx" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 wow fadeInDown">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Division :</label>
                                <asp:DropDownList runat="server" ID="preferedLocationDrpDwnList" CssClass="form-control">
                                    <asp:ListItem Text="Dhaka" Value="Dhaka"></asp:ListItem>
                                    <asp:ListItem Text="Rajshahi" Value="Rajshahi"></asp:ListItem>
                                    <asp:ListItem Text="Sylet" Value="Sylet"></asp:ListItem>
                                    <asp:ListItem Text="Chittagong" Value="Chittagong"></asp:ListItem>
                                    <asp:ListItem Text="Barisal" Value="Barisal"></asp:ListItem>
                                    <asp:ListItem Text="Rangpur" Value="Rangpur"></asp:ListItem>
                                    <asp:ListItem Text="Khulna" Value="Khulna"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Postal Code :</label>
                                <asp:TextBox runat="server" ID="postalCodeTxtBX" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Contact Number :</label>
                                <asp:TextBox runat="server" ID="ContactNumberTxtBx" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Password :</label>
                                <asp:TextBox runat="server" ID="passwordTxtBx" CssClass="form-control" TextMode="Password"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label>Confirm Password :</label>
                            <asp:TextBox runat="server" ID="reTypePass" CssClass="form-control" TextMode="Password"></asp:TextBox>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Image :</label>
                                <asp:FileUpload ID="profilePicture" runat="server" />
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 wow fadeInDown">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label></label>
                                <asp:Button runat="server" ID="btnRegisterNow" CssClass="btn btn-primary" Text="Register Now" OnClick="btnRegisterNow_OnClick" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('.default-date-picker').datepicker({ autoclose: true, format: "dd/mm/yyyy" });
        });
    </script>
</asp:Content>