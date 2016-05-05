<%@ Page Title="" Language="C#" MasterPageFile="~/App.Master" AutoEventWireup="true" CodeBehind="view.aspx.cs" Inherits="VersityFinalProject.UI.makepostforblood.view" %>

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
            <i class="fa fa-eye-slash"></i>
            Your post looks like -
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-12">
                        <div class="form-group">
                            <h2 class="heading-three" style="text-decoration: underline">:. Need  <b>
                                <asp:Label runat="server" ID="bloodGroupLbl" CssClass="control-label"></asp:Label></b>  Blood .:
                            </h2>
                        </div>
                        <div class="col-md-12">
                            <div class="col-md-3">
                                <div class="image-preview">
                                    <asp:Image runat="server" ID="profileImage" CssClass="img-circle" Height="150" Width="130" />
                                </div>
                            </div>
                            <div class="col-md-9">
                                <div class="col-md-12">
                                    <div class="col-md-4"><i class="fa fa-user"></i><b>Name :</b></div>
                                    <div class="col-md-8">
                                        <asp:Label runat="server" ID="nameLbl" CssClass="control-label"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="col-md-4"><i class="fa fa-map-marker"></i><b>Location :</b></div>
                                    <div class="col-md-8">
                                        <asp:Label runat="server" ID="locationLbl" CssClass="control-label"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="col-md-4"><i class="fa fa-phone"></i><b>Contact Number :</b></div>
                                    <div class="col-md-8">
                                        <asp:Label runat="server" ID="contactNumberLbl" CssClass="control-label"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="col-md-4"><i class="fa fa-align-justify"></i><b>Description :</b></div>
                                    <div class="col-md-8">
                                        <asp:Label runat="server" ID="descriptionLbl" CssClass="control-label"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="col-md-4"><i class="fa fa-calendar-o"></i><b>Created Date :</b></div>
                                    <div class="col-md-8">
                                        <asp:Label runat="server" ID="createdDateLbl" CssClass="control-label"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="col-md-4"><i class="fa fa-calendar-o"></i><b>Last Date :</b></div>
                                    <div class="col-md-8">
                                        <asp:Label runat="server" ID="lastDateLbl" CssClass="control-label"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>