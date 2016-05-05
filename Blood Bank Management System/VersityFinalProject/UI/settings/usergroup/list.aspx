<%@ Page Title="" Language="C#" MasterPageFile="~/App.Master" AutoEventWireup="true" CodeBehind="list.aspx.cs" Inherits="VersityFinalProject.settings.usergroup.list" %>

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
            <i class="fa fa-th-list"></i>
            User Group List
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-md-12">
                    <asp:GridView ID="userGroupListGridView" AutoGenerateColumns="false" runat="server" CssClass="table table-bordered table-hover dataTable display" OnRowDataBound="userGroupListGridView_RowDataBound">
                        <Columns>
                            <asp:TemplateField Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="userGroupIdLabel" runat="server" Text='<%#Eval("UserGroupId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="UserGroupName" HeaderText="Group Name" />
                            <asp:BoundField DataField="Description" HeaderText="Description" />
                            <asp:BoundField DataField="IsActive" HeaderText="Is Active" />
                            <asp:BoundField DataField="IsDeleted" HeaderText="Is Deleted" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="EditBtn" runat="server" CssClass="btn btn-primary" ToolTip="Edit" OnClick="EditBtn_Click">
                                        <i class="fa fa-pencil-square-o"></i> Edit
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="activateBtn" runat="server" CssClass="btn btn-success" ToolTip="Activate" OnClick="activateBtn_Click">
                                        <i class="fa fa-check-square-o"></i> Activate
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="deactiveBtn" runat="server" CssClass="btn btn-warning" ToolTip="Deactive" OnClick="deactiveBtn_Click">
                                        <i class="fa fa-times"></i> Deactive
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="deleteBtn" runat="server" CssClass="btn btn-danger" ToolTip="Delete" OnClick="deleteBtn_Click">
                                        <i class="fa fa-trash-o"></i> Delete
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('.dataTable').dataTable();
        });
    </script>
</asp:Content>