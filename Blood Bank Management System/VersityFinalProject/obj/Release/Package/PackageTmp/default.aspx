<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="VersityFinalProject._default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headerContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <section class="no-margin" id="main-slider">
        <div class="carousel slide">
            <ol class="carousel-indicators">
                <li class="active" data-slide-to="0" data-target="#main-slider"></li>
                <li data-slide-to="1" data-target="#main-slider"></li>
                <li data-slide-to="2" data-target="#main-slider"></li>
            </ol>
            <div class="carousel-inner">

                <div style="background-image: url(/sitecontent/images/slider/bg1.jpg); height: 400px;" class="item active">
                    <div class="container">
                        <div class="row slide-margin">
                            <div class="col-sm-6">
                                <div class="carousel-content">
                                    <h1 class="animation animated-item-1" style="color: black">Donate blood...Donate life.</h1>
                                    <h2 class="animation animated-item-2" style="color: black">Look me as I am..or watch me as I go for serving people.</h2>
                                </div>
                            </div>

                            <div class="col-sm-6 hidden-xs animation animated-item-4">
                                <div class="slider-img">
                                    <%--<img class="img-responsive" src="/sitecontent/images/slider/img1.jpg" />--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/.item-->

                <div style="background-image: url(/sitecontent/images/slider/bg2.jpg); height: 400px;" class="item">
                    <div class="container">
                        <div class="row slide-margin">
                            <div class="col-sm-6">
                                <div class="carousel-content">
                                    <h1 style="color: black" class="animation animated-item-1">Lorem ipsum dolor sit amet consectetur adipisicing elit</h1>
                                    <h2 style="color: black" class="animation animated-item-2">Accusantium doloremque laudantium totam rem aperiam, eaque ipsa...</h2>
                                    <%-- <a href="#" class="btn-slide animation animated-item-3">Read More</a>--%>
                                </div>
                            </div>

                            <div class="col-sm-6 hidden-xs animation animated-item-4">
                                <div class="slider-img">
                                    <%--<img class="img-responsive" src="/sitecontent/images/slider/img2.png" />--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/.item-->

                <div style="background-image: url(/sitecontent/images/slider/bg3.jpg); height: 400px;" class="item">
                    <div class="container">
                        <div class="row slide-margin">
                            <div class="col-sm-6">
                                <div class="carousel-content">
                                    <h1 style="color: black" class="animation animated-item-1">Lorem ipsum dolor sit amet consectetur adipisicing elit</h1>
                                    <h2 style="color: black" class="animation animated-item-2">Accusantium doloremque laudantium totam rem aperiam, eaque ipsa...</h2>
                                    <%-- <a href="#" class="btn-slide animation animated-item-3">Read More</a>--%>
                                </div>
                            </div>
                            <div class="col-sm-6 hidden-xs animation animated-item-4">
                                <div class="slider-img">
                                    <%-- <img class="img-responsive" src="/sitecontent/images/slider/img3.jpg" />--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/.item-->
            </div>
            <!--/.carousel-inner-->
        </div>
        <!--/.carousel-->
        <a data-slide="prev" href="#main-slider" class="prev hidden-xs">
            <i class="fa fa-chevron-left"></i>
        </a>
        <a data-slide="next" href="#main-slider" class="next hidden-xs">
            <i class="fa fa-chevron-right"></i>
        </a>
    </section>
    <section id="feature">
        <div class="container">
            <div class="center wow fadeInDown animated" style="visibility: visible; animation-name: fadeInDown;">
                <h2>Recent Post</h2>
                <p class="lead">All recent blood requests</p>
            </div>

            <div class="row">
                <div class="features">
                    <div class="row">
                        <div class="col-md-12">
                            <marquee>
                               <asp:Repeater runat="server" ID="recentPostRepeter">
                                 <ItemTemplate>
                                     <ol style="float: left; padding-right: 30px;">
                                             <li style="float: left; padding-right: 30px;list-style: none">
                                             <a href="#" target="_blank" style="float: left;">
                                                 <h2 class="heading-three" style="text-decoration: underline; margin-top: 0px;">:. Need  <b>
                                                     <asp:Label runat="server" ID="bloodGroupLbl" CssClass="control-label" Text='<%#Eval("BloodGroup") %>'></asp:Label></b>  Blood .:
                                            </h2>
                                             </a>
                                         </li>
                                     </ol>
                                 </ItemTemplate>
                               </asp:Repeater>
                           </marquee>
                        </div>
                    </div>
                </div>
                <!--/.services-->
            </div>
            <!--/.row-->
        </div>
        <!--/.container-->
    </section>
    <section id="recent-works">
        <div class="container">
            <div class="center wow fadeInDown animated" style="visibility: visible; animation-name: fadeInDown;">
                <h2>Recent Works</h2>
                <p class="lead">We did many campaign in recent days in various place for helping people which are not getting proper treatment.
                    <br>
                    We donated thousand bags of blood with the help of donner for patient in various campaign. </p>
            </div>

            <div class="row">
                <div class="col-xs-12 col-sm-4 col-md-3">
                    <div class="recent-work-wrap">
                        <img alt="" src="/sitecontent/images/portfolio/recent/item1.png" class="img-responsive">
                        <div class="overlay">
                            <div class="recent-work-inner">
                                <h3><a href="#">Recent activities</a> </h3>
                                <p>A Donner donating blood for a patients in a hospital.</p>
                                <a rel="prettyPhoto" href="/sitecontent/images/portfolio/recent/item1.png" class="preview"><i class="fa fa-eye"></i>View</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xs-12 col-sm-4 col-md-3">
                    <div class="recent-work-wrap">
                        <img alt="" src="/sitecontent/images/portfolio/recent/item2.png" class="img-responsive">
                        <div class="overlay">
                            <div class="recent-work-inner">
                                <h3><a href="#">Recent activities</a></h3>
                                <p>Blood donation campaign , memorising late kazi azhar ali sir.</p>
                                <a rel="prettyPhoto" href="/sitecontent/images/portfolio/recent/item2.png" class="preview"><i class="fa fa-eye"></i>View</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xs-12 col-sm-4 col-md-3">
                    <div class="recent-work-wrap">
                        <img alt="" src="/sitecontent/images/portfolio/recent/item3.png" class="img-responsive">
                        <div class="overlay">
                            <div class="recent-work-inner">
                                <h3><a href="#">Recent activities </a></h3>
                                <p>Specialist medical staff are on hand at all times during the donation.</p>
                                <a rel="prettyPhoto" href="/sitecontent/images/portfolio/recent/item3.png" class="preview"><i class="fa fa-eye"></i>View</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xs-12 col-sm-4 col-md-3">
                    <div class="recent-work-wrap">
                        <img alt="" src="/sitecontent/images/portfolio/recent/item4.png" class="img-responsive">
                        <div class="overlay">
                            <div class="recent-work-inner">
                                <h3><a href="#">Recent activities </a></h3>
                                <p>Blood donation camp with the help of redcrecent socity.</p>
                                <a rel="prettyPhoto" href="/sitecontent/images/portfolio/recent/item4.png" class="preview"><i class="fa fa-eye"></i>View</a>
                            </div>
                        </div>
                    </div>
                </div>

                <%--  <div class="col-xs-12 col-sm-4 col-md-3">
                    <div class="recent-work-wrap">
                        <img alt="" src="/sitecontent/images/portfolio/recent/item5.png" class="img-responsive">
                        <div class="overlay">
                            <div class="recent-work-inner">
                                <h3><a href="#">Recent activities</a></h3>
                                <p>Blood donation camp in dmc.</p>
                                <a rel="prettyPhoto" href="/sitecontent/images/portfolio/recent/item5.png" class="preview"><i class="fa fa-eye"></i> View</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xs-12 col-sm-4 col-md-3">
                    <div class="recent-work-wrap">
                        <img alt="" src="/sitecontent/images/portfolio/recent/item6.png" class="img-responsive">
                        <div class="overlay">
                            <div class="recent-work-inner">
                                <h3><a href="#">Recent activities</a></h3>
                                <p>Donner come to donate blood , informed from our site.</p>
                                <a rel="prettyPhoto" href="/sitecontent/images/portfolio/recent/item6.png" class="preview"><i class="fa fa-eye"></i> View</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xs-12 col-sm-4 col-md-3">
                    <div class="recent-work-wrap">
                        <img alt="" src="/sitecontent/images/portfolio/recent/item7.png" class="img-responsive">
                        <div class="overlay">
                            <div class="recent-work-inner">
                                <h3><a href="#">Recent activities</a></h3>
                                <p>Donners are donating blood. </p>
                                <a rel="prettyPhoto" href="/sitecontent/images/portfolio/recent/item7.png" class="preview"><i class="fa fa-eye"></i> View</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xs-12 col-sm-4 col-md-3">
                    <div class="recent-work-wrap">
                        <img alt="" src="/sitecontent/images/portfolio/recent/item8.png" class="img-responsive">
                        <div class="overlay">
                            <div class="recent-work-inner">
                                <h3><a href="#">Recent activities </a></h3>
                                <p>Online registration in our site. Helping mind of people.</p>
                                <a rel="prettyPhoto" href="/sitecontent/images/portfolio/recent/item8.png" class="preview"><i class="fa fa-eye"></i> View</a>
                            </div>
                        </div>
                    </div>
                </div>   --%>
            </div>
            <!--/.row-->
        </div>
        <!--/.container-->
    </section>
    <section class="service-item" id="services">
        <div class="container">
            <div class="center wow fadeInDown animated" style="visibility: visible; animation-name: fadeInDown;">
                <h2>Our Service</h2>
                <p class="lead">We are creating a waya to get life saving help like Blood by Donner for those which need blood for their patients
                    <br>
                    Via online social service.</p>
            </div>

            <div class="row">

                <div class="col-sm-6 col-md-4">
                    <div class="media services-wrap wow fadeInDown animated" style="visibility: visible; animation-name: fadeInDown;">
                        <div class="pull-left">
                            <img src="/sitecontent/images/services/services1.png" class="img-responsive">
                        </div>
                        <div class="media-body">
                            <h3 class="media-heading">Donating blood</h3>
                            <p>We are linking up the patient and the donner.</p>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 col-md-4">
                    <div class="media services-wrap wow fadeInDown animated" style="visibility: visible; animation-name: fadeInDown;">
                        <div class="pull-left">
                            <img src="/sitecontent/images/services/services2.png" class="img-responsive">
                        </div>
                        <div class="media-body">
                            <h3 class="media-heading">Time management</h3>
                            <p>We are notifing donner in the time the patient need blood.</p>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 col-md-4">
                    <div class="media services-wrap wow fadeInDown animated" style="visibility: visible; animation-name: fadeInDown;">
                        <div class="pull-left">
                            <img src="/sitecontent/images/services/services3.png" class="img-responsive">
                        </div>
                        <div class="media-body">
                            <h3 class="media-heading">Administration</h3>
                            <p>Operating system with concious people. </p>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 col-md-4">
                    <div class="media services-wrap wow fadeInDown animated" style="visibility: visible; animation-name: fadeInDown;">
                        <div class="pull-left">
                            <img src="/sitecontent/images/services/services4.png" class="img-responsive">
                        </div>
                        <div class="media-body">
                            <h3 class="media-heading">Activities</h3>
                            <p>Helping helpless without any profit.</p>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 col-md-4">
                    <div class="media services-wrap wow fadeInDown animated" style="visibility: visible; animation-name: fadeInDown;">
                        <div class="pull-left">
                            <img src="/sitecontent/images/services/services5.png" class="img-responsive">
                        </div>
                        <div class="media-body">
                            <h3 class="media-heading">Vision</h3>
                            <p>Getting patient and donner closer.</p>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 col-md-4">
                    <div class="media services-wrap wow fadeInDown animated" style="visibility: visible; animation-name: fadeInDown;">
                        <div class="pull-left">
                            <img src="/sitecontent/images/services/services6.png" class="img-responsive">
                        </div>
                        <div class="media-body">
                            <h3 class="media-heading">Feedback</h3>
                            <p>Atleast 100 donation in a week. </p>
                        </div>
                    </div>
                </div>
            </div>
            <!--/.row-->
        </div>
        <!--/.container-->
    </section>

    <section id="conatcat-info">
        <div class="container">
            <%--<div class="row">
                <div class="col-sm-8">
                    <div data-wow-delay="600ms" data-wow-duration="1000ms" class="media contact-info wow fadeInDown animated" style="visibility: visible; animation-duration: 1000ms; animation-delay: 600ms; animation-name: fadeInDown;">
                        <div class="pull-left">
                            <i class="fa fa-phone"></i>
                        </div>
                        <div class="media-body">
                            <h2>Have a question or need a custom quote?</h2>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation +0123 456 70 80</p>
                        </div>
                    </div>
                </div>
            </div>--%>
        </div>
        <!--/.container-->
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>