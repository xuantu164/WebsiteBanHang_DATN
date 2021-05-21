<%@ Page Title="" Language="C#" MasterPageFile="~/ClientBanHang/Client.Master" AutoEventWireup="true" CodeBehind="Timkiem.aspx.cs" Inherits="WebsiteBanHang_DATN.ClientBanHang.Timkiem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

	<div class="container">
		<div class="row">
    <div class="col-sm-12 padding-right">
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">Mặt hàng hiện có</h2>
                        <asp:Repeater ID="rptMathanghomnay" runat="server">
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
								<asp:Repeater ID="rptGoiy" runat="server">
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
								<asp:Repeater ID="rptGoiy2" runat="server">
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

	<div style="overflow: hidden; margin-top: 10px;">
                        <asp:Repeater ID="rptPages" runat="server"
                            onitemcommand="rptPages_ItemCommand1">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnPage" CssClass="badge badge-primary" CommandName="Page" CommandArgument="<%# Container.DataItem %>"
                                 runat="server"><%# Container.DataItem %>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:Repeater>
                      </div>
</asp:Content>
