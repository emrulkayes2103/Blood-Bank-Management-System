<%@ Page Title="" Language="C#" MasterPageFile="~/App.Master" AutoEventWireup="true" CodeBehind="update.aspx.cs" Inherits="VersityFinalProject.settings.usergroup.update" %>

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
            <i class="fa fa-users"></i>
            Create User Group
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>User Group Name :</label>
                            <asp:TextBox ID="userGroupNameTxtBx" runat="server" CssClass="form-control" required="required"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Description :</label>
                            <asp:TextBox ID="descriptionTxtBx" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-3">
                        <asp:Button ID="updateUserGroup" runat="server" Text="Update" CssClass="btn btn-primary" OnClick="updateUserGroup_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>