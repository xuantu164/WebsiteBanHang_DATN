<%@ Page Title="" Language="C#" MasterPageFile="~/AdminBanHang/Admin.Master" AutoEventWireup="true" CodeBehind="PhieuNhapKho.aspx.cs" Inherits="WebsiteBanHang_DATN.AdminBanHang.PhieuNhapKho" %>
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

    <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Danh sách phiếu nhập kho</h4>
                  <asp:Repeater ID="rptTrangthai_Phieunhapkho" runat="server">
                    <ItemTemplate>
                        <p class="card-description">Trạng thái: <b><%# Eval("sTenTrangThai") %></b></p>
                    </ItemTemplate>
                  </asp:Repeater>
                  <div class="table-responsive pt-3">
                      <asp:Repeater ID="rptPhieunhapkho" runat="server">
                          <HeaderTemplate>
                              <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Mã phiếu nhập kho</th>
                                        <th>Người lập</th>
                                        <th>Ngày nhập kho</th>
                                        <th>Thời gian tạo</th>
                                        <th>Thời gian sửa</th>
                                        <th>Trạng thái</th>
                                        <th>Kho</th>
                                        <th>Mã đơn nhập hàng</th>
                                        <th>Tác vụ</th>
                                    </tr>
                                </thead>
                          </HeaderTemplate>
                          <ItemTemplate>
                                <tbody>
                                <tr>
                                    <td><%# Container.ItemIndex +1 %></td>
                                    <td><label class="badge badge-primary"><%# Eval("sMaPhieuNhapKho") %></label></td>
                                    <td><%# Eval("sTenNV") %></td>
                                    <td><%# Eval("dNgaynhapkho") %></td>
                                    <td><%# Eval("dThoigiantao") %></td>
                                    <td><%# Eval("dThoigiansua") %></td>
                                    <td><label class="badge badge-primary"><%# Eval("sTenTrangThai") %></label></td>
                                    <td><%# Eval("iMaKho") %></td>
                                    <td><label class="badge badge-primary"><%# Eval("sMaDonNhapHang") %></label></td>
                                    <td><a href='Them_SuaPhieuNhapKho.aspx?modeDuyet=1&IDTrangthai=<%# Eval("iMaTrangThai") %>&IDPhieunhapkho=<%# Eval("sMaPhieuNhapKho") %>&mode=sua&IDDonnhaphang=<%# Eval("sMaDonNhapHang") %>&Thoigiansua=<%# Eval("dThoigiansua") %>' class="badge badge-primary"><i class="mdi mdi-account-box-outline"></i></a></td>
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
              </div>
            </div>
        <!-- partial:../../partials/_footer.html -->
        
        <!-- partial -->
      </div>
        </div>
</asp:Content>
