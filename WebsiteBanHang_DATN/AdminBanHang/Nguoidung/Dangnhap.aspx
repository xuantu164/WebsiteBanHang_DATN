<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dangnhap.aspx.cs" Inherits="WebsiteBanHang_DATN.AdminBanHang.Login.Dangnhap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Đông Dương </title>
    <link rel="stylesheet" href="../assets/vendors/mdi/css/materialdesignicons.min.css" />
    <link rel="stylesheet" href="../assets/vendors/base/vendor.bundle.base.css"/>
    <link rel="stylesheet" href="../assets/vendors/datatables.net-bs4/dataTables.bootstrap4.css"/>
    <link rel="stylesheet" href="../assets/css/style.css" />
    <link rel="shortcut icon" href="../assets/images/logo-web-mini.png" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth px-0">
        <div class="row w-100 mx-0">
          <div class="col-lg-4 mx-auto">
            <div class="auth-form-light text-left py-5 px-4 px-sm-5">
              <div class="brand-logo">
                <img src="../assets/images/logo-web.png" alt="logo">
              </div>
              <h4>ĐĂNG NHẬP HỆ THỐNG</h4>
              <h6 class="font-weight-light" style="margin-bottom: 2rem;">Đăng nhập để tiếp tục.</h6>
              <form class="pt-3">
                <div class="form-group">
                  <%--<input type="email" class="form-control form-control-lg" id="exampleInputEmail1" placeholder="Tài khoản">--%>
                    <asp:TextBox ID="txtTaikhoan" runat="server" required CssClass="form-control form-control-lg" placeholder="Tài khoản"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvTaiKhoan" ForeColor="Red" ControlToValidate="txtTaikhoan" runat="server" ErrorMessage="Tài khoản không được để trống !" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                  <%--<input type="password" class="form-control form-control-lg" id="exampleInputPassword1" placeholder="Mật khẩu">--%>
                    <asp:TextBox ID="txtMatkhau" runat="server" required CssClass="form-control form-control-lg" TextMode="Password" placeholder="Mật khẩu"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvMatkhau" ForeColor="Red" ControlToValidate="txtMatkhau" runat="server" ErrorMessage="Mật khẩu không được để trống !" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                </div>
                <div class="mt-3">
                    <asp:Button ID="btnDangnhap" runat="server" Text="ĐĂNG NHẬP" title="Đăng nhập"  CssClass="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" OnClick="btnDangnhap_Click"/>
                  <%--<a class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" href="../Mathang.aspx">ĐĂNG NHẬP</a>--%>
                </div>
                <div class="my-2 d-flex justify-content-between align-items-center">
                  <div class="form-check">
                      
                  </div>
                  <a href="#" class="auth-link text-black">Quên mật khẩu?</a>
                </div>
                <div class="text-center mt-4 font-weight-light">
                  Bạn chưa có tài khoản? <a href="Dangki.aspx" class="text-primary">Tạo mới</a>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
      <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
  <!-- plugins:js -->
  <script src="../../vendors/base/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- inject:js -->
  <script src="../../js/off-canvas.js"></script>
  <script src="../../js/hoverable-collapse.js"></script>
  <script src="../../js/template.js"></script>
  <!-- endinject -->
    </form>
</body>
</html>
