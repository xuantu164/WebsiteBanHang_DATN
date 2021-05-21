<%@ Page Title="" Language="C#" MasterPageFile="~/ClientBanHang/Client.Master" AutoEventWireup="true" CodeBehind="Giohang.aspx.cs" Inherits="WebsiteBanHang_DATN.ClientBanHang.Giohang" %>
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

    <section id="cart_items">
		<div class="container">
			
     <div class="row" id="sua" runat="server" visible="false">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                    <h4 class="card-title" style="margin-top: 20px;">Thông tin khách hàng</h4>
                    <asp:Repeater ID="rptMaKH" runat="server">
                        <ItemTemplate>
                            <p class="card-description">Mã khách hàng: <b><%# Eval("iMaKH") %></b></p>
                            <p class="card-description">Tên khách hàng: <b><%# Eval("sTenKH") %></b></p>
                            <p class="card-description">SĐT: <b><%# Eval("sSdt") %></b></p>
                            <p class="card-description">Ngày sinh: <b><%# Eval("dNgaysinh") %></b></p>
                            <p class="card-description">Giới tính: <b><%# Eval("sGioitinh") %></b></p>
                            <p class="card-description">Email: <b><%# Eval("sEmail") %></b></p>
                            <p class="card-description">Địa chỉ giao hàng: <b><%# Eval("sDiachi") %></b></p>
                        </ItemTemplate>
                    </asp:Repeater>
              </div>
            </div>
        <!-- partial:../../partials/_footer.html -->
        
        <!-- partial -->
      </div>
        </div>
			<div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="#">Trang chủ</a></li>
				  <li class="active">Giỏ hàng của bạn</li>
				</ol>
			</div>
			<div class="shopper-informations" id="thanhtoan" runat="server">
				<div class="row">
					<div class="col-sm-3 clearfix" style="margin-left:200px;">
						<div class="bill-to">
							<p>Thông tin khách hàng</p>
								<form>
									<fieldset class="form-group">
										<asp:TextBox ID="txtHoten" runat="server" placeholder="Họ tên" required CssClass="form-control form-control-lg" style="margin-top: 10px;"></asp:TextBox>
										<asp:RequiredFieldValidator ID="rfvTaiKhoan" ForeColor="Red" ControlToValidate="txtHoten" runat="server" ErrorMessage="Họ tên không được để trống !" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
									</fieldset>
									<fieldset class="form-group">
										<asp:TextBox ID="txtSdt" runat="server" placeholder="Số điện thoại" required CssClass="form-control form-control-lg" style="margin-top: 10px;"></asp:TextBox>
										<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" ControlToValidate="txtSdt" runat="server" ErrorMessage="Số điện thoại không được để trống !" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
									</fieldset>
									<fieldset class="form-group">
										<asp:TextBox ID="txtThoigiangiaohang" TextMode="Date" runat="server" placeholder="Thời gian giao hàng" required CssClass="form-control form-control-lg" style="margin-top: 10px;"></asp:TextBox>
										<asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" ControlToValidate="txtThoigiangiaohang" runat="server" ErrorMessage="Thời gian giao hàng không được để trống !" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
									</fieldset>
									<fieldset class="form-group">
										<asp:TextBox ID="txtDiachigiaohang" runat="server" placeholder="Địa chỉ nhận hàng" required CssClass="form-control form-control-lg" style="margin-top: 10px;"></asp:TextBox>
										<asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" ControlToValidate="txtDiachigiaohang" runat="server" ErrorMessage="Địa chỉ nhận hàng không được để trống !" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
									</fieldset>
								</form>
							</div>
					</div>
					<div class="col-sm-4">
						<div class="order-message">
							<p>Ghi chú</p>
							<textarea name="message" class="form-control form-control-lg" placeholder="Ghi chú thêm để giúp cửa hàng thuận tiện trong việc giao hàng" rows="16"></textarea>
						</div>	
					</div>	
				</div>
			</div>

		<p><h4>Giỏ hàng của bạn: <b><asp:Label ID="lbSomathang" runat="server" Text="0"></asp:Label> </b>mặt hàng</h4></p>
		<div class="table-responsive cart_info">
                <asp:Repeater ID="rptGiohang" runat="server" OnItemCommand="rptGiohang_ItemCommand">
					<HeaderTemplate>
						<table class="table table-condensed">
						<thead>
								<tr class="cart_menu">
									<td class="image">Hình ảnh</td>
									<td class="description">Mặt hàng</td>
									<td class="price">Số lượng</td>
									<td class="quantity">Size</td>
									<td class="total">Thành tiền</td>
									<td class="total">Tác vụ</td>
								</tr>
						</thead>
					</HeaderTemplate>
					<ItemTemplate>
							<tbody>
								<tr>
									<td class="cart_product">
										<a href="#"><img src="../AdminBanHang/assets/images/mathang/<%# Eval("sHinhanh") %>" alt="" style="width:110px; height:110px;"></a>
									</td>
									<td class="cart_description">
										<h4><a href="Trangchitiet.aspx?IDMathang=<%# Eval("sMaMH") %>"><b><%# Eval("sTenMH") %></b></a></h4>
										<p style="margin-bottom: 0px;">Mã mặt hàng: <b><%# Eval("sMaMH")%></b></p>
										<p style="margin-bottom: 0px;">Đơn giá: <b><%# Eval("fDongia","{0:0,0 đ}")%></b></p>
									</td>
									<td class="cart_quantity">
										<%--<div class="cart_quantity_button">
											<div class="buttons_added">
											  <%--<input class="minus is-form" type="button" value="-">--%>
											  <%--<input aria-label="quantity" class="input-qty" max="10" min="1" name="quantity" type="number" value="1" runat="server">--%>
											  <%--<input class="plus is-form" type="button" value="+">
											</div>
										</div>--%>
										<p><b><%# Eval("iSoluong")%></b></p>
									</td>

									<td class="quantity"><b><%# Eval("sTenSize")%></b></td>

									<td class="cart_total">
										<p class="cart_total_price" style="margin-bottom: 0px;"><%# Eval("fThanhtien","{0:0,0 đ}")%></p>
									</td>
									<td class="cart_delete">
										<asp:LinkButton ID="lbtnXoaMH" runat="server" CommandName="xoa" CommandArgument='<%# Eval("sMaMH") %>' OnClientClick="if (!confirm('Bạn có chắc muốn xóa mặt hàng này khỏi giỏ hàng ? ')) return false;" CssClass="cart_quantity_delete"><i class="fa fa-times"></i></asp:LinkButton>
									</td>
								</tr>
							</tbody>
					</ItemTemplate>
					<FooterTemplate>
						</table>
					</FooterTemplate>
                </asp:Repeater>
			</div>
		<div class="row" style="margin-bottom: 20px;">
				<div class="col-sm-7">

				</div>
				<div class="col-sm-5">
					<div class="total_area">
						<ul>
							<li><p class="cart_total_price" style="margin-bottom: 0px;"><b>Tổng tiền <asp:Label ID="lbTongtien" runat="server" Text="0đ"></asp:Label></b></p></li>
						</ul>
							<asp:LinkButton ID="btnTieptucmua" CssClass="btn btn-default update" PostBackUrl="Trangchu.aspx" runat="server"><i class="fa fa-reply"></i> Tiếp tục mua hàng</asp:LinkButton>
							<asp:LinkButton ID="lbtnThanhtoan" CssClass="btn btn-default update" runat="server" OnClick="lbtThanhtoan_Click" OnClientClick="if (!confirm('Bạn có xác nhận muốn thanh toán đơn hàng ? ')) return false;"><i class="fa fa-check"></i> Tiến hành thanh toán</asp:LinkButton>
							<asp:LinkButton ID="lbtnXacnhan" Visible="false" CssClass="btn btn-default update" runat="server" OnClientClick="if (!confirm('Bạn có xác nhận thông tin giao hàng là chính xác ? ')) return false;" OnClick="lbtnXacnhan_Click"><i class="fa fa-check"></i>Xác nhận</asp:LinkButton>
						<!-- PayPal Logo --><table border='0' cellpadding='10' cellspacing='0' align='center'><tr><td align='center'></td></tr><tr><td align='center'><a href='https://www.paypal.com/vn/webapps/mpp/paypal-popup' title='How PayPal Works' onclick="javascript:window.open('https://www.paypal.com/vn/webapps/mpp/paypal-popup','WIPaypal','toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=yes, width=1060, height=700'); return false;"><img src='https://www.paypalobjects.com/webstatic/en_US/i/buttons/checkout-logo-large.png' alt='Thanh toán bằng PayPal | Lớn' /></a></td></tr></table><!-- PayPal Logo -->
					</div>
				</div>
			</div>

		<p><asp:LinkButton ID="lbtnDonhangcuatoi" CssClass="btn btn-primary"  runat="server" OnClick="lbtnDonhangcuatoi_Click">Đon hàng của tôi</asp:LinkButton></p>
		<div class="table-responsive cart_info" id="donhangcuatoi" runat="server" visible="false">
                <asp:Repeater ID="rptDonhangmoinhat" runat="server">
					<HeaderTemplate>
						<table class="table table-condensed">
						<thead>
								<tr class="cart_menu">
									<td>STT</td>
									<td class="image">Hình ảnh</td>
									<td class="description">Mặt hàng</td>
									<td class="price">Số lượng</td>
									<td class="quantity">Size</td>
									<td class="total">Thành tiền</td>
									<td class="total">Trạng thái</td>
								</tr>
						</thead>
					</HeaderTemplate>
					<ItemTemplate>
							<tbody>
								<tr>
									<td><%# Container.ItemIndex +1 %></td>
									<td class="cart_product">
										<a href="#"><img src="../AdminBanHang/assets/images/mathang/<%# Eval("sHinhanh") %>" alt="" style="width:110px; height:110px;"></a>
									</td>
									<td class="cart_description">
										<h4><a href="Trangchitiet.aspx?IDMathang=<%# Eval("sMaMH") %>"><b><%# Eval("sTenMH") %></b></a></h4>
										<p style="margin-bottom: 0px;">Mã mặt hàng: <b><%# Eval("sMaMH")%></b></p>
										<p style="margin-bottom: 0px;">Đơn giá: <b><%# Eval("fGianhap","{0:0,0 đ}")%></b></p>
									</td>
									<td class="cart_quantity">
										<p><b><%# Eval("iSLMua")%></b></p>
									</td>

									<td class="quantity"><b><%# Eval("sTenSize")%></b></td>

									<td class="cart_total">
										<p class="cart_total_price" style="margin-bottom: 0px;"><%# Eval("fThanhtien","{0:0,0 đ}")%></p>
									</td>
									<td class="cart_delete"><label class="badge badge-sucsses"><%# Eval("sTenTrangThai") %></label></td>
								</tr>
							</tbody>
					</ItemTemplate>
					<FooterTemplate>
						</table>
					</FooterTemplate>
                </asp:Repeater>
			</div>

		</div>
	</section>
	<script>//<![CDATA[
		$('input.input-qty').each(function() {
		  var $this = $(this),
			qty = $this.parent().find('.is-form'),
			min = Number($this.attr('min')),
			max = Number($this.attr('max'))
		  if (min == 0) {
			var d = 0
		  } else d = min
		  $(qty).on('click', function() {
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
