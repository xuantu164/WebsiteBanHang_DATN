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
    public partial class Trangchitiet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                load_dsMH_Goiy();
                load_dsMH_Goiy2();
                load_chitietMH_theoID();
                load_dsSize();
                load_chitietMathang();
            }
        }
        private void load_chitietMH_theoID()
        {
            DataTable tb = Model.model.getDataWhere(Request.QueryString["IDMathang"].ToString(), "dsAnhMathang_theoID");
            rptHinhanh.DataSourceID = null;
            rptHinhanh.DataSource = tb;
            rptHinhanh.DataBind();
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
        private void load_dsSize()
        {
            if (Request.QueryString["IDMathang"] != "")
            {
                DataTable tb = Model.model.getDataWhere(Request.QueryString["IDMathang"].ToString(), "get_DSSize_theoMathang");
                ddlSize.DataSourceID = null;
                ddlSize.DataSource = tb;
                ddlSize.DataTextField = "sTenSize";
                ddlSize.DataValueField = "iMaSize";
                ddlSize.DataBind();
            }
        }

        private void load_chitietMathang()
        {
            float donGia;
            if (Request.QueryString["IDMathang"] != "")
            {
                DataTable tb = Model.model.getDataWhere(Request.QueryString["IDMathang"].ToString(), "dsMathang_theoID");
                foreach (DataRow row in tb.Rows)
                {
                    lbTenMH.Text = row["sTenMH"].ToString();
                    lbMaMH.Text = row["sMaMH"].ToString();
                    donGia = float.Parse(row["fGianhap"].ToString());
                    lbDongia.Text = donGia.ToString("00,0 đ");
                }
            }
        }

        protected void rptChitietmathang_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if(e.CommandName == "themMH")
            {
                int soLuong = 1;
                DataTable dt = new DataTable();
                dt = Model.model.getDataWhere(Request.QueryString["IDMathang"].ToString(), "dsMathang_theoID");
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
                         for(int i = 0; i < dtGiohang.Rows.Count; i++)
                         {
                             if(dtGiohang.Rows[i]["sMaMH"].ToString() == Request.QueryString["IDMathang"].ToString())
                             {
                                vt = i;
                                break;
                             }
                         }
                         if(vt != -1)
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
            if (e.CommandName == "muaNgay")
            {
                int soLuong = 1;
                DataTable dt = new DataTable();
                dt = Model.model.getDataWhere(Request.QueryString["IDMathang"].ToString(), "dsMathang_theoID");
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

                        dtGiohang.Rows.Add(dt.Rows[0]["sMaMH"].ToString(), dt.Rows[0]["sTenMH"].ToString(), dt.Rows[0]["sHinhanh"].ToString(), dt.Rows[0]["fDongia"].ToString(), soLuong);

                        Response.Write("<script languague='javascript'>alert('Thêm vào giỏ hàng thành công !');window.location.href='Giohang.aspx'</script>");

                        Session["Giohang"] = dtGiohang;

                    }
                    else
                    {
                        DataTable dtGiohang = new DataTable();
                        dtGiohang = (DataTable)Session["Giohang"];
                        int vt = -1;
                        for (int i = 0; i < dtGiohang.Rows.Count; i++)
                        {
                            if (dtGiohang.Rows[i]["sMaMH"].ToString() == Request.QueryString["IDMathang"].ToString())
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

                            Response.Write("<script languague='javascript'>alert('Thêm vào giỏ hàng thành công !');window.location.href='Giohang.aspx'</script>");

                            Session["Giohang"] = dtGiohang;
                        }
                        else
                        {
                            dtGiohang.Rows.Add(dt.Rows[0]["sMaMH"].ToString(), dt.Rows[0]["sTenMH"].ToString(), dt.Rows[0]["sHinhanh"].ToString(), dt.Rows[0]["fDongia"].ToString(), soLuong);

                            Response.Write("<script languague='javascript'>alert('Thêm vào giỏ hàng thành công !');window.location.href='Giohang.aspx'</script>");

                            Session["Giohang"] = dtGiohang;
                        }
                    }
                }
            }
        }

        protected void lbtnMuangay_Click(object sender, EventArgs e)
        {
            int soLuong = int.Parse(Request.Form["quantity"]);
            DataTable dt = new DataTable();
            dt = Model.model.getDataWhere(Request.QueryString["IDMathang"].ToString(), "dsMathang_theoID");
            if (dt.Rows.Count > 0)
            {
                if (Session["Giohang"] == null)
                {
                    DataTable dtGiohang = new DataTable();
                    dtGiohang.Columns.Add("sMaMH");
                    dtGiohang.Columns.Add("sTenMH");
                    dtGiohang.Columns.Add("sHinhanh");
                    dtGiohang.Columns.Add("fDongia");
                    dtGiohang.Columns.Add("iMaSize");
                    dtGiohang.Columns.Add("sTenSize");
                    dtGiohang.Columns.Add("iSoluong");
                    dtGiohang.Columns.Add("fThanhtien");

                    dtGiohang.Rows.Add(dt.Rows[0]["sMaMH"].ToString(), dt.Rows[0]["sTenMH"].ToString(), dt.Rows[0]["sHinhanh"].ToString(), float.Parse(dt.Rows[0]["fGianhap"].ToString()), ddlSize.SelectedValue, ddlSize.SelectedItem, soLuong, soLuong * float.Parse(dt.Rows[0]["fGianhap"].ToString()));

                    Response.Write("<script languague='javascript'>alert('Thêm vào giỏ hàng thành công !');window.location.href='Giohang.aspx';</script>");

                    Session["Giohang"] = dtGiohang;

                }
                else
                {
                    DataTable dtGiohang = new DataTable();
                    dtGiohang = (DataTable)Session["Giohang"];
                    int vt = -1;
                    for (int i = 0; i < dtGiohang.Rows.Count; i++)
                    {
                        if (dtGiohang.Rows[i]["sMaMH"].ToString() == Request.QueryString["IDMathang"].ToString() && dtGiohang.Rows[i]["sTenSize"].ToString() == ddlSize.SelectedItem.ToString())
                        {
                            vt = i;
                            break;
                        }
                    }
                    if (vt != -1)
                    {
                        int sl = int.Parse(dtGiohang.Rows[vt]["iSoluong"].ToString());
                        sl += int.Parse(Request.Form["quantity"]);
                        dtGiohang.Rows[vt]["iSoluong"] = sl;

                        float tt = float.Parse(dtGiohang.Rows[vt]["fThanhtien"].ToString());
                        tt += (int.Parse(Request.Form["quantity"]) * float.Parse(dtGiohang.Rows[vt]["fDongia"].ToString()));
                        dtGiohang.Rows[vt]["fThanhtien"] = tt;

                        Response.Write("<script languague='javascript'>alert('Thêm vào giỏ hàng thành công !');window.location.href='Giohang.aspx';</script>");

                        Session["Giohang"] = dtGiohang;
                    }
                    else
                    {
                        dtGiohang.Rows.Add(dt.Rows[0]["sMaMH"].ToString(), dt.Rows[0]["sTenMH"].ToString(), dt.Rows[0]["sHinhanh"].ToString(), float.Parse(dt.Rows[0]["fGianhap"].ToString()), ddlSize.SelectedValue, ddlSize.SelectedItem, soLuong, soLuong * float.Parse(dt.Rows[0]["fGianhap"].ToString()));

                        Response.Write("<script languague='javascript'>alert('Thêm vào giỏ hàng thành công !');window.location.href='Giohang.aspx';</script>");

                        Session["Giohang"] = dtGiohang;
                    }
                }
            }
        }

        protected void lbtnThemvaogiohang_Click(object sender, EventArgs e)
        {
            int soLuong = int.Parse(Request.Form["quantity"]);
            DataTable dt = new DataTable();
            dt = Model.model.getDataWhere(Request.QueryString["IDMathang"].ToString(), "dsMathang_theoID");
            if (dt.Rows.Count > 0)
            {
                if (Session["Giohang"] == null)
                {
                    DataTable dtGiohang = new DataTable();
                    dtGiohang.Columns.Add("sMaMH");
                    dtGiohang.Columns.Add("sTenMH");
                    dtGiohang.Columns.Add("sHinhanh");
                    dtGiohang.Columns.Add("fDongia");
                    dtGiohang.Columns.Add("iMaSize");
                    dtGiohang.Columns.Add("sTenSize");
                    dtGiohang.Columns.Add("iSoluong");
                    dtGiohang.Columns.Add("fThanhtien");

                    dtGiohang.Rows.Add(dt.Rows[0]["sMaMH"].ToString(), dt.Rows[0]["sTenMH"].ToString(), dt.Rows[0]["sHinhanh"].ToString(), float.Parse(dt.Rows[0]["fGianhap"].ToString()), ddlSize.SelectedValue, ddlSize.SelectedItem, soLuong, soLuong * float.Parse(dt.Rows[0]["fGianhap"].ToString()));

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
                        if (dtGiohang.Rows[i]["sMaMH"].ToString() == Request.QueryString["IDMathang"].ToString() && dtGiohang.Rows[i]["sTenSize"].ToString() == ddlSize.SelectedItem.ToString())
                        {
                            vt = i;
                            break;
                        }
                    }
                    if (vt != -1)
                    {
                        int sl = int.Parse(dtGiohang.Rows[vt]["iSoluong"].ToString());
                        sl += int.Parse(Request.Form["quantity"]);
                        dtGiohang.Rows[vt]["iSoluong"] = sl;

                        float tt = float.Parse(dtGiohang.Rows[vt]["fThanhtien"].ToString());
                        tt += (int.Parse(Request.Form["quantity"]) * float.Parse(dtGiohang.Rows[vt]["fDongia"].ToString()));
                        dtGiohang.Rows[vt]["fThanhtien"] = tt;

                        Response.Write("<script languague='javascript'>alert('Thêm vào giỏ hàng thành công !');</script>");

                        Session["Giohang"] = dtGiohang;
                    }
                    else
                    {
                        dtGiohang.Rows.Add(dt.Rows[0]["sMaMH"].ToString(), dt.Rows[0]["sTenMH"].ToString(), dt.Rows[0]["sHinhanh"].ToString(),float.Parse(dt.Rows[0]["fGianhap"].ToString()), ddlSize.SelectedValue, ddlSize.SelectedItem, soLuong, soLuong * float.Parse(dt.Rows[0]["fGianhap"].ToString()));

                        Response.Write("<script languague='javascript'>alert('Thêm vào giỏ hàng thành công !');</script>");

                        Session["Giohang"] = dtGiohang;
                    }
                }
            }
        }
    }
}