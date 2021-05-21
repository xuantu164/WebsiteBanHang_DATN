<%@ Page Title="" Language="C#" MasterPageFile="~/AdminBanHang/Admin.Master" AutoEventWireup="true" CodeBehind="Kho.aspx.cs" Inherits="WebsiteBanHang_DATN.AdminBanHang.Kho" %>
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
                <div class="card-body" id="mathang_kho" runat="server">
                  <h4 class="card-title">Danh sách mặt hàng trong kho</h4>
                  <div class="table-responsive pt-3">
                      <asp:Repeater ID="rptMathang_Kho" runat="server">
                          <HeaderTemplate>
                              <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>STT</th><th>Mã mặt hàng</th><th>Hình ảnh</th><th>Tên mặt hàng</th><th>Tác vụ</th>
                                    </tr>
                                </thead>
                          </HeaderTemplate>
                          <ItemTemplate>
                                <tbody>
                                <tr>
                                    <td><%# Container.ItemIndex +1 %></td>
                                    <td><a href="#" class="badge badge-primary"><%# Eval("sMaMH") %></a></td>
                                    <td>
                                        <img src="assets/images/mathang/<%#Eval("sHinhanh")%>" title="<%#Eval("sTenMH") %>" style="height: 150px; width: 150px;">
                                    </td>
                                    <td><%# Eval("sTenMH") %></td>
                                    <td>
                                        <a href='Kho.aspx?IDMathang=<%# Eval("sMaMH") %>&modeMH=size' class="badge badge-primary"><i class="mdi mdi-account-box-outline"></i></a>
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
                                <asp:LinkButton ID="btnPage" CssClass="badge badge-primary" CommandName="Page" CommandArgument="<%# Container.DataItem %>"
                                 runat="server"><%# Container.DataItem %>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:Repeater>
                      </div>
                  </div>
                </div>
                <div class="card-body" id="mathang_size" runat="server">
                  <h4 class="card-title">Chi tiết mặt hàng trong kho</h4>
                    <p class="card-description">Mã mặt hàng: <b><asp:Label ID="lbMaMH" runat="server" Text=""></asp:Label></b></p>
                  <div class="table-responsive pt-3">
                      <asp:Repeater ID="rptMathang_Size" runat="server">
                          <HeaderTemplate>
                              <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>STT</th><th>Mã</th><th>Hình ảnh</th><th>Tên mặt hàng</th><th>Size</th><th>Số lượng</th>
                                    </tr>
                                </thead>
                          </HeaderTemplate>
                          <ItemTemplate>
                                <tbody>
                                <tr>
                                    <td><%# Container.ItemIndex +1 %></td>
                                    <td><a href="#" class="badge badge-primary"><%# Eval("sMaMH") %></a></td>
                                    <td>
                                        <img src="assets/images/mathang/<%#Eval("sHinhanh")%>" title="<%#Eval("sTenMH") %>" style="height: 150px; width: 150px;">
                                    </td>
                                    <td><%# Eval("sTenMH") %></td>
                                    <td><%# Eval("sTenSize") %></td>
                                    <td><%# Eval("iSoluong") %></td>
                                    
                                </tr>
                                </tbody>
                       </ItemTemplate>
                          <FooterTemplate>
                    </table>
                          </FooterTemplate>
                       </asp:Repeater>
                      <a class="btn btn-secondary" href="Kho.aspx?IDMathang=&modeMH=" style="margin-top: 20px;">Quay lại</a>
                  </div>
                </div>
              </div>
            </div>
        <!-- partial:../../partials/_footer.html -->
        
        <!-- partial -->
      </div>
</asp:Content>
