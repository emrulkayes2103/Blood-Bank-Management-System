<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="donorlist.aspx.cs" Inherits="VersityFinalProject.page.donorlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headerContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <section class="transparent-bg" id="feature">
        <div class="container">

            <div class="center wow fadeInDown animated" style="visibility: visible; animation-name: fadeInDown;">
                <h2>Our Donors </h2>
                <p class="lead">Find Donors of our system</p>
            </div>
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
            <div class="row wow fadeInDown">
                <div class="col-md-12">
                    <div class="col-md-1"></div>
                    <div class="col-md-3">
                        <label>Blood Group :</label>
                        <asp:DropDownList ID="bllodGroupDrpDwn" runat="server" CssClass="form-control">
                            <asp:ListItem Text="--Select Blood Group--" Value="0"></asp:ListItem>
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
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>Division :</label>
                            <asp:DropDownList runat="server" ID="preferedLocationDrpDwnList" CssClass="form-control">
                                <asp:ListItem Text="Dhaka" Value="Dhaka"></asp:ListItem>
                                <asp:ListItem Text="Rajshahi" Value="Rajshahi"></asp:ListItem>
                                <asp:ListItem Text="Sylet" Value="Sylet"></asp:ListItem>
                                <asp:ListItem Text="Chittagong" Value="Chittagong"></asp:ListItem>
                                <asp:ListItem Text="Barisal" Value="Barisal"></asp:ListItem>
                                <asp:ListItem Text="Rangpur" Value="Rangpur"></asp:ListItem>
                                <asp:ListItem Text="Khulna" Value="Khulna"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>Location :</label>
                            <asp:TextBox runat="server" ID="locationTxtBx" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-2" style="padding-top: 1%;">
                        <div class="form-group">
                            <label></label>
                            <asp:Button runat="server" ID="btnSearch" CssClass="btn-default btn-primary" Text="Search" OnClick="btnSearch_OnClick" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="row wow fadeInDown">
                <asp:Repeater runat="server" ID="DonorRepeter" OnItemDataBound="DonorRepeter_OnItemDataBound">
                    <ItemTemplate>
                        <div class="row">
                            <div class="col-md-12">
                                <div style="visibility: visible; animation-name: fadeInDown;" class="media services-wrap wow fadeInDown animated animated">
                                    <div id="listOfVollunteers" class="listOfVollunteers">
                                        <div id="StatusSection" class="StatusSection">

                                            <div id="imageSection" class="imageSection">

                                                <div id="fbLogo" runat="server" style="float: left; height: 20px; width: 20px;">
                                                    <i class="fa fa-facebook-square" style="color: #3b5998"></i>
                                                </div>
                                            </div>
                                            <div id="locationAndAge" class="locationAndAge">
                                                <div id="locationIcon" class="locationIcon">
                                                    <img src="~/sitecontent/img/location.png" runat="server" style="height: 20px; width: 20px; margin-left: 40%;" />
                                                </div>
                                                <div id="locationName" class="locationName">
                                                    <asp:Label ID="userlocationName" runat="server" Text='<%#Eval("PermanentAdd") %>'></asp:Label>
                                                </div>
                                                <div id="ageBlood" class="ageBlood">
                                                    <span class="spnClass">Age</span>
                                                    <asp:Label ID="lblAge" runat="server" CssClass="lblStatusInfo" Text='<%#Eval("Age") %>'></asp:Label>
                                                    <span class="spnClass">Group</span>
                                                    <asp:Label ID="lblGroup" runat="server" CssClass="lblStatusInfo" Text='<%#Eval("BloodGroup") %>'></asp:Label>
                                                </div>
                                            </div>
                                            <div id="status" class="status">
                                                <span class="spnstatus">Available For</span>
                                                <br />
                                                --<asp:Label ID="lblAvailAbleFor" Style="font-family: Tahoma; font-size: 15px; color: #808080;" runat="server" Text='<%#Eval("PreferedLocation") %>'></asp:Label>
                                                <br />
                                                <span class="spnstatus">Donation Status</span>
                                                <br />
                                                <span style="color: #33ce3f; font-family: Tahoma; font-size: 15px;">

                                                    <b>
                                                        <asp:Label runat="server" ID="statusLbl" Style="font-family: Tahoma; font-size: 15px;" Text='<%#Eval("DonationStat") %>' ForeColor='<%# (Eval("DonationStat").Equals("Available")) ?  System.Drawing.Color.Green : System.Drawing.Color.Red %>'></asp:Label></b>
                                                </span>
                                            </div>
                                        </div>
                                        <div id="userInfo" class="userInfo">
                                            <div id="name" class="name">
                                                <asp:HyperLink ID="lblName" CssClass="lblName" runat="server" Text='<%#Eval("Name") %>'></asp:HyperLink>
                                            </div>
                                            <div id="mobileNUmber" class="mobileNumber">
                                                <div id="icon" class="icon">
                                                    <img src="/sitecontent/img/call.png" style="height: 30px; width: 30px; margin-top: 10px;" />
                                                </div>
                                                <div id="number" class="number">
                                                    <asp:Label ID="lblNumber" CssClass="lblNumber" runat="server" Text='<%#Eval("ContactNumber") %>'></asp:Label>
                                                </div>
                                            </div>
                                            <div id="email" class="email">
                                                <div id="emialIOcon" class="icon">
                                                    <img src="~/sitecontent/img/mail.gif" runat="server" style="height: 30px; width: 30px; margin-top: 10px;" />
                                                </div>
                                                <div id="lblMail" class="number">

                                                    <asp:Label ID="lblEmail" runat="server" CssClass="lblNumber" Text='<%#Eval("email")%>'></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>