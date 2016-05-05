<%@ Page Title="" Language="C#" MasterPageFile="~/App.Master" AutoEventWireup="true" CodeBehind="view.aspx.cs" Inherits="VersityFinalProject.settings.user.view" %>

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
        <%--<div class="panel-heading">
                    <i class="fa fa-user"></i>
                    User View
                </div>--%>
        <div class="bio-graph-heading">
            <i class="fa fa-user"></i>
            User View
                   <div class="pull-right">
                       <a href="viewList.aspx" style="color: white">
                           <i class="fa fa-arrow-left fa-2x"></i>
                       </a>
                   </div>
        </div>
        <div class="panel-body bio-graph-info">

            <div class="row">
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="col-md-4">
                            </div>
                            <div class="col-md-4">
                                <asp:Image ID="profileImage" runat="server" Height="200" Width="200" />
                            </div>
                            <div class="col-md-4">
                            </div>
                        </div>
                    </div>
                    <div class="row" style="padding-top: 30px;">
                        <div class="bio-row">
                            <p>Name :
                                <asp:Label ID="nameLabel" runat="server" CssClass="userDetailsLabel"></asp:Label></p>
                        </div>
                        <div class="bio-row">
                            <p>Email :
                                <asp:Label ID="EmailLabel" runat="server" CssClass="userDetailsLabel"></asp:Label></p>
                        </div>

                        <div class="bio-row">
                            <p>Gender :
                                <asp:Label ID="GenderLabel" runat="server" CssClass="userDetailsLabel"></asp:Label></p>
                        </div>
                        <div class="bio-row">
                            <p>Blood Group :
                                <asp:Label ID="BloodGroupLabel" runat="server" CssClass="userDetailsLabel"></asp:Label></p>
                        </div>
                        <div class="bio-row">
                            <p>Contact Number :
                                <asp:Label ID="ContactNumberLabel" runat="server" CssClass="userDetailsLabel"></asp:Label></p>
                        </div>
                        <div class="bio-row">
                            <p>Father's Name :
                                <asp:Label ID="FataherNameLabel" runat="server" CssClass="userDetailsLabel"></asp:Label></p>
                        </div>
                        <div class="bio-row">
                            <p>Mother's Name :
                                <asp:Label ID="MothernameLabel" runat="server" CssClass="userDetailsLabel"></asp:Label></p>
                        </div>
                        <div class="bio-row">
                            <p>Nationality :
                                <asp:Label ID="NationalityLabel" runat="server" CssClass="userDetailsLabel"></asp:Label></p>
                        </div>
                        <div class="bio-row">
                            <p>National ID :
                                <asp:Label ID="nationalIDLabel" runat="server" CssClass="userDetailsLabel"></asp:Label></p>
                        </div>
                        <div class="bio-row">
                            <p>Permanent Address :
                                <asp:Label ID="permanentAddlabel" runat="server" CssClass="userDetailsLabel"></asp:Label></p>
                        </div>
                        <div class="bio-row">
                            <p>Present Address :
                                <asp:Label ID="presentAddLabel" runat="server" CssClass="userDetailsLabel"></asp:Label></p>
                        </div>
                        <div class="bio-row">
                            <p>Role as a user :
                                <asp:Label ID="userRoleLabel" runat="server" CssClass="userDetailsLabel"></asp:Label></p>
                        </div>
                        <div class="bio-row">
                            <p>Is Active :
                                <asp:Label ID="isActive" runat="server" CssClass="userDetailsLabel"></asp:Label></p>
                        </div>
                        <div class="bio-row">
                            <p>Date Of Birth :
                                <asp:Label ID="DOBLabel" runat="server" CssClass="userDetailsLabel"></asp:Label></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>