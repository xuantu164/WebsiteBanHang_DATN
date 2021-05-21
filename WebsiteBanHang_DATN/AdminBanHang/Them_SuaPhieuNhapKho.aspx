<%@ Page Title="" Language="C#" MasterPageFile="~/AdminBanHang/Admin.Master" AutoEventWireup="true" CodeBehind="Them_SuaPhieuNhapKho.aspx.cs" Inherits="WebsiteBanHang_DATN.AdminBanHang.Them_SuaPhieuNhapKho" %>
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
                            <h4 class="card-title" style="margin-top: 20px;">Thông tin nhà sản xuất</h4>
                            <asp:Repeater ID="rptNSX" runat="server">
                                <ItemTemplate>
                                    <p class="card-description">Mã nhà sản xuất: <b><%# Eval("[iMaNSX]") %></b></p>
                                    <p class="card-description">Tên nhà sản xuất: <b><%# Eval("[sTenNSX]") %></b></p>
                                    <p class="card-description">Số điện thoại: <b><%# Eval("sSdt") %></b></p>
                                    <p class="card-description">Email: <b><%# Eval("sDiachi") %></b></p>
                                    <p class="card-description">Địa chỉ: <b><%# Eval("sDiachi") %></b></p>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <div class="col-sm-4" style="margin-top: 20px;">
                          <h4 class="card-title">Chi tiết đơn nhập hàng</h4>
                            <asp:Repeater ID="rptTrangthai_Donnhaphang" runat="server">
                            <ItemTemplate>
                                <p class="card-description">Trạng thái: <b><%# Eval("sTenTrangThai") %></b></p>
                            </ItemTemplate>
                          </asp:Repeater>
                            <p class="card-description">Đơn nhập hàng: <b><asp:Label ID="lbMaDNH" runat="server" Text="Label"></asp:Label></b></p>
                            <p class="card-description" id="PNK" runat="server" visible="false">Phiếu nhập kho: <b><asp:Label ID="lbPhieunhapkho" runat="server" Text="Label"></asp:Label></b></p>
                          </div>
                      </div>
                  
                  
                  <h4 class="card-title" style="margin-top: 50px;">Danh sách mặt hàng</h4>  
                  <div class="table-responsive pt-3">
                      <asp:Repeater ID="rptChitietdonnhaphang" runat="server">
                          <HeaderTemplate>
                              <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>STT</th><th>Mã</th><th>Tên mặt hàng</th><th>Giá nhập</th><th>Số lượng</th><th>Size</th><th>Mức chiết khấu (%)</th><th>Thành tiền</th><th>Sau chiết khấu</th>
                                    </tr>
                                </thead>
                          </HeaderTemplate>
                          <ItemTemplate>
                                <tbody>
                                <tr>
                                    <td><%# Container.ItemIndex +1 %></td>
                                    <td><label class="badge badge-primary"><%# Eval("sMaMH") %></label></td>
                                    <td><%# Eval("sTenMH") %></td>
                                    <td><b><%# Eval("fGianhap","{0:0,0đ}") %></b></td>
                                    <td><%# Eval("iSoluongnhap") %></td>
                                    <td><%# Eval("sTenSize") %></td>
                                    <td><%# Eval("fMucchietkhau") %></td>
                                    <td><b><%# Eval("fThanhtien","{0:0,0đ}") %></b></td>
                                    <td><b><%# Eval("fThanhtien_Sauchietkhau","{0:0,0đ}") %></b></td>
                                </tr>
                                </tbody>
                       </ItemTemplate>
                          <FooterTemplate>
                    </table>
                          </FooterTemplate>
                       </asp:Repeater>

                      <div style="overflow: hidden; margin-top: 10px;">
                        <asp:Repeater ID="rptPages" runat="server"
                            onitemcommand="rptPages_ItemCommand1">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnPage" CssClass="badge badge-primary" CommandName="Page" CommandArgument="<%# Container.DataItem %>"
                                 runat="server"><%# Container.DataItem %></asp:LinkButton>
                            </ItemTemplate>
                        </asp:Repeater>
                      </div>
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
                                    <td><p><b>Tổng tiền:</b></p> <h4><%# Eval("fTongtien_Donnhaphang","{0:0,0đ}") %></h4></td>
                                </tr>
                                </tbody>
                       </ItemTemplate>
                          <FooterTemplate>
                    </table>
                          </FooterTemplate>
                       </asp:Repeater>

                </div>
                    <asp:Button ID="btnHuyDuyet" runat="server" Visible="false" Text="Bỏ xác nhận" CssClass="btn btn-primary" style="margin-top: 20px;" OnClientClick="if (!confirm('Bạn có chắc không muốn duyệt đơn nhập hàng này ? ')) return false;" OnClick="btnHuyDuyet_Click" />
                    <asp:Button ID="btnDuyet" runat="server" Text="Xác nhận đơn nhập hàng" Visible="false" CssClass="btn btn-primary" style="margin-top: 20px;" OnClientClick="if (!confirm('Bạn có chắc muốn duyệt đơn nhập hàng này ? ')) return false;" OnClick="btnDuyet_Click" />
                    <asp:Button ID="btnInhoadon" runat="server" Text="Xuất hóa đơn" Visible="false" CssClass="btn btn-primary" style="margin-top: 20px;" OnClientClick="if (!confirm('Bạn có chắc muốn in hóa đơn này ? ')) return false;" OnClick="btnInhoadon_Click"/>
                    <asp:Button ID="btnQuaylai" runat="server" Text="Quay lại" CssClass="btn btn-secondary" style="margin-top: 20px;" OnClick="btnQuaylai_Click"/>
                        
                <!-- Bootstrap Modal Dialog -->
    <div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <div class="modal-content">
                        <div class="modal-header">
                             <div class="card-body">
                            <div class="row">
                                <div class="col-sm-4">
                                 <center><h3 style="margin-bottom: 20px;">PHIẾU NHẬP KHO</h3></center>
                                <h4 class="card-title" style="margin-top: 20px;">Thông tin nhà sản xuất</h4>
                                <asp:Repeater ID="rptNSX2" runat="server">
                                    <ItemTemplate>
                                        <p class="card-description">Mã nhà sản xuất: <b><%# Eval("[iMaNSX]") %></b></p>
                                        <p class="card-description">Tên nhà sản xuất: <b><%# Eval("[sTenNSX]") %></b></p>
                                        <p class="card-description">Số điện thoại: <b><%# Eval("sSdt") %></b></p>
                                        <p class="card-description">Email: <b><%# Eval("sDiachi") %></b></p>
                                        <p class="card-description">Địa chỉ: <b><%# Eval("sDiachi") %></b></p>
                                    </ItemTemplate>
                                </asp:Repeater>
                                </div>
                                <div class="col-sm-4">
                                    <div class="col-sm-4" style="margin-top: 20px;">
                                      <h4 class="card-title">Chi tiết đơn nhập hàng</h4>
                                        <asp:Repeater ID="rptTrangthai_Donnhaphang2" runat="server">
                                        <ItemTemplate>
                                            <p class="card-description">Trạng thái: <b><%# Eval("sTenTrangThai") %></b></p>
                                        </ItemTemplate>
                                      </asp:Repeater>
                                        <p class="card-description">Đơn nhập hàng: <b><asp:Label ID="lbHoadon2" runat="server" Text="Label"></asp:Label></b></p>
                                        <p class="card-description" id="P1" runat="server" visible="false">Phiếu nhập kho: <b><asp:Label ID="lbPhieunhapkho2" runat="server" Text="Label"></asp:Label></b></p>
                                     </div>
                                    <div class="col-sm-4" style="margin-top: 20px;">
                                        <h4 class="card-title" style="margin-top: 20px;">Thông tin khách hàng</h4>
                        <asp:Repeater ID="rptMaKH2" runat="server">
                            <ItemTemplate>
                                <p class="card-description">Tên khách hàng: <b><%# Eval("sTenKH") %></b></p>
                                <p class="card-description">SĐT: <b><%# Eval("sSdt") %></b></p>
                                <p class="card-description">Địa chỉ giao hàng: <b><%# Eval("sDiachi") %></b></p>
                            </ItemTemplate>
                        </asp:Repeater>
                                    </div>
                                </div>
                            </div>
                        
                        </div>
                        </div>
                        <div class="modal-body">
                            <div class="card-body">
                                
                      <div class="table-responsive pt-3">
                          <div class="table-responsive pt-3">
                      <asp:Repeater ID="rptChitietdonnhaphang2" runat="server">
                          <HeaderTemplate>
                              <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>STT</th><th>Mã</th><th>Tên mặt hàng</th><th>Giá nhập</th><th>Số lượng</th><th>Size</th><th>Mức chiết khấu (%)</th><th>Thành tiền</th><th>Sau chiết khấu</th>
                                    </tr>
                                </thead>
                          </HeaderTemplate>
                          <ItemTemplate>
                                <tbody>
                                <tr>
                                    <td><%# Container.ItemIndex +1 %></td>
                                    <td><label class="badge badge-primary"><%# Eval("sMaMH") %></label></td>
                                    <td><%# Eval("sTenMH") %></td>
                                    <td><b><%# Eval("fGianhap","{0:0,0đ}") %></b></td>
                                    <td><%# Eval("iSoluongnhap") %></td>
                                    <td><%# Eval("sTenSize") %></td>
                                    <td><%# Eval("fMucchietkhau") %></td>
                                    <td><b><%# Eval("fThanhtien","{0:0,0đ}") %></b></td>
                                    <td><b><%# Eval("fThanhtien_Sauchietkhau","{0:0,0đ}") %></b></td>
                                </tr>
                                </tbody>
                       </ItemTemplate>
                          <FooterTemplate>
                    </table>
                          </FooterTemplate>
                       </asp:Repeater>

                      <div style="margin-top: 10px;">
                        <asp:Repeater ID="rptPages2" runat="server"
                            onitemcommand="rptPages2_ItemCommand1">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnPage" CssClass="badge badge-primary" CommandName="Page" CommandArgument="<%# Container.DataItem %>"
                                 runat="server"><%# Container.DataItem %></asp:LinkButton>
                            </ItemTemplate>
                        </asp:Repeater>
                      </div>
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
                                    <td><p><b>Tổng tiền:</b></p> <h4><%# Eval("fTongtien_Donnhaphang","{0:0,0đ}") %></h4></td>
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



                    
              </div>
            </div>
        <!-- partial:../../partials/_footer.html -->
        
        <!-- partial -->
      </div>
        </div>
</asp:Content>
