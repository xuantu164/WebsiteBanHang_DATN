using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace WebsiteBanHang_DATN.ClientBanHang
{
    public partial class Trangchu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RandomImage();
                load_dsMatHang_CLB();
                load_dsMH_Goiy();
                load_dsMH_Goiy2();
                load_LoaiMH();
                load_dsDM();
                load_dsLoaiMH();
                load_MH_NSX();
            }
        }
        private void RandomImage()
        {
            Random r = new Random();
            int n = r.Next(2, 5);
            imgbodyLeft.ImageUrl = "../ClientBanhang/images/" + n + ".png";
            imgbodyLeft.ImageUrl = "../ClientBanhang/images/" + n + ".png";
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            RandomImage();
            load_LoaiMH();
            load_dsMatHang_CLB();
        }

        private void load_dsMatHang_CLB()
        {
            DataTable tb = Model.model.getData("get_dsMathang_CLB");
            rptMathanghomnay.DataSourceID = null;
            rptMathanghomnay.DataSource = tb;
            rptMathanghomnay.DataBind();
        }

        private void load_LoaiMH()
        {
            DataTable tb = Model.model.getData("dsLoaimathang_random");
            //rptLoaiMH.DataSourceID = null;
            //rptLoaiMH.DataSource = tb;
            //rptLoaiMH.DataBind();
        }

        private void load_dsMH_Goiy()
        {
            DataTable tb = Model.model.getData("dsMathang_Aobongdatreem_random");
            rptGoiy.DataSourceID = null;
            rptGoiy.DataSource = tb;
            rptGoiy.DataBind();
        }

        private void load_dsMH_Goiy2()
        {
            DataTable tb = Model.model.getData("dsMathang_Aobongdatreem_random");
            rptGoiy2.DataSourceID = null;
            rptGoiy2.DataSource = tb;
            rptGoiy2.DataBind();
        }

        protected void rptLoaiMH_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string loaiMHID = ((DataRowView)e.Item.DataItem)["iMaLoaiMH"].ToString();
            Repeater rptMH = e.Item.FindControl("rptMathang_theoIDLoaiMH") as Repeater;

            DataTable tb = Model.model.getDataWhere(loaiMHID, "dsMathang_theoIDLoaiMH_random");
            rptMH.DataSourceID = null;
            rptMH.DataSource = tb;
            rptMH.DataBind();
        }

        protected void rptMathanghomnay_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "themMH")
            {
                int soLuong = 1;
                DataTable dt = new DataTable();
                dt = Model.model.getDataWhere(e.CommandArgument.ToString(), "dsMathang_theoID");
                if (dt.Rows.Count > 0)
                {
                    if (Session["Giohang"] == null)
                    {
                        DataTable dtGiohang = new DataTable();
                        dtGiohang.Columns.Add("sMaMH");
                        dtGiohang.Columns.Add("sTenMH");
                        dtGiohang.Columns.Add("sHinhanh");
                        dtGiohang.Columns.Add("fDongia");
                        dtGiohang.Columns.Add("iSoluong");

                        dtGiohang.Rows.Add(dt.Rows[0]["sMaMH"].ToString(), dt.Rows[0]["sTenMH"].ToString(), dt.Rows[0]["sHinhanh"].ToString(), dt.Rows[0]["fDongia"].ToString(), Request.Form["quantity"]);

                        Response.Write("<script languague='javascript'>alert('Thêm vào giỏ hàng thành công !');</script>");

                        Session["Giohang"] = dtGiohang;

                    }
                    else
                    {
                        DataTable dtGiohang = new DataTable();
                        dtGiohang = (DataTable)Session["Giohang"];
                        int vt = -1;
                        for (int i = 0; i < dtGiohang.Rows.Count; i++)
                        {
                            if (dtGiohang.Rows[i]["sMaMH"].ToString() == e.CommandArgument.ToString())
                            {
                                vt = i;
                                break;
                            }
                        }
                        if (vt != -1)
                        {
                            int sl = int.Parse(dtGiohang.Rows[vt]["iSoluong"].ToString());
                            sl += 1;
                            dtGiohang.Rows[vt]["iSoluong"] = sl;

                            Response.Write("<script languague='javascript'>alert('Thêm vào giỏ hàng thành công !');</script>");

                            Session["Giohang"] = dtGiohang;
                        }
                        else
                        {
                            dtGiohang.Rows.Add(dt.Rows[0]["sMaMH"].ToString(), dt.Rows[0]["sTenMH"].ToString(), dt.Rows[0]["sHinhanh"].ToString(), dt.Rows[0]["fDongia"].ToString(), soLuong);

                            Response.Write("<script languague='javascript'>alert('Thêm vào giỏ hàng thành công !');</script>");

                            Session["Giohang"] = dtGiohang;
                        }
                    }
                }
            }
        }

        protected void rptGoiy_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "themMH")
            {
                int soLuong = 1;
                DataTable dt = new DataTable();
                dt = Model.model.getDataWhere(e.CommandArgument.ToString(), "dsMathang_theoID");
                if (dt.Rows.Count > 0)
                {
                    if (Session["Giohang"] == null)
                    {
                        DataTable dtGiohang = new DataTable();
                        dtGiohang.Columns.Add("sMaMH");
                        dtGiohang.Columns.Add("sTenMH");
                        dtGiohang.Columns.Add("sHinhanh");
                        dtGiohang.Columns.Add("fDongia");
                        dtGiohang.Columns.Add("iSoluong");

                        dtGiohang.Rows.Add(dt.Rows[0]["sMaMH"].ToString(), dt.Rows[0]["sTenMH"].ToString(), dt.Rows[0]["sHinhanh"].ToString(), dt.Rows[0]["fDongia"].ToString(), Request.Form["quantity"]);

                        Response.Write("<script languague='javascript'>alert('Thêm vào giỏ hàng thành công !');</script>");

                        Session["Giohang"] = dtGiohang;

                    }
                    else
                    {
                        DataTable dtGiohang = new DataTable();
                        dtGiohang = (DataTable)Session["Giohang"];
                        int vt = -1;
                        for (int i = 0; i < dtGiohang.Rows.Count; i++)
                        {
                            if (dtGiohang.Rows[i]["sMaMH"].ToString() == e.CommandArgument.ToString())
                            {
                                vt = i;
                                break;
                            }
                        }
                        if (vt != -1)
                        {
                            int sl = int.Parse(dtGiohang.Rows[vt]["iSoluong"].ToString());
                            sl += 1;
                            dtGiohang.Rows[vt]["iSoluong"] = sl;

                            Response.Write("<script languague='javascript'>alert('Thêm vào giỏ hàng thành công !');</script>");

                            Session["Giohang"] = dtGiohang;
                        }
                        else
                        {
                            dtGiohang.Rows.Add(dt.Rows[0]["sMaMH"].ToString(), dt.Rows[0]["sTenMH"].ToString(), dt.Rows[0]["sHinhanh"].ToString(), dt.Rows[0]["fDongia"].ToString(), soLuong);

                            Response.Write("<script languague='javascript'>alert('Thêm vào giỏ hàng thành công !');</script>");

                            Session["Giohang"] = dtGiohang;
                        }
                    }
                }
            }
        }

        protected void rptGoiy2_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "themMH")
            {
                int soLuong = 1;
                DataTable dt = new DataTable();
                dt = Model.model.getDataWhere(e.CommandArgument.ToString(), "dsMathang_theoID");
                if (dt.Rows.Count > 0)
                {
                    if (Session["Giohang"] == null)
                    {
                        DataTable dtGiohang = new DataTable();
                        dtGiohang.Columns.Add("sMaMH");
                        dtGiohang.Columns.Add("sTenMH");
                        dtGiohang.Columns.Add("sHinhanh");
                        dtGiohang.Columns.Add("fDongia");
                        dtGiohang.Columns.Add("iSoluong");

                        dtGiohang.Rows.Add(dt.Rows[0]["sMaMH"].ToString(), dt.Rows[0]["sTenMH"].ToString(), dt.Rows[0]["sHinhanh"].ToString(), dt.Rows[0]["fDongia"].ToString(), Request.Form["quantity"]);

                        Response.Write("<script languague='javascript'>alert('Thêm vào giỏ hàng thành công !');</script>");

                        Session["Giohang"] = dtGiohang;

                    }
                    else
                    {
                        DataTable dtGiohang = new DataTable();
                        dtGiohang = (DataTable)Session["Giohang"];
                        int vt = -1;
                        for (int i = 0; i < dtGiohang.Rows.Count; i++)
                        {
                            if (dtGiohang.Rows[i]["sMaMH"].ToString() == e.CommandArgument.ToString())
                            {
                                vt = i;
                                break;
                            }
                        }
                        if (vt != -1)
                        {
                            int sl = int.Parse(dtGiohang.Rows[vt]["iSoluong"].ToString());
                            sl += 1;
                            dtGiohang.Rows[vt]["iSoluong"] = sl;

                            Response.Write("<script languague='javascript'>alert('Thêm vào giỏ hàng thành công !');</script>");

                            Session["Giohang"] = dtGiohang;
                        }
                        else
                        {
                            dtGiohang.Rows.Add(dt.Rows[0]["sMaMH"].ToString(), dt.Rows[0]["sTenMH"].ToString(), dt.Rows[0]["sHinhanh"].ToString(), dt.Rows[0]["fDongia"].ToString(), soLuong);

                            Response.Write("<script languague='javascript'>alert('Thêm vào giỏ hàng thành công !');</script>");

                            Session["Giohang"] = dtGiohang;
                        }
                    }
                }
            }
        }
        
        private void load_MH_NSX()
        {
            DataTable tb = Model.model.getData("get_MH_NSX");
            rptNSX.DataSourceID = null;
            rptNSX.DataSource = tb;
            rptNSX.DataBind();
        }

        private void load_dsLoaiMH()
        {
            DataTable tb = Model.model.getData("get_dsLoaiMH");
            rptLoaiMathang.DataSourceID = null;
            rptLoaiMathang.DataSource = tb;
            rptLoaiMathang.DataBind();
        }

        private void load_dsDM()
        {
            DataTable tb = Model.model.getData("get_dsDanhmuc");
            rptDanhmuc.DataSourceID = null;
            rptDanhmuc.DataSource = tb;
            rptDanhmuc.DataBind();
        }

        protected void rptDanhmuc_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            string maDM = ((DataRowView)e.Item.DataItem)["iMaDM"].ToString();
            Repeater rptLMH = e.Item.FindControl("rptLoaiMH") as Repeater;

            DataTable tb = Model.model.getDataWhere(maDM, "get_dsLoaiMH_theoDM");
            rptLMH.DataSourceID = null;
            rptLMH.DataSource = tb;
            rptLMH.DataBind();
        }
    }
}