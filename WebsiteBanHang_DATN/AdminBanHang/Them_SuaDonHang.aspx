<%@ Page Title="" Language="C#" MasterPageFile="~/AdminBanHang/Admin.Master" AutoEventWireup="true" CodeBehind="Them_SuaDonHang.aspx.cs" Inherits="WebsiteBanHang_DATN.AdminBanHang.Them_SuaDonHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="assets/vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="assets/vendors/base/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- plugin css for this page -->
  <link rel="stylesheet" href="assets/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="assets/css/style.css">

     <div class="col-12 grid-margin" id="them" runat="server">
              <div class="card">
                <div class="card-body">
                    <p class="card-description">
                      
                    </p>
                  <h4 class="card-title">Thông tin đơn hàng</h4>
                  <form class="form-sample">
                    <div class="row">
                        <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Khách hàng</label>
                          <div class="col-sm-9">
                              <asp:TextBox ID="txtKhachhang" runat="server" CssClass="form-control"></asp:TextBox>
                            <%--<asp:DropDownList ID="ddlKhachhang" runat="server" CssClass="form-control"></asp:DropDownList>--%>
                          </div>
                        </div>
                      </div>
                        <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Ngày giao hàng</label>
                          <div class="col-sm-9">
                            <asp:TextBox ID="txtNgaygiaohang" runat="server" required TextMode="DateTime" CssClass="form-control"></asp:TextBox>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Số điện thoại</label>
                          <div class="col-sm-9">
                              <asp:TextBox ID="txtSdt" runat="server" required CssClass="form-control"></asp:TextBox>
                            <%--<input class="form-control" placeholder=""/>--%>
                          </div>
                        </div>
                      </div>
                        <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Địa chỉ giao hàng</label>
                          <div class="col-sm-9">
                              <asp:TextBox ID="txtDiachigiaohang" runat="server" required CssClass="form-control"></asp:TextBox>
                            <%--<input class="form-control" placeholder=""/>--%>
                          </div>
                        </div>
                      </div>
                    </div>
                    <asp:Button ID="btnThemDH" runat="server" Text="Thêm đơn hàng" CssClass="btn btn-primary" OnClientClick="if (!confirm('Bạn có chắc muốn thêm đơn hàng này ? ')) return false;" OnClick="btnThemDH_Click" />
                    <asp:Button ID="btnQuaylaiDH" runat="server" Text="Quay lại" CssClass="btn btn-secondary" OnClick="btnQuaylaiDH_Click" />
                  </form>
                </div>
              </div>
            </div>
     <div class="row" id="sua" runat="server">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Chi tiết đơn đặt hàng</h4>
                     <asp:Repeater ID="rptTrangthai_Dondathang" runat="server">
                    <ItemTemplate>
                        <p class="card-description">Trạng thái: <b><%# Eval("sTenTrangThai") %></b></p>
                    </ItemTemplate>
                  </asp:Repeater>
                    <p class="card-description">Đơn đặt hàng: <b><asp:Label ID="lbMaDH" runat="server" Text=""></asp:Label></b></p>
                    <asp:Button ID="btnThemMH" runat="server" Text="Thêm mặt hàng" CssClass="btn btn-primary" OnClick="btnThemMH_Click"/>
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
                  <div class="table-responsive pt-3">
                      <asp:Repeater ID="rptChitietdonhang" runat="server" OnItemCommand="rptChitietdonhang_ItemCommand">
                          <HeaderTemplate>
                              <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>STT</th><th>Mã</th><th>Tên mặt hàng</th><th>Size</th><th>Đơn giá</th><th>Số lượng</th><th>Thành tiền</th><th>Tác vụ</th>
                                    </tr>
                                </thead>
                          </HeaderTemplate>
                          <ItemTemplate>
                                <tbody>
                                <tr>
                                    <td><%# Container.ItemIndex +1 %></td>
                                    <td><label class="badge badge-primary"><%# Eval("sMaMH") %></label></td>
                                    <td><%# Eval("sTenMH") %></td>
                                    <td><%# Eval("sTenSize") %></td>
                                    <td><b><%# Eval("fGianhap","{0:0,0đ}") %></b></td>
                                    <td><%# Eval("iSLMua") %></td>
                                    <td><b><%# Eval("fThanhtien","{0:0,0đ}") %></b></td>
                                    <td><asp:LinkButton ID="lbtnXoa" runat="server" CommandName="lbtnXoa" CommandArgument='<%# Eval("sMaMH") %>' OnClientClick="if (!confirm('Bạn có chắc xóa mặt hàng này ? ')) return false;" CssClass="badge badge-danger"><i class="mdi mdi-delete-forever"></i></asp:LinkButton></td>
                                </tr>
                                </tbody>
                       </ItemTemplate>
                          <FooterTemplate>
                    </table>
                          </FooterTemplate>
                       </asp:Repeater>
                </div>

                    <div class="table-responsive pt-3">
                      <asp:Repeater ID="rptTongtien" runat="server">
                          <HeaderTemplate>
                              <table class="table table-bordered">
                                <thead>
                                    
                                </thead>
                          </HeaderTemplate>
                          <ItemTemplate>
                                <tbody>
                                <tr>
                                    <td><p><b>Tổng tiền:</b></p> <h4><%# Eval("fTongtien","{0:0,0đ}") %></h4></td>
                                </tr>
                                </tbody>
                       </ItemTemplate>
                          <FooterTemplate>
                    </table>
                          </FooterTemplate>
                       </asp:Repeater>
                </div>
                    <asp:Button ID="btnHuyDuyet" runat="server" Text="Bỏ xác nhận" CssClass="btn btn-primary" style="margin-top: 20px;" OnClientClick="if (!confirm('Bạn có chắc không muốn duyệt đơn nhập hàng này ? ')) return false;" Visible="false" OnClick="btnHuyDuyet_Click"/>
                    <asp:Button ID="btnDuyet" runat="server" Text="Xác nhận đơn hàng" CssClass="btn btn-primary" style="margin-top: 20px;" OnClientClick="if (!confirm('Bạn có chắc muốn duyệt đơn nhập hàng này ? ')) return false;" OnClick="btnDuyet_Click"/>
                    <asp:Button ID="btnXoaDonHang_Chuaduyet" Visible="false" runat="server" Text="Xóa" CssClass="btn btn-danger" style="margin-top: 20px;" OnClientClick="if (!confirm('Bạn có chắc muốn xóa đơn đặt hàng này ? ')) return false;" OnClick="btnXoaDonHang_Chuaduyet_Click"/>
                    <asp:Button ID="btnQuaylai" runat="server" Text="Quay lại" CssClass="btn btn-secondary" OnClick="btnQuaylai_Click" style="margin-top: 20px;"/>
              </div>
            </div>
        <!-- partial:../../partials/_footer.html -->
        
        <!-- partial -->
      </div>
        </div>
     <div class="row" id="themMH" runat="server">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Thêm mặt hàng vào chi tiết đơn đặt hàng</h4>
                   <p class="card-description">Đơn đặt hàng số: <asp:Label ID="lbDondathang" runat="server" Text="Label"></asp:Label></p>
                  <form class="form-sample">
                    <div class="row">
                        <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Mặt hàng</label>
                          <div class="col-sm-9">
                              <asp:DropDownList ID="ddlThemMH_DDH" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlThemMH_DDH_SelectedIndexChanged"></asp:DropDownList>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Số lượng mua</label>
                          <div class="col-sm-9">
                              <input aria-label="quantity" class="form-control input-qty" max="10" min="1" name="quantity" type="number" value="1">
                              <%--<asp:TextBox ID="txtSLMuaThemMH_DDH" runat="server" CssClass="form-control" Columns="4"></asp:TextBox>--%>
                            <%--<input class="form-control" placeholder=""/>--%>
                          </div>
                        </div>
                      </div>
                    </div>
                        <div class="row">
                        <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Size</label>
                          <div class="col-sm-9">
                              <asp:DropDownList ID="ddlSizeThemMH_DDH" runat="server" CssClass="form-control" AutoPostBack="true"></asp:DropDownList>
                            <%--<input class="form-control" placeholder=""/>--%>
                          </div>
                        </div>
                      </div>
                     </div>
                      <asp:Button ID="btnThemMH_DDH" runat="server" Text="Xác nhận" CssClass="btn btn-primary" OnClientClick="if (!confirm('Bạn có chắc thêm mặt hàng này vào đơn đặt hàng ? ')) return false;" OnClick="btnThemMH_DDH_Click"/>
                    <asp:Button ID="btnQuaylaiThemMH_DDH" runat="server" Text="Quay lại" CssClass="btn btn-secondary" OnClick="btnQuaylaiThemMH_DDH_Click" />
                  </form>
              </div>
                  
            </div>
        <!-- partial:../../partials/_footer.html -->
        
        <!-- partial -->
      </div>
        </div>
</asp:Content>
