<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dangki.aspx.cs" Inherits="WebsiteBanHang_DATN.AdminBanHang.Dangnhap.Dangki" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Đông Dương </title>
    <link rel="stylesheet" href="../assets/vendors/mdi/css/materialdesignicons.min.css" />
    <link rel="stylesheet" href="../assets/vendors/base/vendor.bundle.base.css" />
    <link rel="stylesheet" href="../assets/vendors/datatables.net-bs4/dataTables.bootstrap4.css" />
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
                                <h4>Bạn là người mới?</h4>
                                <h6 class="font-weight-light" style="margin-bottom: 2rem;">Đăng kí dễ dàng. Vui lòng thực hiện vài bước sau</h6>
                                <form class="pt-3">
                                    <div class="form-group">
                                        <asp:TextBox ID="txtTaikhoan" runat="server" required CssClass="form-control form-control-lg" placeholder="Tài khoản"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvTaiKhoan" required ForeColor="Red" ControlToValidate="txtTaikhoan" runat="server" ErrorMessage="Tài khoản không được để trống !" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                        <%--<input type="text" class="form-control form-control-lg" id="exampleInputUsername1" placeholder="Tài khoản">--%>
                                    </div>
                                    <div class="form-group">
                                        <input type="email" class="form-control form-control-lg" id="exampleInputEmail1" placeholder="Email">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control form-control-lg" id="exampleInputPassword1" placeholder="Mật khẩu">
                                    </div>
                                    <div class="mb-4">
                                    </div>
                                    <div class="mt-3">
                                        <a class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" href="../../index.html">ĐĂNG KÍ</a>
                                    </div>
                                    <div class="text-center mt-4 font-weight-light">
                                        Bạn đã có tài khoản? <a href="Dangnhap.aspx" class="text-primary">Đăng nhập</a>
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