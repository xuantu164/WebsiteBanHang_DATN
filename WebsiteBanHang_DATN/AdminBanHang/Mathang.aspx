<%@ Page Title="" Language="C#" MasterPageFile="~/AdminBanHang/Admin.Master" AutoEventWireup="true" CodeBehind="Mathang.aspx.cs" Inherits="WebsiteBanHang_DATN.AdminBanHang.Mathang" %>

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
                    <h4 class="card-title">Danh sách mặt hàng</h4>
                    <asp:Button ID="btnThemMH" runat="server" Text="Thêm mặt hàng" CssClass="btn btn-primary" OnClick="btnThemMH_Click" />
                    <div class="table-responsive pt-3">
                        <asp:Repeater ID="rptMathang" runat="server">
                            <HeaderTemplate>
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>STT</th>
                                            <th>Mã</th>
                                            <th>Hình ảnh</th>
                                            <th>Tên mặt hàng</th>
                                            <th>Đơn vị tính</th>
                                            <th>Loại mặt hàng</th>
                                            <th>Thời gian tạo</th>
                                            <th>Trạng thái</th>
                                            <th>Tác vụ</th>
                                        </tr>
                                    </thead>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tbody>
                                    <tr>
                                        <td><%# Container.ItemIndex +1 %></td>
                                        <td>
                                            <label class="badge badge-primary"><%# Eval("sMaMH") %></label></td>
                                        <td>
                                            <a href='Them_SuaMatHang.aspx?IDMathang=<%# Eval("sMaMH") %>&mode=sua'>
                                                <img src="assets/images/mathang/<%#Eval("sHinhanh")%>" title="<%#Eval("sTenMH") %>" style="height: 150px; width: 150px;"></a>
                                        </td>
                                        <td><%# Eval("sTenMH") %></td>
                                        <td><%# Eval("sDonvitinh") %></td>
                                        <td><%# Eval("sTenLoaiMH") %></td>
                                        <td><%# Eval("dThoigiantao") %></td>
                                        <td>
                                            <label class="badge badge-primary"><%# Eval("sTenTrangThai") %></label></td>
                                        <td>
                                            <a href='Them_SuaMatHang.aspx?IDMathang=<%# Eval("sMaMH") %>&mode=sua' class="badge badge-primary"><i class="mdi mdi-account-box-outline"></i></a>
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
                                OnItemCommand="rptPages_ItemCommand1">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnPage" CssClass="badge badge-primary" CommandName="Page" CommandArgument="<%# Container.DataItem %>"
                                        runat="server"><%# Container.DataItem %>
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- partial:../../partials/_footer.html -->

        <!-- partial -->
    </div>
</asp:Content>