<%@ Page Title="" Language="C#" MasterPageFile="~/AdminBanHang/Admin.Master" AutoEventWireup="true" CodeBehind="Them_SuaDonNhapHang.aspx.cs" Inherits="WebsiteBanHang_DATN.AdminBanHang.Them_SuaDonNhapHang" %>
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
                  <h4 class="card-title">Thông tin đơn nhập hàng</h4>
                  <form class="form-sample">
                    <div class="row">
                        <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Nhà sản xuất</label>
                          <div class="col-sm-9">
                            <asp:DropDownList ID="ddlNSX" runat="server" CssClass="form-control"></asp:DropDownList>
                          </div>
                        </div>
                      </div>
                    </div>
                    <asp:Button ID="btnThemDNH" runat="server" Text="Thêm đơn nhập hàng" CssClass="btn btn-primary" OnClientClick="if (!confirm('Bạn có chắc muốn thêm đơn nhập hàng này ? ')) return false;" OnClick="btnThemDNH_Click1"/>
                    <asp:Button ID="btnQuaylaiDNH" runat="server" Text="Quay lại" CssClass="btn btn-secondary" OnClick="btnQuaylaiDNH_Click" />
                  </form>
                </div>
              </div>
            </div>
     <div class="row" id="sua" runat="server">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Chi tiết đơn nhập hàng</h4>
                    <asp:Repeater ID="rptTrangthai_Donnhaphang" runat="server">
                    <ItemTemplate>
                        <p class="card-description">Trạng thái: <b><%# Eval("sTenTrangThai") %></b></p>
                    </ItemTemplate>
                  </asp:Repeater>
                    <p class="card-description">Đơn nhập hàng: <b><asp:Label ID="lbMaDNH" runat="server" Text="Label"></asp:Label></b></p>
                    <asp:Button ID="btnThemMH" runat="server" Text="Thêm mặt hàng" CssClass="btn btn-primary" OnClick="btnThemMH_Click"/>

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

                  <div class="table-responsive pt-3">
                      <asp:Repeater ID="rptChitietdonnhaphang" runat="server" OnItemCommand="rptChitietdonnhaphang_ItemCommand">
                          <HeaderTemplate>
                              <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>STT</th><th>Mã</th><th>Tên mặt hàng</th><th>Giá nhập</th><th>Số lượng</th><th>Size</th><th>Mức chiết khấu (%)</th><th>Thành tiền</th><th>Sau chiết khấu</th><th>Tác vụ</th>
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
                                    <td><%# Eval("fMucchietkhau") %>%</td>
                                    <td><b><%# Eval("fThanhtien","{0:0,0đ}") %></b></td>
                                    <td><b><%# Eval("fThanhtien_Sauchietkhau","{0:0,0đ}") %></b></td>
                                    <td>
                                        <a href='Them_SuaDonNhapHang.aspx?IDTrangthai=<%# Eval("iMaTrangThai") %>&IDDonnhaphang=<%# Eval("sMaDonNhapHang") %>&mode=them&suamathang=suamathang' class="badge badge-primary"><i class="mdi mdi-account-box-outline"></i></a>
                                        <asp:LinkButton ID="lbtnXoa" runat="server" CommandName="xoa" CommandArgument='<%# Eval("sMaMH") %>' OnClientClick="if (!confirm('Bạn có chắc xóa mặt hàng này ? ')) return false;" CssClass="badge badge-danger"><i class="mdi mdi-delete-forever"></i></asp:LinkButton>
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
                    <asp:Button ID="btnHuyDuyet" runat="server" Text="Bỏ xác nhận" CssClass="btn btn-primary" style="margin-top: 20px;" OnClientClick="if (!confirm('Bạn có chắc không muốn duyệt đơn nhập hàng này ? ')) return false;" Visible="false" OnClick="btnHuyDuyet_Click"/>
                    <asp:Button ID="btnDuyet" runat="server" Text="Xác nhận đơn nhập hàng" CssClass="btn btn-primary" style="margin-top: 20px;" OnClientClick="if (!confirm('Bạn có chắc muốn duyệt đơn nhập hàng này ? ')) return false;" OnClick="btnDuyet_Click"/>
                    <asp:Button ID="btnQuaylai" runat="server" Text="Quay lại" CssClass="btn btn-secondary" OnClick="btnQuaylai_Click" style="margin-top: 20px;"/>
              </div>
            </div>
        <!-- partial:../../partials/_footer.html -->
        
        <!-- partial -->
      </div>
        </div>
     <div class="col-12 grid-margin" id="themmathang" runat="server">
         <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                    <p class="card-description">
                      
                    </p>
                  <h4 class="card-title">Thêm mặt hàng vào chi tiết đơn nhập hàng</h4>
                   <p class="card-description">Đơn nhập hàng số: <b><asp:Label ID="lbDNH" runat="server" Text="Label"></asp:Label></b></p>
                  <form class="form-sample">
                    <div class="row">
                        <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Mặt hàng</label>
                          <div class="col-sm-9">
                              <asp:DropDownList ID="ddlMathang" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlMathang_SelectedIndexChanged"></asp:DropDownList>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Giá nhập (VNĐ)</label>
                          <div class="col-sm-9">
                              <asp:TextBox ID="txtGianhap" runat="server" CssClass="form-control" Columns="4" required></asp:TextBox>
                            <%--<input class="form-control" placeholder=""/>--%>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Số lượng nhập</label>
                          <div class="col-sm-9">
                              <asp:TextBox ID="txtSoluongnhap" runat="server" CssClass="form-control" required></asp:TextBox>
                            <%--<input class="form-control" placeholder=""/>--%>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Mức chiết khấu (%)</label>
                          <div class="col-sm-9">
                              <asp:TextBox ID="txtMucchietkhau" runat="server" CssClass="form-control" required></asp:TextBox>
                            <%--<select class="form-control">
                              <option>Category1</option>
                              <option>Category2</option>
                              <option>Category3</option>
                              <option>Category4</option>
                            </select>--%>
                          </div>
                        </div>
                      </div>
                   </div>
                        <div class="row">
                        <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Size</label>
                          <div class="col-sm-9">
                              <asp:DropDownList ID="ddlSize" runat="server" CssClass="form-control"></asp:DropDownList>
                            <%--<input class="form-control" placeholder=""/>--%>
                          </div>
                        </div>
                      </div>
                     </div>
                      <asp:Button ID="btnXacnhan" runat="server" Text="Xác nhận" CssClass="btn btn-primary" OnClick="btnXacnhan_Click" Visible="false" OnClientClick="if (!confirm('Bạn có chắc muốn cập nhật mặt hàng này ? ')) return false;"/>
                      <asp:Button ID="btnThem" runat="server" Text="Thêm mặt hàng" CssClass="btn btn-primary" OnClick="btnThem_Click"/>
                    <asp:Button ID="btnQuaylai2" runat="server" Text="Quay lại" CssClass="btn btn-secondary" OnClick="btnQuaylai2_Click"/>
                  </form>
                </div>
              </div>
             </div>
         </div>
</asp:Content>
