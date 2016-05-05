<%@ Page Title="" Language="C#" MasterPageFile="~/App.Master" AutoEventWireup="true" CodeBehind="viewList.aspx.cs" Inherits="VersityFinalProject.settings.user.viewList" %>

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
            User View List
        </div>
        <div class="panel-body">

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
                                    <asp:LinkButton ID="ViewBtn" runat="server" CssClass="btn btn-info" ToolTip="View" Text="View" OnClick="ViewBtn_Click">
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('.dataTable').dataTable();
        });
    </script>
</asp:Content>