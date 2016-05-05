<%@ Page Title="" Language="C#" MasterPageFile="~/App.Master" AutoEventWireup="true" CodeBehind="edit.aspx.cs" Inherits="VersityFinalProject.UI.Profile.edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headerContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <asp:UpdatePanel ID="updatePanel1" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
        <ContentTemplate>
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
                    <i class="fa fa-pencil-square-o"></i>
                    Edit Profile
                </div>
                <div class="panel-body">
                    <asp:Panel ID="panelForEmailUser" runat="server">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Name :</label>
                                <asp:TextBox ID="NameTextBx" runat="server" CssClass="form-control" required="required"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Email :</label>
                                <asp:TextBox ID="emailtextBX" ReadOnly="true" runat="server" CssClass="form-control" required="required"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Date Of Birth :</label>
                                <asp:TextBox ID="dobTextBox" runat="server" data-date="12-02-2012" data-date-format="dd-mm-yyyy" data-date-viewmode="years" CssClass="form-control form-control-inline input-medium default-date-picker" required="required"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Contect Number :</label>
                                <div class="input-group">
                                    <span class="input-group-addon">+880</span>
                                    <asp:TextBox ID="contactNumberTxtBx" runat="server" CssClass="form-control" required="required"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Gender :</label>
                                        <asp:DropDownList ID="genderDrpDwn" runat="server" CssClass="form-control">
                                            <asp:ListItem Text="--Select Gender--" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                                            <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-3">
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
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Nationality :</label>
                                        <asp:TextBox ID="nationalityTxtBX" runat="server" CssClass="form-control" required="required"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>National ID :(If You Have)</label>
                                        <asp:TextBox ID="nationalIdtxtBx" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Present Address :</label>
                                        <asp:TextBox ID="presentAddressTxtBx" TextMode="MultiLine" runat="server" CssClass="form-control" required="required" placeholder=""></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Permanent Address :</label>
                                        <asp:TextBox ID="permanentAddressTxtBx" TextMode="MultiLine" runat="server" CssClass="form-control" required="required" placeholder=""></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Father's Name :</label>
                                        <asp:TextBox ID="fNameTxtBox" runat="server" CssClass="form-control" required="required"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Mother's Name :</label>
                                        <asp:TextBox ID="mNameTextBX" runat="server" CssClass="form-control" required="required"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Profile Picture :</label>
                                        <asp:FileUpload ID="profilePicture" runat="server" />
                                    </div>
                                </div>
                                <div class="row clearfix">
                                    <div class="col-md-12">
                                        <div class="col-md-3">
                                            <asp:Button ID="updateBtn" runat="server" Text="Update" CssClass="btn btn-primary" OnClick="updateBtn_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="PanelForFacebookuser" runat="server">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Date Of Birth :</label>
                                        <asp:TextBox ID="dateTextBxForFBUser" runat="server" data-date="12-02-2012" data-date-format="dd-mm-yyyy" data-date-viewmode="years" CssClass="form-control form-control-inline input-medium default-date-picker"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Nationality :</label>
                                        <asp:TextBox ID="NationalityTxtBxForFbUser" runat="server" CssClass="form-control" required="required"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Contect Number :</label>
                                        <div class="input-group">
                                            <span class="input-group-addon">+880</span>
                                            <asp:TextBox ID="ContactNumberTxtBxForFbUser" runat="server" CssClass="form-control" required="required"></asp:TextBox>
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
                                        <asp:TextBox ID="PresentAddressForDbUser" TextMode="MultiLine" runat="server" CssClass="form-control" required="required" placeholder=""></asp:TextBox>
                                    </div>
                                </div>
                                <asp:HiddenField ID="HiddenFieldForFacebookUserId" runat="server" />
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Blood Group :</label>
                                        <asp:DropDownList ID="BloodGroupForFaceBookUser" runat="server" CssClass="form-control">
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
                        <div class="row clearfix">
                            <div class="col-md-12">
                                <div class="col-md-3">
                                    <asp:Button ID="UpdateBtnForFbUser" runat="server" Text="Update" CssClass="btn btn-primary" OnClick="UpdateBtnForFbUser_Click" />
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="updateBtn" />
            <asp:PostBackTrigger ControlID="UpdateBtnForFbUser" />
            <%--<asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />--%>
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('.default-date-picker').datepicker({ autoclose: true, format: "dd/mm/yyyy" });
        });
    </script>
</asp:Content>