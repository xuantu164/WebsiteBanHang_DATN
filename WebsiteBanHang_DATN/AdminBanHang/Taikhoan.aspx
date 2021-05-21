<%@ Page Title="" Language="C#" MasterPageFile="~/AdminBanHang/Admin.Master" AutoEventWireup="true" CodeBehind="Taikhoan.aspx.cs" Inherits="WebsiteBanHang_DATN.AdminBanHang.Nguoidung" %>
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
                  <h4 class="card-title">Danh sách tài khoản</h4>
                  <asp:Button ID="btnThemTK" runat="server" Text="Thêm tài khoản" OnClick="btnThemTK_Click" CssClass="btn btn-primary"/>
                  <div class="table-responsive pt-3">
                      <asp:Repeater ID="rptTaikhoan" runat="server">
                          <HeaderTemplate>
                              <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>STT</th><th>Họ tên</th><th>Tên đăng nhập</th><th>Mật khẩu</th><th>Email</th><th>Quyền</th><th>Trạng thái</th><th>Tác vụ</th>
                                    </tr>
                                </thead>
                          </HeaderTemplate>
                          <ItemTemplate>
                                <tbody>
                                <tr>
                                    <td><%# Container.ItemIndex +1 %></td>
                                    <td><%# Eval("sTenNV") %></td>
                                    <td><a href='Them_SuaTaiKhoan.aspx?Tendangnhap=<%# Eval("sTenDangNhap") %>&mode=sua' class="badge badge-primary"><%# Eval("sTenDangNhap") %></a></td>
                                    <td><%# Eval("sMatKhau") %></td>
                                    <td><%# Eval("sEmail") %></td>
                                    <td><%# Eval("sTenQuyen") %></td>
                                    <td><label class="badge badge-primary"><%# Eval("sTenTrangThai") %></label></td>
                                    <td>
                                        <a href='Them_SuaTaiKhoan.aspx?MaNV=<%# Eval("iMaNV") %>&Tendangnhap=<%# Eval("sTenDangNhap") %>&mode=sua' class="badge badge-primary"><i class="mdi mdi-account-box-outline"></i></a>
                                    </td>
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
                                <asp:LinkButton ID="btnPage" CssClass="badge badge-success" CommandName="Page" CommandArgument="<%# Container.DataItem %>"
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
