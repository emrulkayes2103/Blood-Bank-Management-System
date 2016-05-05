<%@ Page Title="" Language="C#" MasterPageFile="~/App.Master" AutoEventWireup="true" CodeBehind="requestofblood.aspx.cs" Inherits="VersityFinalProject.UI.request.requestofblood" %>

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

    <asp:Repeater runat="server" ID="BloodRequestRepeter">
        <ItemTemplate>
            <div class="row state-overview">
                <div class="col-md-12">
                    <section class="panel">
                        <div class="symbol terques symbolConfigured">
                            <asp:Image runat="server" ID="profilePicImage" CssClass="img-circle" ImageUrl='<%#Eval("ImageUrl") %>' Height="130" Width="100" />
                        </div>
                        <div class="value valueConfigured">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="col-md-12">
                                        <h3 class="heading-three" style="text-decoration: underline; margin-top: 0px;">:. Need  <b>
                                            <asp:Label runat="server" ID="bloodGroupLbl" CssClass="control-label" Text='<%#Eval("BloodGroup") %>'></asp:Label></b>  Blood .:
                                        </h3>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="col-md-12">
                                        <div class="col-md-4"><i class="fa fa-user"></i><b>Name :</b></div>
                                        <div class="col-md-8">
                                            <asp:Label runat="server" ID="nameLbl" CssClass="control-label" Text='<%#Eval("Name") %>'></asp:Label>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="col-md-4"><i class="fa fa-map-marker"></i><b>Location :</b></div>
                                        <div class="col-md-8">
                                            <asp:Label runat="server" ID="locationLbl" CssClass="control-label" Text='<%#Eval("Location") %>'></asp:Label>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="col-md-4"><i class="fa fa-phone"></i><b>Contact Number :</b></div>
                                        <div class="col-md-8">
                                            <asp:Label runat="server" ID="contactNumberLbl" CssClass="control-label" Text='<%#Eval("ContactNumber") %>'></asp:Label>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="col-md-4"><i class="fa fa-align-justify"></i><b>Description :</b></div>
                                        <div class="col-md-8">
                                            <asp:Label runat="server" ID="descriptionLbl" CssClass="control-label" Text='<%#Eval("Description") %>'></asp:Label>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="col-md-4"><i class="fa fa-calendar-o"></i><b>Created Date :</b></div>
                                        <div class="col-md-8">
                                            <asp:Label runat="server" ID="createdDateLbl" CssClass="control-label" Text='<%#Eval("createdDate") %>'></asp:Label>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="col-md-4"><i class="fa fa-calendar-o"></i><b>Last Date :</b></div>
                                        <div class="col-md-8">
                                            <asp:Label runat="server" ID="lastDateLbl" CssClass="control-label" Text='<%#Eval("lastDate") %>'></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>