<%@ Page Title="" Language="C#" MasterPageFile="~/App.Master" AutoEventWireup="true" CodeBehind="createMenuGroup.aspx.cs" Inherits="VersityFinalProject.settings.appMenu.createMenuGroup" %>

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
            <i class="fa fa-bars"></i>
            Create Menu Group
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>
                                Menu Placement :
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="menuPlacementDrpDwn" ValidationGroup="CreateMenu" InitialValue=""></asp:RequiredFieldValidator>
                            </label>
                            <asp:DropDownList ID="menuPlacementDrpDwn" runat="server" CssClass="form-control">
                                <asp:ListItem Text="--Select--" Value=""></asp:ListItem>
                                <asp:ListItem Text="Application" Value="Application"></asp:ListItem>
                                <asp:ListItem Text="Settings" Value="Settings"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Menu Group Name : <span class="small" style="color: red;">(Must be joind Word)</span></label>
                            <asp:TextBox ID="menuGrpNameTxtBX" runat="server" CssClass="form-control" required="required"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Menu Group Displaying Name :</label>
                            <asp:TextBox ID="menuGroupDisplayingNameTxtBX" runat="server" CssClass="form-control" required="required"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>
                                Menu Target :
                            </label>
                            <asp:DropDownList ID="menuTargetDrpDown" runat="server" CssClass="form-control">
                                <asp:ListItem Text="_blank" Value="_blank"></asp:ListItem>
                                <asp:ListItem Text="_self" Value="_self" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="_parent" Value="_parent"></asp:ListItem>
                                <asp:ListItem Text="_top" Value="_top"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Menu Group Icon</label>
                            <asp:TextBox ID="menuGroupIconTxtBX" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Menu Group Link </label>
                            <asp:TextBox ID="menuGroupLink" runat="server" CssClass="form-control" Text="javascript:;"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-4">
                        <div class="from-group">
                            <label>Description :</label>
                            <asp:TextBox ID="descriptionTxtBx" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <hr />
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-4">
                        <asp:Button ID="createMenugroupBtn" runat="server" Text="Create" CssClass="btn btn-primary" ValidationGroup="CreateMenu" OnClick="createMenugroupBtn_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>