<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="VersityFinalProject.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>VSFP</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="" />
    <link href="/content/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/content/css/bootstrap-reset.css" rel="stylesheet" />
    <!--external css-->
    <link href="/content/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <!-- Custom styles for this template -->
    <link href="/content/css/style.css" rel="stylesheet" />
    <link href="/content/css/style-responsive.css" rel="stylesheet" />
</head>
<%--<body class="login-body">
    <form id="form1" runat="server">
<div class="container">

        <h2 class="form-signin-heading">sign in now</h2>
        <div class="login-wrap">
            <input type="text" class="form-control" placeholder="User ID" autofocus>
            <input type="password" class="form-control" placeholder="Password">
            <label class="checkbox">
                <input type="checkbox" value="remember-me"> Remember me
                <span class="pull-right">
                    <a data-toggle="modal" href="login.html#myModal"> Forgot Password?</a>
                </span>
            </label>
            <button class="btn btn-lg btn-login btn-block" type="submit">Sign in</button>
            <p>or you can sign in via social network</p>
            <div class="login-social-link">
                <a href="index.html" class="facebook">
                    <i class="fa fa-facebook"></i>
                    Facebook
                </a>
                <a href="index.html" class="twitter">
                    <i class="fa fa-twitter"></i>
                    Twitter
                </a>
            </div>
            <div class="registration">
                Don't have an account yet?
                <a class="" href="registration.html">
                    Create an account
                </a>
            </div>
        </div>

          <!-- Modal -->
          <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
              <div class="modal-dialog">
                  <div class="modal-content">
                      <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                          <h4 class="modal-title">Forgot Password ?</h4>
                      </div>
                      <div class="modal-body">
                          <p>Enter your e-mail address below to reset your password.</p>
                          <input type="text" name="email" placeholder="Email" autocomplete="off" class="form-control placeholder-no-fix">
                      </div>
                      <div class="modal-footer">
                          <button data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>
                          <button class="btn btn-success" type="button">Submit</button>
                      </div>
                  </div>
              </div>
          </div>
    </div>

          <!-- modal -->
    <!-- js placed at the end of the document so the pages load faster -->
    <script src="/content/js/jquery.js"></script>
    <script src="/content/js/bootstrap.min.js"></script>
    </form>
</body>--%>

<body class="login-body">

    <div class="container">

        <form class="form-signin" id="mainForm" runat="server">
            <h2 class="form-signin-heading">sign in now</h2>
            <div class="login-wrap">
                <asp:TextBox ID="userIdTxtBx" runat="server" CssClass="form-control" placeholder="Enter your Email ID" autofocus="autofocus" required="required"></asp:TextBox>
                <asp:TextBox ID="passwordTxtBX" runat="server" CssClass="form-control" placeholder="Enter Password" required="required" TextMode="Password"></asp:TextBox>

                <label class="checkbox">
                    <asp:CheckBox ID="rememberMeChkBox" runat="server" Text="Remember me" CssClass="checkbox-inline" />

                    <span class="pull-right">
                        <a data-toggle="modal" href="login.aspx#myModal">Forgot Password?</a>
                    </span>
                </label>
                <asp:Button ID="btnLogIn" runat="server" CssClass="btn btn-lg btn-login btn-block" Text="Sign In" OnClick="btnLogIn_Click" />
                <p>
                    <asp:Label ID="logInErrorMsg" runat="server" ForeColor="Red"></asp:Label></p>
                <p>or you can sign in via social network</p>
                <div class="login-social-link">
                    <asp:LinkButton ID="FaceBookLogInBtn" runat="server" CssClass="facebook" OnClick="FaceBookLogInBtn_Click">
                    <i class="fa fa-facebook"></i>
                    Facebook
                    </asp:LinkButton>

                    <a href="#" class="twitter">
                        <i class="fa fa-twitter"></i>
                        Twitter
                    </a>
                </div>
                <%--<div class="registration">
                Don't have an account yet?
                <a class="" href="registration.html">
                    Create an account
                </a>
            </div>--%>
            </div>

            <!-- Modal -->
            <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title">Forgot Password ?</h4>
                        </div>
                        <div class="modal-body">
                            <p>Enter your e-mail address below to reset your password.</p>
                            <asp:TextBox ID="forgottenEmailId" runat="server" placeholder="Email" autocomplete="off" class="form-control placeholder-no-fix"></asp:TextBox>
                        </div>
                        <div class="modal-footer">
                            <button data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>
                            <asp:Button ID="forgotPassBtn" runat="server" Text="Submit" CssClass="btn btn-success" />
                        </div>
                    </div>
                </div>
            </div>
            <!-- modal -->
        </form>
    </div>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="/content/js/jquery.js"></script>
    <script src="/content/js/bootstrap.min.js"></script>
</body>
</html>