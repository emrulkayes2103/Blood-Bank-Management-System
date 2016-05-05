<%@ Page Title="" Language="C#" MasterPageFile="~/App.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="VersityFinalProject.UI.index" EnableEventValidation="false" %>

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
    <div class="row">
        <div class="col-md-12">
            <a href="/UI/makepostforblood/create.aspx">
                <div class="col-md-3">
                    <img class="box_dashboard" src="/content/img/go1.jpg" />
                </div>
            </a>
            <div class="col-md-1">
            </div>
            <a href="/UI/makedonation/create.aspx">
                <div class="col-md-3">
                    <img class="box_dashboard" src="/content/img/go2.jpg" />
                </div>
            </a>
            <div class="col-md-1">
            </div>
            <a href="/UI/request/requestofblood.aspx">
                <div class="col-md-3">
                    <img class="box_dashboard" src="/content/img/go3.jpg" />
                </div>
            </a>
            <div class="col-md-1">
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <a href="/UI/searchdonor/searchdonor.aspx">
                <div class="col-md-3">

                    <img class="box_dashboard" src="/content/img/go4.jpg" />
                </div>
            </a>
        </div>
    </div>
    <div class="row" id="FacebookUserModal" runat="server">
        <div class="col-md-12">
            <div class="modal fade " id="FacebookUserInfoModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <%-- <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>--%>
                            <h4 class="modal-title">Please Fill Bellow Forms To user our System</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Date Of Birth :</label>
                                            <asp:TextBox ID="dobTextBox" runat="server" data-date="12-02-2012" data-date-format="dd-mm-yyyy" data-date-viewmode="years" CssClass="form-control form-control-inline input-medium default-date-picker"></asp:TextBox>
                                        </div>
                                    </div>
                                    <%--<div class="col-md-6">
                                        <div class="form-group">
                                            <label>Gender :</label>
                                            <asp:DropDownList ID="genderDrpDwn" runat="server" CssClass="form-control">
                                                <asp:ListItem Text="--Select Gender--" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                                                <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>--%>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Nationality :</label>
                                            <asp:TextBox ID="nationalityTxtBX" runat="server" CssClass="form-control" required="required"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Contect Number :</label>
                                            <div class="input-group">
                                                <span class="input-group-addon">+880</span>
                                                <asp:TextBox ID="contactNumberTxtBx" runat="server" CssClass="form-control" required="required"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Present Address :(In Short)</label>
                                            <asp:TextBox ID="presentAddressTxtBx" TextMode="MultiLine" runat="server" CssClass="form-control" required="required" placeholder=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Blood Group :</label>
                                            <asp:DropDownList ID="bllodGroupDrpDwn" runat="server" CssClass="form-control">
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
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="control-label">
                                                Prefered Location For Donationg Blood :
                                            </label>
                                            <div>
                                                <asp:TextBox runat="server" ID="txtPreferedLocation" CssClass="form-control">
                                                </asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <%--<button data-dismiss="modal" class="btn btn-default" type="button">Close</button>--%>
                            <asp:Button ID="FaceBookUserDataSaveBtn" runat="server" Text="Save" CssClass="btn btn-success" OnClick="FaceBookUserDataSaveBtn_Click" />
                            <%--<button class="" type="button">Save changes</button>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <script type="text/javascript">
        $(function () {
            $(function loadModal() {
                $('#FacebookUserInfoModal').modal(
                    {
                        backdrop: 'static',
                        keyboard: false
                    }
                    );
            });
            $('.default-date-picker').datepicker({ autoclose: true, format: "dd/mm/yyyy" });
        });
    </script>
</asp:Content>