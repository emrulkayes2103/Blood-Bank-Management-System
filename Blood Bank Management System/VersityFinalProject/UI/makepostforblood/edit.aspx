<%@ Page Title="" Language="C#" MasterPageFile="~/App.Master" AutoEventWireup="true" CodeBehind="edit.aspx.cs" Inherits="VersityFinalProject.UI.makepostforblood.edit" %>

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
            <i class="fa fa-heart"></i>
            Edit your Post for finding blood
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-2">
                        <div class="form-group">
                            <label>Blood Group :</label>
                        </div>
                    </div>
                    <asp:HiddenField ID="HiddenFieldForPostSerial" runat="server" />
                    <div class="col-md-10">
                        <div class="form-group">
                            <asp:DropDownList ID="bllodGroupDrpDwn" runat="server" CssClass="form-control" required="required">
                                <asp:ListItem Text="--Select Bloog Group--" Value="0"></asp:ListItem>
                                <asp:ListItem Text="A+" Value="A+"></asp:ListItem>
                                <asp:ListItem Text="A-" Value="A-"></asp:ListItem>
                                <asp:ListItem Text="B+" Value="B+"></asp:ListItem>
                                <asp:ListItem Text="B-" Value="B-"></asp:ListItem>
                                <asp:ListItem Text="AB+" Value="AB+"></asp:ListItem>
                                <asp:ListItem Text="AB-" Value="AB-"></asp:ListItem>
                                <asp:ListItem Text="O+" Value="O+"></asp:ListItem>
                                <asp:ListItem Text="O-" Value="O-"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-md-2">
                        <div class="form-group">
                            <label>Contact Number :</label>
                        </div>
                    </div>
                    <div class="col-md-10">
                        <div class="form-group">
                            <asp:TextBox ID="contactNumberTxtBx" runat="server" CssClass="form-control" required="required"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-md-2">
                        <div class="form-group">
                            <label>Area :</label>
                        </div>
                    </div>
                    <div class="col-md-10">
                        <div class="form-group">
                            <asp:TextBox ID="areaTxtBx" runat="server" CssClass="form-control" required="required"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-md-2">
                        <div class="form-group">
                            <label>Last Date :</label>
                        </div>
                    </div>
                    <div class="col-md-10">
                        <div class="form-group">
                            <asp:TextBox ID="lastDateTxtBx" runat="server" data-date="12-02-2012" data-date-format="dd-mm-yyyy" data-date-viewmode="years" CssClass="form-control form-control-inline input-medium default-date-picker" required="required"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="col-md-12">

                    <div class="col-md-2">
                        <div class="form-group">
                            <label>Description :</label>
                        </div>
                    </div>
                    <div class="col-md-10">
                        <div class="form-group">
                            <asp:TextBox ID="descriptionTxtBx" CssClass="form-control" runat="server" TextMode="MultiLine" Height="200" required="required"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-12">
                        <asp:Button ID="PostUpdateBtn" runat="server" Text="Update Post" CssClass="btn btn-primary" OnClick="PostUpdateBtn_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('.default-date-picker').datepicker({
                autoclose: true,
                format: "dd/mm/yyyy",
            });
        });
    </script>
</asp:Content>