<%@ Page Title="" Language="C#" MasterPageFile="~/AdminBanHang/Admin.Master" AutoEventWireup="true" CodeBehind="Them_SuaTaiKhoan.aspx.cs" Inherits="WebsiteBanHang_DATN.AdminBanHang.Them_SuaTaiKhoan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function ChooseImage() {
            var image = document.getElementById('<%= imgTK.ClientID%>');
            image.src = URL.createObjectURL(this.files[0]);
            return true;
        }
    </script>
    <div class="col-12 grid-margin">
              <div class="card">
                <div class="card-body">
                    <p class="card-description">
                      
                    </p>
                  <h4 class="card-title">Thông tin tài khoản</h4>
                  <form class="form-sample">
                    <div class="row">
                        <div class="col-md-6">
                        <div class="form-group row">
                          <div class="col-sm-9">
                              <label for="exampleTextarea1">Ảnh đại diện</label>
                                <asp:Image ID="imgTK" runat="server" ImageUrl="~/AdminBanHang/assets/images/faces/avt.png" Width="300px"/>
                              <asp:FileUpload ID="fuTK" runat="server" CssClass="form-control file-upload-info" onchange="ChooseImage.call(this)"/>
                              <div class="input-group col-xs-12">
                                
                              </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Tài khoản</label>
                          <div class="col-sm-9">
                            <asp:TextBox ID="txtTaikhoan" runat="server" CssClass="form-control" ></asp:TextBox>
                          </div>
                        </div>
                      </div>
                        <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Họ tên</label>
                          <div class="col-sm-9">
                            <asp:TextBox ID="txtHoten" runat="server" CssClass="form-control"></asp:TextBox>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Mật khẩu</label>
                          <div class="col-sm-9">
                              <asp:TextBox ID="txtMatkhau" runat="server" CssClass="form-control"></asp:TextBox>
                            <%--<input class="form-control" placeholder=""/>--%>
                          </div>
                        </div>
                      </div>
                        <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Email</label>
                          <div class="col-sm-9">
                              <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                            <%--<input class="form-control" placeholder=""/>--%>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Số điện thoại</label>
                          <div class="col-sm-9">
                              <asp:TextBox ID="txtSdt" runat="server" CssClass="form-control"></asp:TextBox>
                            <%--<input class="form-control" placeholder=""/>--%>
                          </div>
                        </div>
                      </div>
                        <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Ngày sinh</label>
                          <div class="col-sm-9">
                            <asp:TextBox ID="txtNgaysinh" runat="server" TextMode="DateTime" CssClass="form-control"></asp:TextBox>
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
                          <label class="col-sm-3 col-form-label">Giới tính</label>
                          <div class="col-sm-9">
                            <asp:TextBox ID="txtGioitinh" runat="server" CssClass="form-control"></asp:TextBox>
                            <%--<select class="form-control">
                              <option>Category1</option>
                              <option>Category2</option>
                              <option>Category3</option>
                              <option>Category4</option>
                            </select>--%>
                          </div>
                        </div>
                      </div>
                         <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Quê quán</label>
                          <div class="col-sm-9">
                              <asp:TextBox ID="txtQuequan" runat="server" CssClass="form-control"></asp:TextBox>
                            <%--<input class="form-control" placeholder=""/>--%>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                          <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Ngày vào làm</label>
                          <div class="col-sm-9">
                              <asp:TextBox ID="txtNgayvaolam" TextMode="DateTime" runat="server" CssClass="form-control"></asp:TextBox>
                            <%--<input class="form-control" placeholder=""/>--%>
                          </div>
                        </div>
                      </div>
                          <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Quyền</label>
                          <div class="col-sm-6">
                            <asp:DropDownList ID="ddlQuyen" runat="server" CssClass="form-control"></asp:DropDownList>
                            <%--<select class="form-control">
                              <option>Category1</option>
                              <option>Category2</option>
                              <option>Category3</option>
                              <option>Category4</option>
                            </select>--%>
                          </div>
                            <div class="col-sm-3">
                              <asp:Button ID="btnThemquyen" runat="server" Text="+" CssClass="btn btn-primary" />
                            </div>
                        </div>
                      </div>
                          
                    </div>
                    <div class="row">
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
                              <asp:Button ID="btnThemtrangthai" runat="server" Text="+" CssClass="btn btn-primary" />
                            </div>
                        </div>
                      </div>
                          </div>
                    <asp:Button ID="btnCapnhat" runat="server" Text="Cập nhật" CssClass="btn btn-primary" OnClientClick="if (!confirm('Bạn có chắc muốn cập nhật thông tin tài khoản này ? ')) return false;" OnClick="btnCapnhat_Click"/>
                    <%--<asp:Button ID="btnKhoa" runat="server" Text="Khóa tài khoản" CssClass="btn btn-danger" OnClientClick="if (!confirm('Bạn có chắc muốn khóa tài khoản này ? ')) return false;" OnClick="btnXoa_Click"/>--%>
                      <asp:Button ID="btnXacnhan" runat="server" Text="Xác nhận" CssClass="btn btn-primary"  Visible="false" OnClick="btnXacnhan_Click"/>
                    <asp:Button ID="btnQuaylai" runat="server" Text="Quay lại" CssClass="btn btn-secondary" OnClick="btnQuaylai_Click" />
                  </form>
                </div>
              </div>
            </div>
</asp:Content>
