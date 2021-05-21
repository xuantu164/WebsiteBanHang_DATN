<%@ Page Title="" Language="C#" MasterPageFile="~/ClientBanHang/Client.Master" AutoEventWireup="true" CodeBehind="Dangki.aspx.cs" Inherits="WebsiteBanHang_DATN.ClientBanHang.Dangki" %>
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
	<div class="container ">
		<div class="wrap_background_aside  page_login">
			<div class="wrap_background_aside">
				<div class="row">
					<div class="col-lg-4 col-md-6 col-sm-12 col-12 col-xl-4 offset-xl-4 offset-lg-4 offset-md-3 offset-xl-3" style="margin-left: 400px;margin-bottom: 50px;">
						<div class="row">
							<div class="page-login pagecustome clearfix">
								<div class="wpx">
									<h1 class="title_heads a-center"><span>Đăng ký</span></h1>
									<span class="block a-center dkm margin-top-10 margin-bottom-15" style="margin-left: 55px;margin-bottom: 22px;">Đã có tài khoản, đăng nhập <a href="Dangnhap.aspx" class="btn-link-style btn-register">tại đây</a></span>
									<div id="login" class="section">
										<form accept-charset="utf-8" action="/account/register" id="customer_register" method="post">
											<input name="FormType" type="hidden" value="customer_register">
											<input name="utf8" type="hidden" value="true"><input type="hidden" id="Token-1ba880a701f1466cbdd47eee6022e26e" name="Token" value="03AGdBq27Jc-RZ986Ku0tI41YWd_0j48E6IHC3CLEqG_3qTfFa5GhU6JgnNl6NQmAUMsc-ymXGteRbuzzOd5W8YojjSAyzXpRt6bREVTrtJTn76nev9K7W8IHnLx8z3ZhXJ5FTb2oyLuaYfUSpRF8ZXg4JhOtFav48XWHZG2WiuP-anLxOHbOyDTZw8N-nqpOrIyrTTMC3Ymsk17vJ2ZLs-TGxgtYNVz6UfIi7wYa6VA7d8_uLQn2QLyLapRtKyWnDb7FH1w8tWClcQetN-PAcI71F30y8Ww3F-mGW7QBncJYJC9LDkz71fccuSpUmW5Cv0tJEnu5KDwFtidFZRm-mwEAQjqW2lPGYIa0M-PZiBLN7WV728REi-4yy24OL8buSpSoG49wi5WpLPLt2I56mw8EzJm7ti8njpNY24B3D1jvpXqrmV2BNcE3lNBGIoL0p81iYFS5PP6cCI-WNR3gskATpk-8Pt2cK-3K6caTFIqM-efLHkI8dPfXPr-uUQtTG6ISIp_Jw-RLILO2pr9v48rH9sRFKkJRhH8OdNYH60NqrS68qo7wmbWc"><script src="https://www.google.com/recaptcha/api.js?render=6Ldtu4IUAAAAAMQzG1gCw3wFlx_GytlZyLrXcsuK"></script>
										<div class="form-signup " style="color:red;">
											
										</div>
										<div class="form-signup clearfix">
											<div class="row">
												<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12" style="margin-top: 10px;">
													<fieldset class="form-group">
                                                        <asp:TextBox ID="txtHoten" runat="server" CssClass="form-control form-control-lg" placeholder="Họ tên" required></asp:TextBox>
													</fieldset>
												</div>
											</div>
											<div class="row">
												<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
													<fieldset class="form-group">
                                                        <asp:TextBox ID="txtEmail" TextMode="Email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,63}$" runat="server" CssClass="form-control form-control-lg" placeholder="Email" ></asp:TextBox>
													</fieldset>
												</div>
												<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
													<fieldset class="form-group">	
														 <asp:TextBox ID="txtSdt" runat="server" TextMode="Phone" CssClass="form-control form-control-lg" placeholder="Số điện thoại" required></asp:TextBox>
													</fieldset>
												</div>
												<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
													<fieldset class="form-group">
														<asp:TextBox ID="txtTaikhoan" runat="server" CssClass="form-control form-control-lg" placeholder="Tài khoản" required></asp:TextBox>
													</fieldset>
												</div>
												<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
													<fieldset class="form-group">
														<asp:TextBox ID="txtMatkhau" runat="server" TextMode="Password" CssClass="form-control form-control-lg" placeholder="Mật khẩu" required></asp:TextBox>
													</fieldset>
												</div>
												<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
													<fieldset class="form-group">
														<asp:TextBox ID="txtDiachi" runat="server" CssClass="form-control form-control-lg" placeholder="Địa chỉ giao hàng" required></asp:TextBox>
													</fieldset>
												</div>
											</div>
											<div class="section">
                                                <asp:Button ID="btnDangki" runat="server" Text="Đăng ký" CssClass="btn  btn-style btn_50" OnClick="btnDangki_Click"/>
											</div>
										</div>
										</form>
										<div class="block social-login--facebooks">
											<p class="a-center">
												Hoặc đăng nhập bằng
											</p>
											<script>function loginFacebook(){var a={client_id:"947410958642584",redirect_uri:"https://store.mysapo.net/account/facebook_account_callback",state:JSON.stringify({redirect_url:window.location.href}),scope:"email",response_type:"code"},b="https://www.facebook.com/v3.2/dialog/oauth"+encodeURIParams(a,!0);window.location.href=b}function loginGoogle(){var a={client_id:"885968593373-197u9i4pte44vmvcc0j50pvhlfvl27ds.apps.googleusercontent.com",redirect_uri:"https://store.mysapo.net/account/google_account_callback",scope:"email profile https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile",access_type:"online",state:JSON.stringify({redirect_url:window.location.href}),response_type:"code"},b="https://accounts.google.com/o/oauth2/v2/auth"+encodeURIParams(a,!0);window.location.href=b}function encodeURIParams(a,b){var c=[];for(var d in a)if(a.hasOwnProperty(d)){var e=a[d];null!=e&&c.push(encodeURIComponent(d)+"="+encodeURIComponent(e))}return 0==c.length?"":(b?"?":"")+c.join("&")}</script>
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
		</div>
	</div>
</section>
</asp:Content>
