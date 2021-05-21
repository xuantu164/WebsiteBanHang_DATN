using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace WebsiteBanHang_DATN.AdminBanHang
{
    public partial class Them_SuaMatHang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                load_dsTrangthai_Mathang();
                //load_dsLoaiMH();
                load_dsMathang();
                load_dsDanhmuc();
                if (Request.QueryString["mode"] == "them")
                {
                    btnCapnhat.Visible = false;
                    btnXacnhan.Visible = true;
                    MaMH.Visible = false;
                    MaFileAnh.Visible = false;
                }

            }
        }
        private void load_dsMathang()
        {
            if (Request.QueryString["IDMathang"] != "")
            {
                DataTable tb = Model.model.getDataWhere(Request.QueryString["IDMathang"].ToString(), "getMathang_theoID");
                foreach (DataRow row in tb.Rows)
                {
                    lbMaMH.Text = row["sMaMH"].ToString();
                    lbFileAnh.Text  = row["sHinhanh"].ToString();
                    txtTenMH.Text = row["sTenMH"].ToString();
                    txtDonvitinh.Text = row["sDonvitinh"].ToString();
                    txtMota.Text = row["sMota"].ToString();
                    ddlLoaiMH.SelectedValue = row["iMaLoaiMH"].ToString();
                }
            }
        }

        private void load_dsTrangthai_Mathang()
        {
            DataTable tb = Model.model.getData("get_dsTrangthai_Mathang");
            ddlTrangthai.DataSourceID = null;
            ddlTrangthai.DataSource = tb;
            ddlTrangthai.DataTextField = "sTenTrangThai";
            ddlTrangthai.DataValueField = "iMaTrangThai";
            ddlTrangthai.DataBind();
        }

        private void load_dsDanhmuc()
        {
            if (!Page.IsPostBack)
            {
                DataTable tb = Model.model.getData("get_dsDanhmuc");
                ddlDanhmuc.DataSourceID = null;
                ddlDanhmuc.DataSource = tb;
                ddlDanhmuc.DataTextField = "sTenDM";
                ddlDanhmuc.DataValueField = "iMaDM";
                ddlDanhmuc.DataBind();
                load_dsLoaiMH_theoDM(int.Parse(ddlDanhmuc.SelectedValue));
            }
            
        }
        
        //private void load_dsLoaiMH()
        //{
        //    DataTable tb = Model.model.getData("get_dsLoaiMH");
        //    ddlLoaiMH.DataSourceID = null;
        //    ddlLoaiMH.DataSource = tb;
        //    ddlLoaiMH.DataTextField = "sTenLoaiMH";
        //    ddlLoaiMH.DataValueField = "iMaLoaiMH";
        //    ddlLoaiMH.DataBind();
        //}

        private void load_dsLoaiMH_theoDM(int maDM)
        {
            DataTable tb = Model.model.get_LoaiMH_theoDM("get_dsLoaiMH_theoDM", maDM);
            ddlLoaiMH.DataSourceID = null;
            ddlLoaiMH.DataSource = tb;
            ddlLoaiMH.DataTextField = "sTenLoaiMH";
            ddlLoaiMH.DataValueField = "iMaLoaiMH";
            ddlLoaiMH.DataBind();
        }

        protected void btnCapnhat_Click(object sender, EventArgs e)
        {
            string fn = System.IO.Path.GetFileName(fuMH.PostedFile.FileName);
            string SaveLocation = Server.MapPath("~/AdminBanHang/assets/images/mathang/") + "\\" + fn;
            if ((fuMH.PostedFile != null) && (fuMH.PostedFile.ContentLength > 0))
            {

                try
                {
                    fuMH.PostedFile.SaveAs(SaveLocation);
                    imgMH.ImageUrl = Server.MapPath("Upload") + "\\" + fn;
                }
                catch (Exception ex)
                {

                }
            }
            else
            {

            }

            int i = Model.model.Sua_MatHang("pr_Capnhat_DsMathang", Request.QueryString["IDMathang"].ToString(), txtTenMH.Text, fn, txtDonvitinh.Text, txtMota.Text, int.Parse(ddlLoaiMH.SelectedValue),int.Parse(ddlTrangthai.SelectedValue));
            if (i > 0)
            {
                Response.Write("<script languague='javascript'> alert('Cập nhập thông tin mặt hàng thành công !');window.location.href ='Mathang.aspx';</script>");
            }
            else
                Response.Write("<script languague='javascript'> alert('Cập nhập thông tin mặt hàng không thành công !');</script>");
        }

        protected void btnQuaylai_Click(object sender, EventArgs e)
        {
            Response.Redirect("Mathang.aspx");
        }

        protected void btnXacnhan_Click(object sender, EventArgs e)
        {
            string fn = System.IO.Path.GetFileName(fuMH.PostedFile.FileName);
            string SaveLocation = Server.MapPath("~/AdminBanHang/assets/images/mathang/") + "\\" + fn;
            if ((fuMH.PostedFile != null) && (fuMH.PostedFile.ContentLength > 0))
            {

                try
                {
                    fuMH.PostedFile.SaveAs(SaveLocation);
                    imgMH.ImageUrl = Server.MapPath("Upload") + "\\" + fn;
                }
                catch (Exception ex)
                {

                }
            }
            else
            {

            }

            int i = Model.model.Them_MatHang("pr_Them_DsMathang", txtTenMH.Text, fn, txtDonvitinh.Text, txtMota.Text, int.Parse(ddlLoaiMH.SelectedValue), int.Parse(ddlTrangthai.SelectedValue));
            if (i > 0)
            {
                Response.Write("<script languague='javascript'> alert('Thêm mặt hàng thành công !');window.location.href ='Mathang.aspx';</script>");
            }
            else
                Response.Write("<script languague='javascript'> alert('Thêm mặt hàng không thành công !');</script>");
        }

        protected void btnThemLoaiMH_Click(object sender, EventArgs e)
        {

        }


        protected void ddlDanhmuc_SelectedIndexChanged(object sender, EventArgs e)
        {
            load_dsLoaiMH_theoDM(int.Parse(ddlDanhmuc.SelectedValue));
        }
    }
}