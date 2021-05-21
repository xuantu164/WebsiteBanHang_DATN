<%@ Page Title="" Language="C#" MasterPageFile="~/AdminBanHang/Admin.Master" AutoEventWireup="true" CodeBehind="Them_SuaMatHang.aspx.cs" Inherits="WebsiteBanHang_DATN.AdminBanHang.Them_SuaMatHang" %>
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
    <script type="text/javascript">
        function ChooseImage() {
            var image = document.getElementById('<%= imgMH.ClientID%>');
            image.src = URL.createObjectURL(this.files[0]);
            return true;
        }
    </script>
    <div class="col-12 grid-margin">
              <div class="card">
                <div class="card-body">
                    <p class="card-description">
                      
                    </p>
                  <h4 class="card-title">Thông tin mặt hàng</h4>
                  <form class="form-sample">
                    <div class="row">
                        <div class="col-md-6">
                        <div class="form-group row">
                          <div class="col-sm-9">
                              <label for="exampleTextarea1" style="margin-bottom: 20px;">Hình ảnh mặt hàng</label> <br />
                                <asp:Image ID="imgMH" runat="server" ImageUrl="~/AdminBanHang/assets/images/faces/avt.png" Width="300px"/>
                              <asp:FileUpload ID="fuMH" runat="server" CssClass="form-control file-upload-info" onchange="ChooseImage.call(this)"/>
                              
                              <div class="input-group col-xs-12">
                                
                              </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="form-group" runat="server" id="MaMH">
                        <label for="exampleTextarea1">Mã mặt hàng: </label> <asp:Label ID="lbMaMH" runat="server" Text="Label"></asp:Label>
                    </div>
                      <div class="form-group" runat="server" id="MaFileAnh">
                        <label for="exampleTextarea1">File ảnh: </label> <asp:Label ID="lbFileAnh" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label for="exampleTextarea1">Mặt hàng</label>
                        <asp:TextBox ID="txtTenMH" runat="server" CssClass="form-control" Columns="4" required></asp:TextBox>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Đơn vị tính</label>
                          <div class="col-sm-9">
                              <asp:TextBox ID="txtDonvitinh" runat="server" CssClass="form-control" required></asp:TextBox>
                            <%--<input class="form-control" placeholder=""/>--%>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Trạng thái</label>
                          <div class="col-sm-6">
                            <asp:DropDownList ID="ddlTrangthai" runat="server" CssClass="form-control"></asp:DropDownList>
                            <%--<select class="form-control">
                              <option>Category1</option>
                              <option>Category2</option>
                              <option>Category3</option>
                              <option>Category4</option>
                            </select>--%>
                          </div>
                            <div class="col-sm-3">
                              <asp:Button ID="btnThemNSX" runat="server" Text="+" CssClass="btn btn-primary"/>
                            </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Danh mục</label>
                          <div class="col-sm-6">
                            <asp:DropDownList ID="ddlDanhmuc" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlDanhmuc_SelectedIndexChanged"></asp:DropDownList>
                            <%--<select class="form-control">
                              <option>Category1</option>
                              <option>Category2</option>
                              <option>Category3</option>
                              <option>Category4</option>
                            </select>--%>
                          </div>
                            <div class="col-sm-3">
                              <asp:Button ID="btnThemDM" runat="server" Text="+" CssClass="btn btn-primary"/>
                            </div>
                        </div>
                      </div>
                        <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Loại hàng</label>
                          <div class="col-sm-6">
                            <asp:DropDownList ID="ddlLoaiMH" runat="server" CssClass="form-control"></asp:DropDownList>
                            <%--<select class="form-control">
                              <option>Category1</option>
                              <option>Category2</option>
                              <option>Category3</option>
                              <option>Category4</option>
                            </select>--%>
                          </div>
                            <div class="col-sm-3">
                              <asp:Button ID="btnThemLoaiMH" runat="server" Text="+" CssClass="btn btn-primary" OnClick="btnThemLoaiMH_Click"/>
                            </div>
                        </div>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="exampleTextarea1">Mô tả</label>
                      <asp:TextBox ID="txtMota" runat="server" CssClass="form-control" Columns="4"></asp:TextBox>
                      <%--<textarea class="form-control" id="exampleTextarea1" rows="4"></textarea>--%>
                    </div>
                    <asp:Button ID="btnCapnhat" runat="server" Text="Cập nhật" CssClass="btn btn-primary" OnClick="btnCapnhat_Click" OnClientClick="if (!confirm('Bạn có chắc muốn cập nhật mặt hàng này ? ')) return false;"/>
                      <asp:Button ID="btnXacnhan" runat="server" Text="Xác nhận" CssClass="btn btn-primary" OnClick="btnXacnhan_Click" Visible="false"/>
                    <asp:Button ID="btnQuaylai" runat="server" Text="Quay lại" CssClass="btn btn-secondary" OnClick="btnQuaylai_Click"/>
                  </form>
                </div>
              </div>
            </div>
</asp:Content>
