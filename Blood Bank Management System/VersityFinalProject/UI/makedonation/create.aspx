<%@ Page Title="" Language="C#" MasterPageFile="~/App.Master" AutoEventWireup="true" CodeBehind="create.aspx.cs" Inherits="VersityFinalProject.UI.makedonation.create" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headerContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
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
    <div class="panel panel-primary">
        <div class="panel-heading">
            <i class="fa fa-check-square-o"></i>

            Make Donation
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-4">
                        <label>Location :</label>
                        <asp:TextBox runat="server" ID="locationTxtBx" CssClass="form-control" required="required"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <label>Group of blood:</label>
                        <asp:DropDownList runat="server" ID="bloodGrpDrpDnList" CssClass="form-control">
                            <asp:ListItem Text="A+" Value="A+"></asp:ListItem>
                            <asp:ListItem Text="A-" Value="A-"></asp:ListItem>
                            <asp:ListItem Text="B+" Value="B+"></asp:ListItem>
                            <asp:ListItem Text="B-" Value="B-"></asp:ListItem>
                            <asp:ListItem Text="O+" Value="O+"></asp:ListItem>
                            <asp:ListItem Text="O+" Value="O+"></asp:ListItem>
                            <asp:ListItem Text="AB+" Value="AB+"></asp:ListItem>
                            <asp:ListItem Text="AB-" Value="AB-"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-4">
                        <label>Your age:</label>
                        <asp:TextBox runat="server" ID="ageTxtBx" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 30px;">

                <div class="col-md-12">

                    <div class="col-md-4">
                        <label>Status of donation:</label>
                        <asp:DropDownList runat="server" ID="StatusOfDonation" CssClass="form-control">
                            <asp:ListItem Text="I am a professional donner" Value="I am a professional donner"></asp:ListItem>
                            <asp:ListItem Text="Donating only for people welfear" Value="Donating only for people welfear"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-4">
                        <label>Gender:</label>
                        <asp:DropDownList runat="server" ID="genderDrpDwn" CssClass="form-control">
                            <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                            <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-4">
                        <label>Donaiton Date:</label>
                        <asp:TextBox runat="server" ID="donationDatetxtBx" CssClass="form-control default-date-picker"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 30px;">
                <div class="col-md-12">
                    <div class="col-md-4">
                        <asp:Button runat="server" ID="btnMakeDonation" CssClass="btn btn-primary" Text="Make Donation" OnClick="btnMakeDonation_OnClick" />
                    </div>
                    <div class="col-md-4">
                    </div>
                    <div class="col-md-4"></div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('.default-date-picker').datepicker({ autoclose: true, format: "dd/mm/yyyy" });
        });
    </script>
</asp:Content>