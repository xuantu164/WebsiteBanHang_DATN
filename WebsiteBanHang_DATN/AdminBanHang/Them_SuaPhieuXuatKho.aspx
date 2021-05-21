<%@ Page Title="" Language="C#" MasterPageFile="~/AdminBanHang/Admin.Master" AutoEventWireup="true" CodeBehind="Them_SuaPhieuXuatKho.aspx.cs" Inherits="WebsiteBanHang_DATN.AdminBanHang.Them_SuaPhieuXuatKho" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- plugins:css -->
  <link rel="stylesheet" href="assets/vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="assets/vendors/base/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- plugin css for this page -->
  <link rel="stylesheet" href="assets/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="assets/css/style.css">

    <div class="row" id="sua" runat="server">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-4">
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
                        <div class="col-md-4" style="margin-top: 20px;">
                          <h4 class="card-title">Chi tiết đơn đặt hàng</h4>
                            <asp:Repeater ID="rptTrangthai_Dondathang" runat="server">
                            <ItemTemplate>
                                <p class="card-description">Trạng thái: <b><%# Eval("sTenTrangThai") %></b></p>
                            </ItemTemplate>
                          </asp:Repeater>
                            <p class="card-description">Đơn đặt hàng: <b><asp:Label ID="lbMaDH" runat="server" Text=""></asp:Label></b></p>
                            <p class="card-description" id="PXK" runat="server" visible="false">Phiếu xuất kho: <b><asp:Label ID="lbPhieuxuatkho" runat="server" Text=""></asp:Label></b></p>
                            </div>
                   </div>

                    
                  <h3 class="card-title" style="margin-top: 50px;">Danh sách mặt hàng</h3>  
                  <div class="table-responsive pt-3">
                      <asp:Repeater ID="rptChitietdonhang" runat="server" OnItemCommand="rptChitietdonhang_ItemCommand">
                          <HeaderTemplate>
                              <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>STT</th><th>Mã</th><th>Tên mặt hàng</th><th>Size</th><th>Đơn giá</th><th>Số lượng</th><th>Thành tiền</th>
                                    </tr>
                                </thead>
                          </HeaderTemplate>
                          <ItemTemplate>
                                <tbody>
                                <tr>
                                    <td><%# Container.ItemIndex +1 %></td>
                                    <td><a href="#" class="badge badge-primary"><%# Eval("sMaMH") %></a></td>
                                    <td><%# Eval("sTenMH") %></td>
                                    <td><%# Eval("sTenSize") %></td>
                                    <td><b><%# Eval("fGianhap","{0:0,0đ}") %></b></td>
                                    <td><%# Eval("iSLMua") %></td>
                                    <td><b><%# Eval("fThanhtien","{0:0,0đ}") %></b></td>
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


    <!-- Bootstrap Modal Dialog -->
    <div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <div class="modal-content">
                        <div class="modal-header">
                             <div class="card-body">
                                 <center><h3 style="margin-bottom: 20px;">HÓA ĐƠN BÁN LẺ</h3></center>
                                <p class="card-description">Hóa đơn: <b><asp:Label ID="lbHoadon" runat="server" Text=""></asp:Label></b></p>
                                <p class="card-description" id="P1" runat="server">Phiếu xuất kho: <b><asp:Label ID="lbPXK" runat="server" Text=""></asp:Label></b></p>
                            </div>
                        
                        </div>
                        <div class="modal-body">
                            <div class="card-body">
                                <h4 class="card-title" style="margin-top: 20px;">Thông tin khách hàng</h4>
                        <asp:Repeater ID="rptMaKH2" runat="server">
                            <ItemTemplate>
                                <p class="card-description">Tên khách hàng: <b><%# Eval("sTenKH") %></b></p>
                                <p class="card-description">SĐT: <b><%# Eval("sSdt") %></b></p>
                                <p class="card-description">Địa chỉ giao hàng: <b><%# Eval("sDiachi") %></b></p>
                            </ItemTemplate>
                        </asp:Repeater>
                      <div class="table-responsive pt-3">
                          <asp:Repeater ID="rptChitietdonhang2" runat="server" OnItemCommand="rptChitietdonhang_ItemCommand">
                              <HeaderTemplate>
                                  <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>STT</th><th>Tên mặt hàng</th><th>Size</th><th>Số lượng</th><th>Đơn giá</th><th>Thành tiền</th>
                                        </tr>
                                    </thead>
                              </HeaderTemplate>
                              <ItemTemplate>
                                    <tbody>
                                    <tr>
                                        <td><%# Container.ItemIndex +1 %></td>
                                        <td><%# Eval("sTenMH") %></td>
                                        <td><%# Eval("sTenSize") %></td>
                                        <td><%# Eval("iSLMua") %></td>
                                        <td><b><%# Eval("fGianhap","{0:0,0đ}") %></b></td>
                                        <td><b><%# Eval("fThanhtien","{0:0,0đ}") %></b></td>
                                    </tr>
                                    </tbody>
                           </ItemTemplate>
                              <FooterTemplate>
                        </table>
                              </FooterTemplate>
                           </asp:Repeater>
                    </div>
                                <div class="table-responsive pt-3">
                          <asp:Repeater ID="rptTongtien2" runat="server">
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
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-primary" data-dismiss="modal" aria-hidden="true">In hóa đơn</button>
                            <button class="btn btn-primary" data-dismiss="modal" aria-hidden="true">Đóng</button>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
                    <asp:Button ID="btnHuyDuyet" runat="server" Visible="false" Text="Bỏ xác nhận" CssClass="btn btn-primary" style="margin-top: 20px;" OnClientClick="if (!confirm('Bạn có chắc không muốn duyệt đơn nhập hàng này ? ')) return false;"/>
                    <asp:Button ID="btnDuyet" runat="server" Text="Xác nhận đơn hàng" CssClass="btn btn-primary" style="margin-top: 20px;" OnClientClick="if (!confirm('Bạn có chắc muốn duyệt đơn nhập hàng này ? ')) return false;" OnClick="btnDuyet_Click" />
                    <asp:Button ID="btnXoaDonHang_Chuaduyet" Visible="false" runat="server" Text="Xóa" CssClass="btn btn-danger" style="margin-top: 20px;" OnClientClick="if (!confirm('Bạn có chắc muốn xóa đơn đặt hàng này ? ')) return false;" />
                    <asp:Button ID="btnInhoadon" runat="server" Text="Xuất hóa đơn" Visible=false CssClass="btn btn-primary" style="margin-top: 20px;" OnClientClick="if (!confirm('Bạn có chắc muốn in hóa đơn này ? ')) return false;" OnClick="btnInhoadon_Click"/>
                    <asp:Button ID="btnQuaylai" runat="server" Text="Quay lại" CssClass="btn btn-secondary" style="margin-top: 20px;" OnClick="btnQuaylai_Click"/>
              </div>
            </div>
        <!-- partial:../../partials/_footer.html -->
        
        <!-- partial -->
      </div>
        </div>
</asp:Content>
