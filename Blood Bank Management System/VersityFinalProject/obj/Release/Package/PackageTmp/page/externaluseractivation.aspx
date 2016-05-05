<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="externaluseractivation.aspx.cs" Inherits="VersityFinalProject.page.externaluseractivation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headerContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <section class="transparent-bg" id="feature">
        <div class="container">
            <div class="center wow fadeInDown animated" style="visibility: visible; animation-name: fadeInDown;">
                <h2>Account Activation</h2>
                <p class="lead"><%--Be a volunteers and make great opportunity to help those people who need your help badly--%></p>
            </div>
            <div class="row">
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
                <div class="features">
                    <div class="col-md-12 wow fadeInDown animated">
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>