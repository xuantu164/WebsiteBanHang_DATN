<%@ Page Title="" Language="C#" MasterPageFile="~/ClientBanHang/Client.Master" AutoEventWireup="true" CodeBehind="Dangnhap.aspx.cs" Inherits="WebsiteBanHang_DATN.ClientBanHang.Dangnhap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">

    <section class="section">
	<div class="container">
		<div class="wrap_background_aside page_login">
			<div class="row">
				<div class="col-lg-4 col-md-6 col-sm-12 col-xl-4 offset-0 offset-xl-4 offset-lg-4 offset-md-3 offset-xl-3 col-12" style="margin-left: 400px;margin-bottom: 50px;">
					<div class="row">
						<div class="page-login pagecustome clearfix">
							<div class="wpx">
								<h1 class="title_heads a-center"><span>Đăng nhập</span></h1>
								<span class="block a-center dkm margin-top-10 margin-bottom-15" style="margin-left: 27px;">Nếu bạn chưa có tài khoản, <a href="Dangki.aspx" class="btn-link-style btn-register">đăng ký tại đây</a></span>
								<div id="login" class="section">
									<form accept-charset="utf-8" action="/account/login" id="customer_login" method="post">
										<input name="FormType" type="hidden" value="customer_logi n">
										<input name="utf8" type="hidden" value="true">
									<span class="form-signup" style="color:red;">
										
									</span>
									<div class="form-signup clearfix">
										<fieldset class="form-group">
											<asp:TextBox ID="txtTaikhoan" runat="server" placeholder="Tài khoản" required CssClass="form-control form-control-lg" style="margin-top: 10px;"></asp:TextBox>
											<asp:RequiredFieldValidator ID="rfvTaiKhoan" ForeColor="Red" ControlToValidate="txtTaikhoan" runat="server" ErrorMessage="Tài khoản không được để trống!" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
											<%--<input type="text" class="form-control form-control-lg" value="" name="email" id="customer_email" placeholder="Tài khoản" required="" style="margin-top: 10px;">--%>
										</fieldset>
										<fieldset class="form-group">
											<asp:TextBox ID="txtMatkhau" runat="server" placeholder="Mật khẩu" required CssClass="form-control form-control-lg" TextMode="Password"></asp:TextBox>
											<asp:RequiredFieldValidator ID="rfvMatkhau" ForeColor="Red" ControlToValidate="txtMatkhau" runat="server" ErrorMessage="Mật khẩu không được để trống!" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
											<%--<input type="password" class="form-control form-control-lg" value="" name="password" id="customer_password" placeholder="Mật khẩu" required="">--%>
										</fieldset>
										<div class="pull-xs-left">
                                            <asp:Button ID="btnDangnhap" runat="server" Text="Đăng nhập" CssClass="btn btn-style btn_50" OnClick="btnDangnhap_Click"/>
											<%--<input class="btn btn-style btn_50" type="submit" value="Đăng nhập">--%>
											<span class="block a-center quenmk">Quên mật khẩu</span>
										</div>
									</div>
									</form>
								</div>
								
								<div class="h_recover" style="display:none;">
									<div id="recover-password" class="form-signup page-login">
										<form accept-charset="utf-8" action="/account/recover" id="recover_customer_password" method="post">
											<input name="FormType" type="hidden" value="recover_customer_password">
											<input name="utf8" type="hidden" value="true">
										<div class="form-signup" style="color: red;">
											
										</div>
										<div class="form-signup clearfix">
											<fieldset class="form-group">
												<input type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,63}$" class="form-control form-control-lg" value="" name="Email" id="recover-email" placeholder="Email" required="">
											</fieldset>
										</div>
										<div class="action_bottom">
											<input class="btn btn-style btn_50" style="margin-top: 0px;" type="submit" value="Lấy lại mật khẩu">

										</div>
										</form>
									</div>
								</div>
								<div class="block social-login--facebooks">
									<p class="a-center">
										Hoặc đăng nhập bằng
									</p>
									<script>function loginFacebook() { var a = { client_id: "947410958642584", redirect_uri: "https://store.mysapo.net/account/facebook_account_callback", state: JSON.stringify({ redirect_url: window.location.href }), scope: "email", response_type: "code" }, b = "https://www.facebook.com/v3.2/dialog/oauth" + encodeURIParams(a, !0); window.location.href = b } function loginGoogle() { var a = { client_id: "885968593373-197u9i4pte44vmvcc0j50pvhlfvl27ds.apps.googleusercontent.com", redirect_uri: "https://store.mysapo.net/account/google_account_callback", scope: "email profile https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile", access_type: "online", state: JSON.stringify({ redirect_url: window.location.href }), response_type: "code" }, b = "https://accounts.google.com/o/oauth2/v2/auth" + encodeURIParams(a, !0); window.location.href = b } function encodeURIParams(a, b) { var c = []; for (var d in a) if (a.hasOwnProperty(d)) { var e = a[d]; null != e && c.push(encodeURIComponent(d) + "=" + encodeURIComponent(e)) } return 0 == c.length ? "" : (b ? "?" : "") + c.join("&") }</script>
									<a href="javascript:void(0)" class="social-login--facebook" onclick="loginFacebook()"><img width="129px" height="37px" alt="facebook-login-button" src="//bizweb.dktcdn.net/assets/admin/images/login/fb-btn.svg"></a>
									<a href="javascript:void(0)" class="social-login--google" onclick="loginGoogle()"><img width="129px" height="37px" alt="google-login-button" src="//bizweb.dktcdn.net/assets/admin/images/login/gp-btn.svg"></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
</asp:Content>
