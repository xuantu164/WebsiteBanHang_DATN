<%@ Page Title="" Language="C#" MasterPageFile="~/ClientBanHang/Client.Master" AutoEventWireup="true" CodeBehind="Trangchu.aspx.cs" Inherits="WebsiteBanHang_DATN.ClientBanHang.Trangchu" %>
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


	<marquee>Cửa hàng dụng cụ, thời trang thể thao Đông Dương Sport địa chỉ 88 Lê Thanh Nghị, Hai Bà Trưng, Hà Nội. Điện thoại 09.8888.6666</marquee>

	<section id="slider"><!--slider-->
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div id="slider-carousel" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
							<li data-target="#slider-carousel" data-slide-to="1"></li>
							<li data-target="#slider-carousel" data-slide-to="2"></li>
						</ol>
						
						<div class="carousel-inner">
							<div class="item active">
								<div class="col-sm-6">
									<h1><span>Đông Dương</span> - Sport</h1>
									<h2>Cam kết 100% hàng chính hãng</h2>
									<p>Mang đến cho người dùng những trải nghiệm hoàn toàn mới</p>
									<button type="button" class="btn btn-default get">Tìm hiểu ngay</button>
								</div>
								<div class="col-sm-6">
									<img src="images/aokhonglogo.png" class="girl img-responsive" alt="" />
									<%--<img src="images/home/pricing.png"  class="pricing" alt="" />--%>
								</div>
							</div>
							<div class="item">
								<div class="col-sm-6">
									<h1><span>Đông Dương</span> - Sport</h1>
									<h2>Kênh bán hàng uy tín về những mặt hàng thể thao</h2>
									<p>Giúp khách hàng thỏa sức mua sắm online cũng như offline các mặt hàng thể thao</p>
									<button type="button" class="btn btn-default get">Tìm hiểu ngay</button>
								</div>
								<div class="col-sm-6">
									<img src="images/aobongdatreemkhonglogo.png" class="girl img-responsive" alt="" />
									<%--<img src="images/home/pricing.png"  class="pricing" alt="" />--%>
								</div>
							</div>
							
							<div class="item">
								<div class="col-sm-6">
									<h1><span>Đông Dương</span> - Sport</h1>
									<h2>Phục vụ khách hàng tận tụy, chu đáo</h2>
									<p>Nhà phân phối lớn về trang phục quần áo bóng đá, áo bóng đá không logo, các loại áo bóng đá đội tuyển, áo bóng đá câu lạc bộ</p>
									<button type="button" class="btn btn-default get">Tìm hiểu ngay</button>
								</div>
								<div class="col-sm-6">
									<img src="images/aokhonglogo2.png" class="girl img-responsive" alt="" />
									<%--<img src="images/home/pricing.png" class="pricing" alt="" />--%>
								</div>
							</div>
							
						</div>
						
						<a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
							<i class="fa fa-angle-left"></i>
						</a>
						<a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
							<i class="fa fa-angle-right"></i>
						</a>
					</div>
					
				</div>
			</div>
		</div>
	</section><!--/slider-->

		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<div class="left-sidebar">
						<h2>Danh mục</h2>
						<div class="panel-group category-products" id="accordian"><!--category-productsr-->
							<div class="panel panel-default">
                                <asp:Repeater ID="rptDanhmuc" runat="server" OnItemDataBound="rptDanhmuc_ItemDataBound">
									<ItemTemplate>
										<div class="panel-heading">
											<h4 class="panel-title">
												<a data-toggle="collapse" data-parent="#accordian" href='#<%#Eval("iMaDM") %>'>
													<span class="badge pull-right"><i class="fa fa-plus"></i></span>
													<%#Eval("sTenDM") %>
												</a>
											</h4>
										</div>
										<asp:Repeater ID="rptLoaiMH" runat="server">
											<ItemTemplate>
												<div id='<%#Eval("iMaDM") %>' class="panel-collapse collapse">
													<div class="panel-body">
														<ul>
															<li><a href='Timkiem.aspx?IDLoaiMH=<%#Eval("iMaLoaiMH") %>&searchkey=&IDNSX='><%#Eval("sTenLoaiMH") %> </a></li>
														</ul>
													</div>
												</div>
											</ItemTemplate>
										</asp:Repeater>
									</ItemTemplate>
                                </asp:Repeater>
							</div>
							<div class="panel panel-default">
                                <asp:Repeater ID="rptLoaiMathang" runat="server">
									<ItemTemplate>
										<div class="panel panel-default">
											<div class="panel-heading">
												<h4 class="panel-title"><a href='Timkiem.aspx?IDLoaiMH=<%#Eval("iMaLoaiMH") %>&searchkey=&IDNSX='><%#Eval("sTenLoaiMH") %></a></h4>
											</div>
										</div>
									</ItemTemplate>
                                </asp:Repeater>
							</div>
						</div><!--/category-products-->
					
						<div class="brands_products"><!--brands_products-->
							<h2>Thương hiệu</h2>
							<div class="brands-name">
                                <asp:Repeater ID="rptNSX" runat="server">
									<ItemTemplate>
										<ul class="nav nav-pills nav-stacked">
											<li><a href='Timkiem.aspx?IDNSX=<%#Eval("iMaNSX") %>&searchkey=&IDLoaiMH=' <%#Eval("sTenNSX") %>'> <span class="pull-right">(<%#Eval("Tong") %>)</span><%#Eval("sTenNSX") %></a></li>
										</ul>
									</ItemTemplate>
                                </asp:Repeater>
								
							</div>
						</div><!--/brands_products-->
						
						<%--<div class="shipping text-center"><!--shipping-->--%>
							<asp:UpdatePanel ID="UpdatePanel1" runat="server">
							<ContentTemplate>
								<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
								<asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick"></asp:Timer>
								<asp:Image ID="imgbodyLeft" runat="server" ImageUrl="../ClientCuaHang/images/2.png" Width="250px" Height="500px"/>
							</ContentTemplate>
							</asp:UpdatePanel>
							<%--<img src="images/home/shipping.jpg" alt="" />--%>
						<%--</div><!--/shipping-->--%>
					
					</div>
				</div>
				
				<div class="col-sm-9 padding-right">
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">Mặt hàng hôm nay</h2>
                        <asp:Repeater ID="rptMathanghomnay" runat="server" OnItemCommand="rptMathanghomnay_ItemCommand">
							<ItemTemplate>
								<div class="col-sm-4">
									<div class="product-image-wrapper">
										<div class="single-products">
												<div class="productinfo text-center">
													<img src="../AdminBanHang/assets/images/mathang/<%# Eval("sHinhanh") %>" alt="" style="width: 255px; height: 290px;"/>
													<h2><%# Eval("fGianhap","{0:0,0 đ}")%></h2>
													<p><%# Eval("sTenMH") %></p>
													<asp:LinkButton ID="lbtnThemvaogiohang1" runat="server"  CommandName="themMH1" CommandArgument='<%# Eval("sMaMH") %>' CssClass="btn btn-fefault cart"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</asp:LinkButton>
													<%--<a href="Giohang.aspx?IDMathang=<%# Eval("sMaMH")%>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng</a>--%>
												</div>
												<div class="product-overlay" runat="server">
													<div class="overlay-content">
														<a href="Trangchitiet.aspx?IDMathang=<%# Eval("sMaMH")%>">
														<h2><%# Eval("fGianhap","{0:0,0 đ}")%></h2>
														<p><%# Eval("sTenMH") %></p></a>
														<asp:LinkButton ID="lbtnThemvaogiohang" runat="server" CommandName="themMH" CommandArgument='<%# Eval("sMaMH") %>' CssClass="btn btn-fefault cart"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</asp:LinkButton>
														<%--<a href="Giohang.aspx?IDMathang=<%# Eval("sMaMH")%>" class="btn btn-default add-to-cart" ><i class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng</a>--%>
													</div>
												</div>
										</div>
									</div>
								</div>
							</ItemTemplate>
                        </asp:Repeater>
						
					</div><!--features_items-->
					<!--features_items-->

					<%--<div class="category-tab"><!--category-tab-->
								<div class="col-sm-12">
									<ul class="nav nav-tabs">
										<asp:Repeater ID="rptLoaiMH" runat="server">
											<ItemTemplate>
										<li><a href="#<%# Eval("iMaLoaiMH") %>" data-toggle="tab"><%# Eval("sTenLoaiMH") %></a></li>
									</ul>
								</div>
								<div class="tab-content">
									<div class="tab-pane fade active in" id="<%# Eval("iMaLoaiMH") %>" >
										<asp:Repeater ID="rptMathang_theoIDLoaiMH" runat="server">
											<ItemTemplate>
												<div class="col-sm-3">
													<div class="product-image-wrapper">
														<div class="single-products">
															<div class="productinfo text-center">
																<a href="Trangchitiet.aspx?IDMathang=<%# Eval("sMaMH")%>">
																<h2><%# Eval("fDongia","{0:0,0 đ}")%></h2>
																<p><%# Eval("sTenMH") %></p></a>
																<a href="Giohang.aspx?IDMathang=<%# Eval("sMaMH")%>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng</a>
															</div>
														</div>
													</div>
												</div>
											</ItemTemplate>
										</asp:Repeater>
									</div>
								</div>
							</ItemTemplate>
						</asp:Repeater>
					</div>--%> <!--category-tab-->
					<!--/category-tab-->	
					
					<div class="recommended_items"><!--recommended_items-->
                    <h2 class="title text-center">Gợi ý hôm nay</h2>

                    <div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="item active">
								<asp:Repeater ID="rptGoiy" runat="server" OnItemCommand="rptGoiy_ItemCommand">
									<ItemTemplate>
										<div class="col-sm-4">
											<div class="product-image-wrapper">
												<div class="single-products">
													<div class="productinfo text-center">
														<img src="../AdminBanHang/assets/images/mathang/<%# Eval("sHinhanh") %>" alt="" />
														<h2><%# Eval("fGianhap","{0:0,0 đ}")%></h2>
														<p><a href="Trangchitiet.aspx?IDMathang=<%# Eval("sMaMH")%>"><%# Eval("sTenMH")%></a></p>
														<asp:LinkButton ID="lbtnThemvaogiohang" runat="server" CommandName="themMH" CommandArgument='<%# Eval("sMaMH") %>' CssClass="btn btn-fefault cart"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</asp:LinkButton>
													</div>
												</div>
											</div>
										</div>
									</ItemTemplate>
                                </asp:Repeater>
                            </div>
                            <div class="item">
								<asp:Repeater ID="rptGoiy2" runat="server" OnItemCommand="rptGoiy2_ItemCommand">
									<ItemTemplate>
										<div class="col-sm-4">
											<div class="product-image-wrapper">
												<div class="single-products">
													<div class="productinfo text-center">
														<img src="../AdminBanHang/assets/images/mathang/<%# Eval("sHinhanh") %>" alt="" />
														<h2><%# Eval("fGianhap","{0:0,0 đ}")%></h2>
														<p><a href="Trangchitiet.aspx?IDMathang=<%# Eval("sMaMH")%>"><%# Eval("sTenMH")%></a></p>
														<asp:LinkButton ID="lbtnThemvaogiohang" runat="server" CommandName="themMH" CommandArgument='<%# Eval("sMaMH") %>' CssClass="btn btn-fefault cart"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</asp:LinkButton>
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
                </div><!--recommended_items-->
					<!--/recommended_items-->
				</div>
			</div>
		</div>
</asp:Content>
