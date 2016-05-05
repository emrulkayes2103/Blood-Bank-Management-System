<%@ Page Title="" Language="C#" MasterPageFile="~/App.Master" AutoEventWireup="true" CodeBehind="view.aspx.cs" Inherits="VersityFinalProject.settings.usergroup.view" %>

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
            <i class="fa fa-eye"></i>
            User Group View of <small class="small">[
                <asp:Label ID="userGroupIdLabel" runat="server"></asp:Label>
                ]</small>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-md-12">
                    <div class="bio-row">
                        <p><b>User Group Name : </b>
                            <asp:Label ID="UserGroupnameLabel" runat="server" CssClass="userDetailsLabel"></asp:Label></p>
                    </div>
                    <div class="bio-row">
                        <p><b>Description : </b>
                            <asp:Label ID="descripTionLabel" runat="server" CssClass="userDetailsLabel"></asp:Label></p>
                    </div>
                    <div class="bio-row">
                        <p><b>Is Active : </b>
                            <asp:Label ID="IsActiveLabel" runat="server" CssClass="userDetailsLabel"></asp:Label></p>
                    </div>
                    <div class="bio-row">
                        <p><b>Is Deletd : </b>
                            <asp:Label ID="IsDeletedLabael" runat="server" CssClass="userDetailsLabel"></asp:Label></p>
                    </div>
                    <div class="bio-row">
                        <p><b>Created By : </b>
                            <asp:Label ID="createdByLabel" runat="server" CssClass="userDetailsLabel"></asp:Label></p>
                    </div>
                    <div class="bio-row">
                        <p><b>Created Date : </b>
                            <asp:Label ID="createdDateLabel" runat="server" CssClass="userDetailsLabel"></asp:Label></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>