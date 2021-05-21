<%@ Page Title="" Language="C#" MasterPageFile="~/ClientBanHang/Client.Master" AutoEventWireup="true" CodeBehind="Trangchitiet.aspx.cs" Inherits="WebsiteBanHang_DATN.ClientBanHang.Trangchitiet" %>

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
    <center>
            <asp:Image ID="imgBanner" runat="server" ImageUrl="~/ClientBanHang/images/banner.png"/>
            </center>
    <div class="container" style="margin-top: 20px;" runat="server">
        <div class="row" runat="server">
            <div class="col-sm-12 padding-right" runat="server">
                <div class="product-details" runat="server">
                    <!--product-details-->
                    <%-- <asp:Repeater ID="rptChitietmathang" runat="server" OnItemCommand="rptChitietmathang_ItemCommand">
                        <ItemTemplate>--%>
                    <div class="col-sm-5">
                        <asp:Repeater ID="rptHinhanh" runat="server">
							<ItemTemplate>
                        <div class="view-product">
                            <img src="../AdminBanHang/assets/images/mathang/<%# Eval("sHinhanh") %>" alt="" style="width: 450px; height: 450px;" />
                            <%--<h3>ZOOM</h3>--%>
                        </div>
						</ItemTemplate>
						</asp:Repeater>
                        <div id="similar-product" class="carousel slide" data-ride="carousel">

                            <!-- Wrapper for slides -->
                            <div class="carousel-inner">
                                <%--<div class="item active">
										  <a href=""><img src="images/aokhonglogo2.png" alt="" /></a>
										  <a href=""><img src="images/aokhonglogo3.png" alt="" /></a>
										  <a href=""><img src="images/aokhonglogo4.png" alt="" /></a>
										</div>
										<div class="item">
										  <a href=""><img src="images/aokhonglogo5.png" alt="" /></a>
										  <a href=""><img src="images/aokhonglogo6.png" alt="" /></a>
										  <a href=""><img src="images/aokhonglogo7.png" alt="" /></a>
										</div>
										<div class="item">
										  <a href=""><img src="images/aokhonglogo2.png" alt="" /></a>
										  <a href=""><img src="images/aokhonglogo3.png" alt="" /></a>
										  <a href=""><img src="images/aokhonglogo4.png" alt="" /></a>
										</div>--%>
                            </div>

                            <!-- Controls -->
                            <a class="left item-control" href="#similar-product" data-slide="prev">
                                <i class="fa fa-angle-left"></i>
                            </a>
                            <a class="right item-control" href="#similar-product" data-slide="next">
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </div>

                    </div>
                    <div class="col-sm-7" runat="server">
                        <div class="product-information" runat="server">
                            <!--/product-information-->
                            <img src="images/product-details/new.jpg" class="newarrival" alt="">
                            <h2>
                                <b><asp:Label ID="lbTenMH" runat="server" Text="Label"></asp:Label></b></h2>
                            <p>Mã mặt hàng:
                                <b><asp:Label ID="lbMaMH" runat="server" Text="Label"></asp:Label></b></p>

                            <span>
                                <p><b>Giá:</b></p>
                                <span>
                                    <asp:Label ID="lbDongia" runat="server" Text="Label"></asp:Label></span>
                                <br />
                                <label>Số lượng:</label>
                                <div class="col-2">
                                    <div class="buttons_added">
                                        <%--<input class="minus is-form" type="button" value="-">--%>
                                        <input aria-label="quantity" class="input-qty" max="10" min="1" name="quantity" type="number" value="1">
                                        <%--<input class="plus is-form" type="button" value="+">--%>
                                    </div>
                                </div>
                                <br />
                                <label>Size:</label>
                                <div class="col-2" style="margin-bottom: 10px;">
                                    <asp:DropDownList ID="ddlSize" runat="server"></asp:DropDownList>
                                </div>
                            </span>
                            <div class="col-2">
                                <asp:LinkButton ID="lbtnThemvaogiohang" runat="server" CssClass="btn btn-fefault cart" OnClick="lbtnThemvaogiohang_Click"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</asp:LinkButton>
                                <asp:LinkButton ID="lbtnMuangay" runat="server" CssClass="btn btn-fefault cart" OnClick="lbtnMuangay_Click">Mua ngay</asp:LinkButton>
                            </div>
                            <p><b>Loại mặt hàng:</b>
                                <asp:Label ID="TenloaiMH" runat="server" Text="Label"></asp:Label></p>
                            <p><b>Thương hiệu:</b> Nike</p>
                            <p><b>Giao hàng miễn phí:</b> Áp dụng đơn hàng > 200.000đ</p>
                            <p><b>Thanh toán tại nhà: </b>Nhanh chóng và an toàn</p>
                        </div>
                        <!--/product-information-->
                    </div>
                    <%--</ItemTemplate>
                    </asp:Repeater>--%>
                </div>
                <!--/product-details-->

                <div class="category-tab shop-details-tab">
                    <!--category-tab-->
                    <div class="col-sm-12">
                        <ul class="nav nav-tabs">
                            <li><a href="#details" data-toggle="tab">Mặt hàng liên quan</a></li>
                            <li class="active"><a href="#reviews" data-toggle="tab">Đánh giá (5)</a></li>
                        </ul>
                    </div>
                    <%--<div class="tab-content">
							<div class="tab-pane fade" id="details" >
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="images/home/gallery1.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="images/home/gallery2.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="images/home/gallery3.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="images/home/gallery4.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							
							<div class="tab-pane fade" id="companyprofile" >
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="images/home/gallery1.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="images/home/gallery3.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="images/home/gallery2.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="images/home/gallery4.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							
							<div class="tab-pane fade" id="tag" >
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="images/aokhonglogo4.png" alt="" />
												<h2>200,000đ</h2>
												<p>Áo bóng đá không logo Bubal City xanh dương</p>
												<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng</a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="images/aokhonglogo5.png" alt="" />
												<h2>200,000đ</h2>
												<p>Áo bóng đá không logo Bubal City Hải Phòng đỏ</p>
												<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng</a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="images/aokhonglogo6.png" alt="" />
												<h2>200,000đ</h2>
												<p>Áo bóng đá không logo Bubal City Hà Nội vàng</p>
												<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng</a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="images/aokhonglogo7.png" alt="" />
												<h2>200,000đ</h2>
												<p>Áo bóng đá không logo Bubal City Tây Nguyên trắng</p>
												<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng</a>
											</div>
										</div>
									</div>
								</div>
							</div>
							
							<div class="tab-pane fade active in" id="reviews" >
								<div class="col-sm-12">
									<ul>
										<li><a href=""><i class="fa fa-user"></i>EUGEN</a></li>
										<li><a href=""><i class="fa fa-clock-o"></i>12:41 PM</a></li>
										<li><a href=""><i class="fa fa-calendar-o"></i>31 DEC 2014</a></li>
									</ul>
									<p>Hãy cho chúng tôi biết đánh giá của bạn về sản phẩm này để có thể phục vụ khách hàng một cách tốt nhất</p>
									<p><b>Đánh giá của bạn</b></p>
									
									<form action="#">
										<span>
											<input type="text" placeholder="Họ tên"/>
											<input type="email" placeholder="Địa chỉ email"/>
										</span>
										<textarea name="" ></textarea>
										<button type="button" class="btn btn-default pull-right">
											Gửi đánh giá
										</button>
									</form>
								</div>
							</div>
							
						</div>--%>
                </div>
                <!--/category-tab-->

                <div class="recommended_items">
                    <!--recommended_items-->
                    <h2 class="title text-center">Gợi ý hôm nay</h2>

                    <div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="item active">
                                <asp:Repeater ID="rptGoiy" runat="server">
                                    <ItemTemplate>
                                        <div class="col-sm-4">
                                            <div class="product-image-wrapper">
                                                <div class="single-products">
                                                    <div class="productinfo text-center">
                                                        <img src="../AdminBanHang/assets/images/mathang/<%# Eval("sHinhanh") %>" alt="" />
                                                        <h2><%# Eval("fGianhap","{0:0,0 đ}")%></h2>
                                                        <p><a href="Trangchitiet.aspx?IDMathang=<%# Eval("sMaMH")%>"><%# Eval("sTenMH")%></a></p>
                                                        <a href="Giohang.aspx?IDMathang=<%# Eval("sMaMH")%>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                            <div class="item">
                                <asp:Repeater ID="rptGoiy2" runat="server">
                                    <ItemTemplate>
                                        <div class="col-sm-4">
                                            <div class="product-image-wrapper">
                                                <div class="single-products">
                                                    <div class="productinfo text-center">
                                                        <img src="../AdminBanHang/assets/images/mathang/<%# Eval("sHinhanh") %>" alt="" />
                                                        <h2><%# Eval("fGianhap","{0:0,0 đ}")%></h2>
                                                        <p><a href="Trangchitiet.aspx?IDMathang=<%# Eval("sMaMH")%>"><%# Eval("sTenMH")%></a></p>
                                                        <a href="Giohang.aspx?IDMathang=<%# Eval("sMaMH")%>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                        <a class="left recommended-item-control" href="#recommended-item-carousel" data-slide="prev">
                            <i class="fa fa-angle-left"></i>
                        </a>
                        <a class="right recommended-item-control" href="#recommended-item-carousel" data-slide="next">
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </div>
                </div>
                <!--/recommended_items-->
            </div>
        </div>
    </div>
    <script>//<![CDATA[
        $('input.input-qty').each(function () {
            var $this = $(this),
                qty = $this.parent().find('.is-form'),
                min = Number($this.attr('min')),
                max = Number($this.attr('max'))
            if (min == 0) {
                var d = 0
            } else d = min
            $(qty).on('click', function () {
                if ($(this).hasClass('minus')) {
                    if (d > min) d += -1
                } else if ($(this).hasClass('plus')) {
                    var x = Number($this.val()) + 1
                    if (x <= max) d += 1
                }
                $this.attr('value', d).val(d)
            })
        })
		//]]></script>
</asp:Content>
