<%@ Page Title="" Language="C#" MasterPageFile="~/App.Master" AutoEventWireup="true" CodeBehind="list.aspx.cs" Inherits="VersityFinalProject.settings.user.list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headerContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <%--  <asp:UpdatePanel ID="updatePanel1" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
        <ContentTemplate>--%>
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
            User List
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-5">
                        <div class="form-group">
                            <label>List Type :</label>
                            <asp:DropDownList ID="listTypeDrpDwn" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="listTypeDrpDwn_SelectedIndexChanged">
                                <asp:ListItem Text="All" Value="All"></asp:ListItem>
                                <asp:ListItem Text="Active" Value="Active"></asp:ListItem>
                                <asp:ListItem Text="Deactive" Value="Deactive"></asp:ListItem>
                                <asp:ListItem Text="Deleted" Value="Deleted"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <%-- <div id="dynamic-table_wrapper" class="dataTables_wrapper form-inline" role="grid">--%>
                    <asp:GridView ID="userListGridView" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover dataTable display">
                        <Columns>
                            <asp:TemplateField HeaderText="#" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="serialLabel" runat="server" Text='<%#Eval("Serial") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Image">
                                <ItemTemplate>
                                    <asp:Image ID="imageLabaelInGrid" runat="server" ImageUrl='<%#"~/profileImage/"+Eval("profilePicName") %>' Height="60px" Width="80px" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Name" HeaderText="Name" />
                            <asp:BoundField DataField="Email" HeaderText="Email" />
                            <asp:BoundField DataField="Gender" HeaderText="Gender" />
                            <asp:TemplateField HeaderText="Contact Number">
                                <ItemTemplate>
                                    <asp:Label ID="ContactNumberLabel" runat="server" Text='<%# "+880"+Eval("ContactNumber") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="BloodGroup" HeaderText="Blood Group" />
                            <asp:BoundField DataField="IsActive" HeaderText="Is Active" />
                            <asp:BoundField DataField="isDeleted" HeaderText="Is Deleted" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="EditBtn" runat="server" CssClass="btn btn-default" ToolTip="Edit" OnClick="EditBtn_Click">
                                            <i class="fa fa-edit"></i>
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="ActiveBtn" runat="server" CssClass="btn btn-primary" ToolTip="Active" OnClick="ActiveBtn_Click">
                                            <i class="fa fa-check"></i>
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="DeactiveBtn" runat="server" CssClass="btn btn-warning" ToolTip="Deactive" OnClick="DeactiveBtn_Click">
                                            <i class="fa fa-times"></i>
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="DeleteBtn" runat="server" CssClass="btn btn-danger" ToolTip="Delete" OnClick="DeleteBtn_Click">
                                            <i class="fa fa-trash-o"></i>
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <%--</div>--%>
        </div>
    </div>

    <%-- </ContentTemplate>--%>

    <%--<Triggers>
            <asp:AsyncPostBackTrigger ControlID="EditBtn" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="ActiveBtn" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="DeactiveBtn" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="DeleteBtn" EventName="Click" />
               <asp:AsyncPostBackTrigger ControlID="listTypeDrpDwn" EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>--%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('.dataTable').dataTable();
        });
    </script>
</asp:Content>