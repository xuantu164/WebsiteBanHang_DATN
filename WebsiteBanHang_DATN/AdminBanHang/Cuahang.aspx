<%@ Page Title="" Language="C#" MasterPageFile="~/AdminBanHang/Admin.Master" AutoEventWireup="true" CodeBehind="Cuahang.aspx.cs" Inherits="WebsiteBanHang_DATN.AdminBanHang.Cuahang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="col-12 grid-margin">
              <div class="card">
                <div class="card-body">
                    <p class="card-description">
                      
                    </p>
                  <h4 class="card-title">Thông tin cửa hàng</h4>
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
                          <label class="col-sm-3 col-form-label">Tên cửa hàng</label>
                          <div class="col-sm-9">
                            <asp:TextBox ID="txtTencuahang" runat="server" CssClass="form-control" ></asp:TextBox>
                          </div>
                        </div>
                      </div>
                        <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Số điện thoại</label>
                          <div class="col-sm-9">
                            <asp:TextBox ID="txtSdt" runat="server" CssClass="form-control"></asp:TextBox>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Email</label>
                          <div class="col-sm-9">
                              <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                            <%--<input class="form-control" placeholder=""/>--%>
                          </div>
                        </div>
                      </div>
                        <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Địa chỉ</label>
                          <div class="col-sm-9">
                              <asp:TextBox ID="txtDiachi" runat="server" CssClass="form-control"></asp:TextBox>
                            <%--<input class="form-control" placeholder=""/>--%>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Giờ mở cửa</label>
                          <div class="col-sm-9">
                              <asp:TextBox ID="txtGiomocua" runat="server" CssClass="form-control"></asp:TextBox>
                            <%--<input class="form-control" placeholder=""/>--%>
                          </div>
                        </div>
                      </div>
                        <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Giờ đóng cửa</label>
                          <div class="col-sm-9">
                            <asp:TextBox ID="txtGiodongcua" runat="server" TextMode="DateTime" CssClass="form-control"></asp:TextBox>
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
                          <label class="col-sm-3 col-form-label">Mô tả</label>
                          <div class="col-sm-9">
                            <asp:TextBox ID="txtMota" runat="server" CssClass="form-control"></asp:TextBox>
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
                          <label class="col-sm-3 col-form-label">Tài khoản</label>
                          <div class="col-sm-9">
                              <asp:TextBox ID="txtTaikhoan" runat="server" CssClass="form-control"></asp:TextBox>
                            <%--<input class="form-control" placeholder=""/>--%>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                          <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Ngày khai trương</label>
                          <div class="col-sm-9">
                              <asp:TextBox ID="txtNgaykhaitruong" TextMode="DateTime" runat="server" CssClass="form-control"></asp:TextBox>
                            <%--<input class="form-control" placeholder=""/>--%>
                          </div>
                        </div>
                      </div>
                    </div>
                    <asp:Button ID="btnCapnhat" runat="server" Text="Cập nhật" CssClass="btn btn-primary" OnClientClick="if (!confirm('Bạn có chắc muốn cập nhật thông tin tài khoản này ? ')) return false;" OnClick="btnCapnhat_Click"/>
                      <asp:Button ID="btnXacnhan" runat="server" Text="Xác nhận" CssClass="btn btn-primary"  Visible="false" OnClick="btnXacnhan_Click"/>
                    <asp:Button ID="btnQuaylai" runat="server" Text="Quay lại" CssClass="btn btn-secondary"/>
                  </form>
                </div>
              </div>
            </div>
</asp:Content>
