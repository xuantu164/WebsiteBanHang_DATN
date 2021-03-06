USE [master]
GO
/****** Object:  Database [WebsiteBanHang_DATN_VER2]    Script Date: 4/7/2021 9:44:28 AM ******/
CREATE DATABASE [WebsiteBanHang_DATN_VER2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebsiteBanHang_DATN_VER2', FILENAME = N'D:\TAI LIEU HOC TAP\DO AN TOT NGHIEP\DO AN TOT NGHIEP\WebsiteBanHang_DATN_VER2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WebsiteBanHang_DATN_VER2_log', FILENAME = N'D:\TAI LIEU HOC TAP\DO AN TOT NGHIEP\DO AN TOT NGHIEP\WebsiteBanHang_DATN_VER2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebsiteBanHang_DATN_VER2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET  MULTI_USER 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET QUERY_STORE = OFF
GO
USE [WebsiteBanHang_DATN_VER2]
GO
/****** Object:  Table [dbo].[tblNhaSanXuat]    Script Date: 4/7/2021 9:44:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNhaSanXuat](
	[iMaNSX] [int] IDENTITY(1,1) NOT NULL,
	[sTenNSX] [nvarchar](100) NOT NULL,
	[sDiachi] [nvarchar](100) NULL,
	[sSdt] [varchar](20) NULL,
	[dThoigiantao] [datetime] NULL,
	[dThoigiansua] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[iMaNSX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDonNhapHang]    Script Date: 4/7/2021 9:44:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDonNhapHang](
	[sMaDonNhapHang] [varchar](10) NOT NULL,
	[iMaNV] [int] NOT NULL,
	[iMaNSX] [int] NOT NULL,
	[dNgaynhap] [datetime] NULL,
	[dThoigiantao] [datetime] NULL,
	[dThoigiansua] [datetime] NULL,
	[iMaTrangThai] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sMaDonNhapHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblChiTietNhapHang]    Script Date: 4/7/2021 9:44:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblChiTietNhapHang](
	[sMaDonNhapHang] [varchar](10) NOT NULL,
	[sMaMH] [varchar](10) NOT NULL,
	[fGianhap] [float] NOT NULL,
	[iSoluongnhap] [int] NOT NULL,
	[iMaSize] [int] NOT NULL,
	[fMucchietkhau] [float] NULL,
	[dThoigiantao] [datetime] NULL,
	[dThoigiansua] [datetime] NULL,
 CONSTRAINT [PK_Primar] PRIMARY KEY CLUSTERED 
(
	[sMaDonNhapHang] ASC,
	[sMaMH] ASC,
	[iMaSize] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_MH_theoNSX]    Script Date: 4/7/2021 9:44:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_MH_theoNSX]
	AS
		SELECT tblNhaSanXuat.iMaNSX,sTenNSX,sMaMH,COUNT(sMaMH) AS [SL]
		FROM tblNhaSanXuat,tblChiTietNhapHang,tblDonNhapHang
		WHERE tblDonNhapHang.sMaDonNhapHang = tblChiTietNhapHang.sMaDonNhapHang 
		AND tblNhaSanXuat.iMaNSX = tblDonNhapHang.iMaNSX 
		GROUP BY tblNhaSanXuat.iMaNSX,sTenNSX,sMaMH
GO
/****** Object:  Table [dbo].[tblMatHang]    Script Date: 4/7/2021 9:44:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMatHang](
	[sMaMH] [varchar](10) NOT NULL,
	[sTenMH] [nvarchar](100) NOT NULL,
	[sHinhanh] [varchar](50) NOT NULL,
	[sDonvitinh] [nvarchar](10) NOT NULL,
	[sMota] [nvarchar](255) NOT NULL,
	[iMaLoaiMH] [int] NOT NULL,
	[dThoigiantao] [datetime] NULL,
	[dThoigiansua] [datetime] NULL,
	[iMaTrangThai] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sMaMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblChiTietDatHang]    Script Date: 4/7/2021 9:44:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblChiTietDatHang](
	[sMaDonDatHang] [varchar](10) NOT NULL,
	[sMaMH] [varchar](10) NOT NULL,
	[iSLMua] [int] NOT NULL,
	[iMaKM] [int] NULL,
	[dThoigiantao] [datetime] NULL,
	[dThoigiansua] [datetime] NULL,
	[iMaSize] [int] NOT NULL,
 CONSTRAINT [PK_CTDH] PRIMARY KEY CLUSTERED 
(
	[sMaDonDatHang] ASC,
	[sMaMH] ASC,
	[iMaSize] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_chitietDonhang]    Script Date: 4/7/2021 9:44:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--view lay chi tiet don hang 
CREATE VIEW [dbo].[vw_chitietDonhang]
AS
	SELECT sMaDonDatHang,fGianhap,iSLMua,(fGianhap*iSLMua) AS [fThanhtien]
	FROM tblChiTietNhapHang,tblChiTietDatHang,tblMatHang
	WHERE tblChiTietNhapHang.sMaMH = tblMatHang.sMaMH AND tblChiTietDatHang.sMaMH = tblMatHang.sMaMH
	GROUP BY sMaDonDatHang,fGianhap,iSLMua
GO
/****** Object:  Table [dbo].[tblNhanVien]    Script Date: 4/7/2021 9:44:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNhanVien](
	[iMaNV] [int] IDENTITY(1,1) NOT NULL,
	[sTenNV] [nvarchar](50) NOT NULL,
	[sGioitinh] [nvarchar](5) NULL,
	[dNgaysinh] [datetime] NULL,
	[sSdt] [varchar](20) NULL,
	[sQuequan] [nvarchar](20) NULL,
	[sEmail] [varchar](50) NULL,
	[dNgayvaolam] [datetime] NULL,
	[sTenDangNhap] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iMaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_chitietDonnhaphang]    Script Date: 4/7/2021 9:44:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_chitietDonnhaphang]
AS
	SELECT tblDonNhapHang.sMaDonNhapHang,fGianhap,iSoluongnhap,fMucchietkhau,(fGianhap*iSoluongnhap) AS [fThanhtien],((fGianhap*iSoluongnhap) - (fGianhap*iSoluongnhap*(fMucchietkhau/100))) AS [fThanhtien_Sauchietkhau]
	FROM tblDonNhapHang,tblNhaSanXuat,tblNhanVien,tblChiTietNhapHang,tblMatHang
	WHERE tblNhanVien.iMaNV = tblDonNhapHang.iMaNV AND tblDonNhapHang.sMaDonNhapHang = tblChiTietNhapHang.sMaDonNhapHang 
		AND tblChiTietNhapHang.sMaMH = tblMatHang.sMaMH AND tblNhaSanXuat.iMaNSX = tblDonNhapHang.iMaNSX
GO
/****** Object:  Table [dbo].[tblDanhMuc]    Script Date: 4/7/2021 9:44:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDanhMuc](
	[iMaDM] [int] IDENTITY(1,1) NOT NULL,
	[sTenDM] [nvarchar](50) NOT NULL,
	[dThoigiantao] [datetime] NULL,
	[dThoigiansua] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[iMaDM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDonDatHang]    Script Date: 4/7/2021 9:44:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDonDatHang](
	[sMaDonDatHang] [varchar](10) NOT NULL,
	[iMaNV] [int] NOT NULL,
	[iMaKH] [int] NOT NULL,
	[dNgaydathang] [datetime] NULL,
	[dNgaygiaohang] [datetime] NULL,
	[sDiachigiaohang] [nvarchar](100) NULL,
	[dThoigiantao] [datetime] NULL,
	[dThoigiansua] [datetime] NULL,
	[iMaTrangThai] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sMaDonDatHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHeThong]    Script Date: 4/7/2021 9:44:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHeThong](
	[sMaCuaHang] [varchar](50) NOT NULL,
	[sTenCuaHang] [nvarchar](255) NOT NULL,
	[sSdt] [varchar](20) NULL,
	[sEmail] [varchar](50) NULL,
	[sDiaChi] [nvarchar](255) NULL,
	[sGioMoCua] [varchar](10) NULL,
	[sGioDongCua] [varchar](10) NULL,
	[sMoTa] [nvarchar](255) NULL,
	[sTenDangNhap] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sMaCuaHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblKhachHang]    Script Date: 4/7/2021 9:44:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblKhachHang](
	[iMaKH] [int] IDENTITY(1,1) NOT NULL,
	[sTenKH] [nvarchar](100) NOT NULL,
	[sSdt] [varchar](20) NULL,
	[dNgaysinh] [datetime] NULL,
	[sGioitinh] [nvarchar](5) NULL,
	[sEmail] [varchar](50) NULL,
	[sDiachi] [nvarchar](100) NULL,
	[sTenDangNhap] [varchar](50) NULL,
	[dThoigiantao] [datetime] NULL,
	[dThoigiansua] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[iMaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblKho]    Script Date: 4/7/2021 9:44:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblKho](
	[iMaKho] [int] IDENTITY(1,1) NOT NULL,
	[sMaMH] [varchar](10) NOT NULL,
	[iSoluong] [int] NOT NULL,
	[iMaSize] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iMaKho] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblKhuyenMai]    Script Date: 4/7/2021 9:44:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblKhuyenMai](
	[iMaKM] [int] IDENTITY(1,1) NOT NULL,
	[sTenKM] [nvarchar](255) NULL,
	[sMota] [nvarchar](255) NULL,
	[sDonvitinh] [nvarchar](10) NULL,
	[dThoigianbatdau] [datetime] NULL,
	[dThoigianketthuc] [datetime] NULL,
	[dThoigiantao] [datetime] NULL,
	[dThoigiansua] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[iMaKM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLoaiMatHang]    Script Date: 4/7/2021 9:44:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLoaiMatHang](
	[iMaLoaiMH] [int] IDENTITY(1,1) NOT NULL,
	[sTenLoaiMH] [nvarchar](50) NOT NULL,
	[dThoigiantao] [datetime] NULL,
	[dThoigiansua] [datetime] NULL,
	[iMaDM] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iMaLoaiMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLoaiTrangThai]    Script Date: 4/7/2021 9:44:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLoaiTrangThai](
	[iMaLoaiTrangThai] [int] IDENTITY(1,1) NOT NULL,
	[sTenLoaiTrangThai] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[iMaLoaiTrangThai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPhieuNhapKho]    Script Date: 4/7/2021 9:44:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPhieuNhapKho](
	[sMaPhieuNhapKho] [varchar](10) NOT NULL,
	[iMaNV] [int] NOT NULL,
	[dNgaynhapkho] [datetime] NULL,
	[dThoigiantao] [datetime] NULL,
	[dThoigiansua] [datetime] NULL,
	[iMaTrangThai] [int] NOT NULL,
	[iMaKho] [int] NOT NULL,
	[sMaDonNhapHang] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sMaPhieuNhapKho] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPhieuXuatKho]    Script Date: 4/7/2021 9:44:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPhieuXuatKho](
	[sMaPhieuXuatKho] [varchar](10) NOT NULL,
	[iMaNV] [int] NOT NULL,
	[dNgayxuat] [datetime] NULL,
	[dThoigiantao] [datetime] NULL,
	[dThoigiansua] [datetime] NULL,
	[iMaTrangThai] [int] NOT NULL,
	[iMaKho] [int] NOT NULL,
	[sMaDonDatHang] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sMaPhieuXuatKho] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblQuyen]    Script Date: 4/7/2021 9:44:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuyen](
	[iMaQuyen] [int] IDENTITY(1,1) NOT NULL,
	[sTenQuyen] [nvarchar](50) NULL,
	[dThoigiantao] [datetime] NULL,
	[dThoigiansua] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[iMaQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSize]    Script Date: 4/7/2021 9:44:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSize](
	[iMaSize] [int] IDENTITY(1,1) NOT NULL,
	[sTenSize] [varchar](5) NULL,
	[sChieucao] [varchar](20) NULL,
	[sCannang] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[iMaSize] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTaiKhoan]    Script Date: 4/7/2021 9:44:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTaiKhoan](
	[sTenDangNhap] [varchar](50) NOT NULL,
	[sMatKhau] [varchar](50) NOT NULL,
	[sAnhdaidien] [varchar](20) NULL,
	[iMaTrangThai] [int] NOT NULL,
	[iMaQuyen] [int] NOT NULL,
	[dThoigiantao] [datetime] NULL,
	[dThoigiansua] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sTenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTrangThai]    Script Date: 4/7/2021 9:44:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTrangThai](
	[iMaTrangThai] [int] IDENTITY(1,1) NOT NULL,
	[sTenTrangThai] [nvarchar](50) NULL,
	[iMaLoaiTrangThai] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iMaTrangThai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblChiTietDatHang] ([sMaDonDatHang], [sMaMH], [iSLMua], [iMaKM], [dThoigiantao], [dThoigiansua], [iMaSize]) VALUES (N'DDS-DDH-1', N'DDS-MH-1', 6, 1, CAST(N'2021-04-01T15:46:04.243' AS DateTime), NULL, 1)
INSERT [dbo].[tblChiTietDatHang] ([sMaDonDatHang], [sMaMH], [iSLMua], [iMaKM], [dThoigiantao], [dThoigiansua], [iMaSize]) VALUES (N'DDS-DDH-1', N'DDS-MH-1', 2, 1, CAST(N'2021-04-01T16:16:50.477' AS DateTime), NULL, 3)
INSERT [dbo].[tblChiTietDatHang] ([sMaDonDatHang], [sMaMH], [iSLMua], [iMaKM], [dThoigiantao], [dThoigiansua], [iMaSize]) VALUES (N'DDS-DDH-10', N'DDS-MH-14', 2, 1, CAST(N'2021-04-02T16:34:25.477' AS DateTime), NULL, 1)
INSERT [dbo].[tblChiTietDatHang] ([sMaDonDatHang], [sMaMH], [iSLMua], [iMaKM], [dThoigiantao], [dThoigiansua], [iMaSize]) VALUES (N'DDS-DDH-10', N'DDS-MH-31', 4, 1, CAST(N'2021-04-02T16:34:25.477' AS DateTime), NULL, 3)
INSERT [dbo].[tblChiTietDatHang] ([sMaDonDatHang], [sMaMH], [iSLMua], [iMaKM], [dThoigiantao], [dThoigiansua], [iMaSize]) VALUES (N'DDS-DDH-2', N'DDS-MH-1', 2, 1, CAST(N'2021-04-01T16:57:32.547' AS DateTime), NULL, 1)
INSERT [dbo].[tblChiTietDatHang] ([sMaDonDatHang], [sMaMH], [iSLMua], [iMaKM], [dThoigiantao], [dThoigiansua], [iMaSize]) VALUES (N'DDS-DDH-3', N'DDS-MH-1', 4, 1, CAST(N'2021-04-01T16:26:18.970' AS DateTime), NULL, 1)
INSERT [dbo].[tblChiTietDatHang] ([sMaDonDatHang], [sMaMH], [iSLMua], [iMaKM], [dThoigiantao], [dThoigiansua], [iMaSize]) VALUES (N'DDS-DDH-3', N'DDS-MH-1', 1, 1, CAST(N'2021-04-01T16:26:31.340' AS DateTime), NULL, 3)
INSERT [dbo].[tblChiTietDatHang] ([sMaDonDatHang], [sMaMH], [iSLMua], [iMaKM], [dThoigiantao], [dThoigiansua], [iMaSize]) VALUES (N'DDS-DDH-4', N'DDS-MH-1', 2, 1, CAST(N'2021-04-02T02:53:03.157' AS DateTime), NULL, 1)
INSERT [dbo].[tblChiTietDatHang] ([sMaDonDatHang], [sMaMH], [iSLMua], [iMaKM], [dThoigiantao], [dThoigiansua], [iMaSize]) VALUES (N'DDS-DDH-5', N'DDS-MH-16', 2, 1, CAST(N'2021-04-02T05:32:57.033' AS DateTime), NULL, 1)
INSERT [dbo].[tblChiTietDatHang] ([sMaDonDatHang], [sMaMH], [iSLMua], [iMaKM], [dThoigiantao], [dThoigiansua], [iMaSize]) VALUES (N'DDS-DDH-5', N'DDS-MH-32', 1, 1, CAST(N'2021-04-02T03:19:56.417' AS DateTime), NULL, 1)
INSERT [dbo].[tblChiTietDatHang] ([sMaDonDatHang], [sMaMH], [iSLMua], [iMaKM], [dThoigiantao], [dThoigiansua], [iMaSize]) VALUES (N'DDS-DDH-5', N'DDS-MH-32', 2, 1, CAST(N'2021-04-02T03:19:56.423' AS DateTime), NULL, 4)
INSERT [dbo].[tblChiTietDatHang] ([sMaDonDatHang], [sMaMH], [iSLMua], [iMaKM], [dThoigiantao], [dThoigiansua], [iMaSize]) VALUES (N'DDS-DDH-6', N'DDS-MH-18', 1, 1, CAST(N'2021-04-02T05:38:02.977' AS DateTime), NULL, 1)
INSERT [dbo].[tblChiTietDatHang] ([sMaDonDatHang], [sMaMH], [iSLMua], [iMaKM], [dThoigiantao], [dThoigiansua], [iMaSize]) VALUES (N'DDS-DDH-7', N'DDS-MH-15', 1, 1, CAST(N'2021-04-02T05:48:12.523' AS DateTime), NULL, 1)
INSERT [dbo].[tblChiTietDatHang] ([sMaDonDatHang], [sMaMH], [iSLMua], [iMaKM], [dThoigiantao], [dThoigiansua], [iMaSize]) VALUES (N'DDS-DDH-8', N'DDS-MH-14', 1, 1, CAST(N'2021-04-02T05:50:38.370' AS DateTime), NULL, 1)
INSERT [dbo].[tblChiTietDatHang] ([sMaDonDatHang], [sMaMH], [iSLMua], [iMaKM], [dThoigiantao], [dThoigiansua], [iMaSize]) VALUES (N'DDS-DDH-8', N'DDS-MH-18', 1, 1, CAST(N'2021-04-02T05:50:38.377' AS DateTime), NULL, 1)
INSERT [dbo].[tblChiTietDatHang] ([sMaDonDatHang], [sMaMH], [iSLMua], [iMaKM], [dThoigiantao], [dThoigiansua], [iMaSize]) VALUES (N'DDS-DDH-9', N'DDS-MH-16', 1, 1, CAST(N'2021-04-02T05:57:00.613' AS DateTime), NULL, 1)
INSERT [dbo].[tblChiTietDatHang] ([sMaDonDatHang], [sMaMH], [iSLMua], [iMaKM], [dThoigiantao], [dThoigiansua], [iMaSize]) VALUES (N'DDS-DDH-9', N'DDS-MH-21', 4, 1, CAST(N'2021-04-02T05:57:00.620' AS DateTime), NULL, 2)
GO
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-1', N'DDS-MH-1', 200000, 500, 1, 5, CAST(N'2021-04-01T23:35:27.657' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-1', N'DDS-MH-32', 160000, 500, 2, 5, CAST(N'2021-04-01T22:47:12.723' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-11', 50000, 500, 1, 15, CAST(N'2021-04-02T00:36:36.773' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-11', 50000, 500, 2, 15, CAST(N'2021-04-02T00:37:08.237' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-11', 50000, 500, 3, 15, CAST(N'2021-04-02T00:37:47.260' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-11', 50000, 500, 4, 15, CAST(N'2021-04-02T00:37:59.027' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-12', 50000, 1000, 1, 20, CAST(N'2021-04-02T00:35:21.120' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-12', 50000, 1000, 2, 20, CAST(N'2021-04-02T00:35:31.310' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-12', 50000, 1000, 3, 20, CAST(N'2021-04-02T00:36:16.320' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-12', 50000, 1000, 4, 20, CAST(N'2021-04-02T00:36:26.023' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-13', 50000, 1000, 1, 20, CAST(N'2021-04-02T00:34:26.973' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-13', 50000, 1000, 2, 20, CAST(N'2021-04-02T00:34:41.200' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-13', 50000, 1000, 3, 20, CAST(N'2021-04-02T00:34:56.683' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-13', 50000, 1000, 4, 20, CAST(N'2021-04-02T00:35:08.657' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-14', 50000, 500, 1, 15, CAST(N'2021-04-02T00:33:31.053' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-14', 50000, 500, 2, 15, CAST(N'2021-04-02T00:33:44.510' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-14', 50000, 500, 3, 15, CAST(N'2021-04-02T00:33:54.880' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-14', 50000, 500, 4, 15, CAST(N'2021-04-02T00:34:13.893' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-15', 80000, 500, 1, 5, CAST(N'2021-04-02T00:32:08.657' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-15', 80000, 500, 2, 5, CAST(N'2021-04-02T00:32:44.880' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-15', 80000, 500, 3, 5, CAST(N'2021-04-02T00:32:58.013' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-15', 80000, 500, 4, 5, CAST(N'2021-04-02T00:33:09.387' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-16', 100000, 500, 1, 3, CAST(N'2021-04-02T00:30:58.330' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-16', 100000, 500, 2, 2, CAST(N'2021-04-02T00:31:09.910' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-16', 100000, 500, 3, 2, CAST(N'2021-04-02T00:31:25.933' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-16', 100000, 500, 4, 2, CAST(N'2021-04-02T00:31:55.053' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-17', 80000, 100, 1, 2, CAST(N'2021-04-02T00:28:57.313' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-17', 80000, 100, 2, 2, CAST(N'2021-04-02T00:29:17.583' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-17', 80000, 100, 3, 2, CAST(N'2021-04-02T00:30:23.733' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-17', 80000, 100, 4, 2, CAST(N'2021-04-02T00:30:34.900' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-18', 80000, 500, 1, 2, CAST(N'2021-04-02T00:28:02.867' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-18', 80000, 500, 2, 2, CAST(N'2021-04-02T00:28:13.457' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-18', 80000, 500, 3, 2, CAST(N'2021-04-02T00:28:26.840' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-18', 80000, 500, 4, 2, CAST(N'2021-04-02T00:28:44.353' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-19', 80000, 100, 1, 2, CAST(N'2021-04-02T00:26:51.730' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-19', 80000, 100, 2, 2, CAST(N'2021-04-02T00:27:25.247' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-19', 80000, 100, 3, 2, CAST(N'2021-04-02T00:27:35.940' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-19', 80000, 100, 4, 2, CAST(N'2021-04-02T00:27:45.300' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-20', 90000, 150, 1, 2, CAST(N'2021-04-02T00:25:02.557' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-20', 90000, 150, 2, 2, CAST(N'2021-04-02T00:25:44.247' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-20', 90000, 150, 3, 2, CAST(N'2021-04-02T00:25:53.140' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-20', 90000, 150, 4, 2, CAST(N'2021-04-02T00:26:02.967' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-21', 100000, 500, 1, 3, CAST(N'2021-04-02T00:24:08.263' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-21', 100000, 500, 2, 3, CAST(N'2021-04-02T00:24:18.467' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-21', 100000, 500, 3, 3, CAST(N'2021-04-02T00:24:34.173' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-21', 100000, 500, 4, 3, CAST(N'2021-04-02T00:24:45.980' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-22', 100000, 100, 1, 2, CAST(N'2021-04-02T00:22:53.327' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-22', 100000, 100, 2, 2, CAST(N'2021-04-02T00:23:02.417' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-22', 100000, 100, 3, 2, CAST(N'2021-04-02T00:23:45.473' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-22', 100000, 100, 4, 2, CAST(N'2021-04-02T00:23:54.357' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-23', 100000, 500, 1, 2, CAST(N'2021-04-02T00:21:31.620' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-23', 100000, 500, 2, 2, CAST(N'2021-04-02T00:22:13.033' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-23', 100000, 500, 3, 2, CAST(N'2021-04-02T00:22:22.120' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-23', 100000, 500, 4, 2, CAST(N'2021-04-02T00:22:32.650' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-24', 100000, 100, 1, 2, CAST(N'2021-04-02T00:18:53.707' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-24', 100000, 100, 2, 2, CAST(N'2021-04-02T00:19:02.003' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-24', 100000, 100, 3, 2, CAST(N'2021-04-02T00:20:34.453' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-24', 100000, 100, 4, 2, CAST(N'2021-04-02T00:21:14.170' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-25', 100000, 100, 1, 2, CAST(N'2021-04-02T00:18:10.183' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-25', 100000, 100, 2, 2, CAST(N'2021-04-02T00:18:20.460' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-25', 100000, 100, 3, 2, CAST(N'2021-04-02T00:18:30.173' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-25', 100000, 100, 4, 2, CAST(N'2021-04-02T00:18:41.763' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-26', 80000, 150, 1, 2, CAST(N'2021-04-02T00:12:35.653' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-26', 100000, 150, 2, 2, CAST(N'2021-04-02T00:12:57.420' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-26', 100000, 100, 3, 2, CAST(N'2021-04-02T00:17:43.097' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-26', 100000, 100, 4, 2, CAST(N'2021-04-02T00:17:58.097' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-27', 100000, 500, 1, 2, CAST(N'2021-04-02T00:11:47.380' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-27', 100000, 500, 2, 2, CAST(N'2021-04-02T00:11:58.200' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-27', 100000, 500, 3, 2, CAST(N'2021-04-02T00:12:08.340' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-27', 100000, 500, 4, 2, CAST(N'2021-04-02T00:12:19.360' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-28', 80000, 100, 1, 2, CAST(N'2021-04-02T00:09:47.397' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-28', 80000, 100, 2, 2, CAST(N'2021-04-02T00:09:58.820' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-28', 80000, 100, 3, 2, CAST(N'2021-04-02T00:10:12.210' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-28', 80000, 100, 4, 2, CAST(N'2021-04-02T00:10:26.893' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-29', 160000, 100, 1, 3, CAST(N'2021-04-02T00:06:25.910' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-29', 160000, 100, 2, 3, CAST(N'2021-04-02T00:06:37.180' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-29', 160000, 100, 3, 3, CAST(N'2021-04-02T00:08:07.913' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-29', 160000, 100, 4, 3, CAST(N'2021-04-02T00:08:19.850' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-29', 160000, 100, 6, 3, CAST(N'2021-04-02T00:08:30.497' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-30', 200000, 100, 1, 5, CAST(N'2021-04-02T00:02:39.527' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-30', 160000, 100, 2, 3, CAST(N'2021-04-02T00:03:02.100' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-30', 160000, 100, 3, 3, CAST(N'2021-04-02T00:03:27.200' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-30', 160000, 100, 4, 3, CAST(N'2021-04-02T00:03:41.640' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-31', 160000, 500, 1, 5, CAST(N'2021-04-02T00:01:27.990' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-31', 160000, 500, 2, 5, CAST(N'2021-04-02T00:01:43.590' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-31', 160000, 500, 3, 5, CAST(N'2021-04-02T00:02:08.850' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-31', 160000, 500, 4, 5, CAST(N'2021-04-02T00:02:21.477' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-32', 160000, 500, 1, 5, CAST(N'2021-04-02T00:00:21.907' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-32', 160000, 500, 2, 5, CAST(N'2021-04-02T00:00:49.607' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-32', 160000, 500, 3, 5, CAST(N'2021-04-02T00:01:04.293' AS DateTime), NULL)
INSERT [dbo].[tblChiTietNhapHang] ([sMaDonNhapHang], [sMaMH], [fGianhap], [iSoluongnhap], [iMaSize], [fMucchietkhau], [dThoigiantao], [dThoigiansua]) VALUES (N'DDS-DNH-2', N'DDS-MH-32', 160000, 500, 4, 5, CAST(N'2021-04-02T00:01:19.373' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[tblDanhMuc] ON 

INSERT [dbo].[tblDanhMuc] ([iMaDM], [sTenDM], [dThoigiantao], [dThoigiansua]) VALUES (1, N'Thời trang thể thao', NULL, NULL)
INSERT [dbo].[tblDanhMuc] ([iMaDM], [sTenDM], [dThoigiantao], [dThoigiansua]) VALUES (2, N'Phụ kiện thể thao', NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblDanhMuc] OFF
GO
INSERT [dbo].[tblDonDatHang] ([sMaDonDatHang], [iMaNV], [iMaKH], [dNgaydathang], [dNgaygiaohang], [sDiachigiaohang], [dThoigiantao], [dThoigiansua], [iMaTrangThai]) VALUES (N'DDS-DDH-1', 4, 3, CAST(N'2021-04-01T15:36:15.623' AS DateTime), CAST(N'2021-03-30T00:00:00.000' AS DateTime), N'Tích Sơn, Vĩnh Yên, Vĩnh Phúc', CAST(N'2021-04-01T15:36:15.623' AS DateTime), NULL, 4)
INSERT [dbo].[tblDonDatHang] ([sMaDonDatHang], [iMaNV], [iMaKH], [dNgaydathang], [dNgaygiaohang], [sDiachigiaohang], [dThoigiantao], [dThoigiansua], [iMaTrangThai]) VALUES (N'DDS-DDH-10', 4, 17, CAST(N'2021-04-02T16:34:25.463' AS DateTime), CAST(N'2021-04-07T00:00:00.000' AS DateTime), N'Tích Sơn, Vĩnh Yên, Vĩnh Phúc', CAST(N'2021-04-02T16:34:25.463' AS DateTime), CAST(N'2021-04-02T16:35:38.807' AS DateTime), 3)
INSERT [dbo].[tblDonDatHang] ([sMaDonDatHang], [iMaNV], [iMaKH], [dNgaydathang], [dNgaygiaohang], [sDiachigiaohang], [dThoigiantao], [dThoigiansua], [iMaTrangThai]) VALUES (N'DDS-DDH-2', 1, 4, CAST(N'2021-04-01T16:19:17.177' AS DateTime), CAST(N'2021-04-16T00:00:00.000' AS DateTime), N'Định Công, Hoàng Mai, Hà Nội', CAST(N'2021-04-01T16:19:17.177' AS DateTime), NULL, 4)
INSERT [dbo].[tblDonDatHang] ([sMaDonDatHang], [iMaNV], [iMaKH], [dNgaydathang], [dNgaygiaohang], [sDiachigiaohang], [dThoigiantao], [dThoigiansua], [iMaTrangThai]) VALUES (N'DDS-DDH-3', 1, 5, CAST(N'2021-04-01T16:22:56.723' AS DateTime), CAST(N'2021-04-16T00:00:00.000' AS DateTime), N'Định Công, Hoàng Mai, Hà Nội', CAST(N'2021-04-01T16:22:56.723' AS DateTime), CAST(N'2021-04-01T16:40:41.130' AS DateTime), 3)
INSERT [dbo].[tblDonDatHang] ([sMaDonDatHang], [iMaNV], [iMaKH], [dNgaydathang], [dNgaygiaohang], [sDiachigiaohang], [dThoigiantao], [dThoigiansua], [iMaTrangThai]) VALUES (N'DDS-DDH-4', 1, 6, CAST(N'2021-04-02T02:52:06.293' AS DateTime), CAST(N'2021-04-05T00:00:00.000' AS DateTime), N'Tích Sơn, Vĩnh Yên, Vĩnh Phúc', CAST(N'2021-04-02T02:52:06.293' AS DateTime), NULL, 4)
INSERT [dbo].[tblDonDatHang] ([sMaDonDatHang], [iMaNV], [iMaKH], [dNgaydathang], [dNgaygiaohang], [sDiachigiaohang], [dThoigiantao], [dThoigiansua], [iMaTrangThai]) VALUES (N'DDS-DDH-5', 4, 9, CAST(N'2021-04-02T03:19:56.407' AS DateTime), CAST(N'2021-04-05T00:00:00.000' AS DateTime), N'Tích Sơn, Vĩnh Yên, Vĩnh Phúc', CAST(N'2021-04-02T03:19:56.407' AS DateTime), NULL, 4)
INSERT [dbo].[tblDonDatHang] ([sMaDonDatHang], [iMaNV], [iMaKH], [dNgaydathang], [dNgaygiaohang], [sDiachigiaohang], [dThoigiantao], [dThoigiansua], [iMaTrangThai]) VALUES (N'DDS-DDH-6', 4, 14, CAST(N'2021-04-02T05:38:02.960' AS DateTime), CAST(N'2021-04-07T00:00:00.000' AS DateTime), N'Tích Sơn, Vĩnh Yên, Vĩnh Phúc', CAST(N'2021-04-02T05:38:02.960' AS DateTime), NULL, 4)
INSERT [dbo].[tblDonDatHang] ([sMaDonDatHang], [iMaNV], [iMaKH], [dNgaydathang], [dNgaygiaohang], [sDiachigiaohang], [dThoigiantao], [dThoigiansua], [iMaTrangThai]) VALUES (N'DDS-DDH-7', 4, 15, CAST(N'2021-04-02T05:48:12.510' AS DateTime), CAST(N'2021-04-08T00:00:00.000' AS DateTime), N'Tích Sơn, Vĩnh Yên, Vĩnh Phúc', CAST(N'2021-04-02T05:48:12.510' AS DateTime), NULL, 4)
INSERT [dbo].[tblDonDatHang] ([sMaDonDatHang], [iMaNV], [iMaKH], [dNgaydathang], [dNgaygiaohang], [sDiachigiaohang], [dThoigiantao], [dThoigiansua], [iMaTrangThai]) VALUES (N'DDS-DDH-8', 4, 12, CAST(N'2021-04-02T05:50:38.357' AS DateTime), CAST(N'2021-04-07T00:00:00.000' AS DateTime), N'Lê Thanh Nghị, Hai Bà Trưng, Hà Nội', CAST(N'2021-04-02T05:50:38.357' AS DateTime), NULL, 4)
INSERT [dbo].[tblDonDatHang] ([sMaDonDatHang], [iMaNV], [iMaKH], [dNgaydathang], [dNgaygiaohang], [sDiachigiaohang], [dThoigiantao], [dThoigiansua], [iMaTrangThai]) VALUES (N'DDS-DDH-9', 4, 16, CAST(N'2021-04-02T05:57:00.610' AS DateTime), CAST(N'2021-04-06T00:00:00.000' AS DateTime), N'Tích Sơn, Vĩnh Yên, Vĩnh Phúc', CAST(N'2021-04-02T05:57:00.610' AS DateTime), CAST(N'2021-04-02T14:05:04.033' AS DateTime), 3)
GO
INSERT [dbo].[tblDonNhapHang] ([sMaDonNhapHang], [iMaNV], [iMaNSX], [dNgaynhap], [dThoigiantao], [dThoigiansua], [iMaTrangThai]) VALUES (N'DDS-DNH-1', 1, 1, CAST(N'2021-03-30T00:00:00.000' AS DateTime), CAST(N'2021-03-30T00:00:00.000' AS DateTime), CAST(N'2021-04-02T15:39:42.210' AS DateTime), 6)
INSERT [dbo].[tblDonNhapHang] ([sMaDonNhapHang], [iMaNV], [iMaNSX], [dNgaynhap], [dThoigiantao], [dThoigiansua], [iMaTrangThai]) VALUES (N'DDS-DNH-2', 1, 6, CAST(N'2021-04-01T13:39:04.400' AS DateTime), CAST(N'2021-04-01T13:39:04.400' AS DateTime), CAST(N'2021-04-01T16:51:45.737' AS DateTime), 6)
GO
INSERT [dbo].[tblHeThong] ([sMaCuaHang], [sTenCuaHang], [sSdt], [sEmail], [sDiaChi], [sGioMoCua], [sGioDongCua], [sMoTa], [sTenDangNhap]) VALUES (N'DDS_CH001', N'Cửa hàng dụng cụ, thời trang thể thao Đông Dương Sport', N'098886666', N'dongduongsport@gmail.com', N'88 Lê Thanh Nghị, Hai Bà Trưng, Hà Nội', N'8h', N'22h', NULL, N'admin')
GO
SET IDENTITY_INSERT [dbo].[tblKhachHang] ON 

INSERT [dbo].[tblKhachHang] ([iMaKH], [sTenKH], [sSdt], [dNgaysinh], [sGioitinh], [sEmail], [sDiachi], [sTenDangNhap], [dThoigiantao], [dThoigiansua]) VALUES (1, N'Khách hàng Test', N'0965265114', NULL, NULL, NULL, N'Định Công, Hoàng Mai, Hà Nội', N'khachhang', CAST(N'2021-03-30T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[tblKhachHang] ([iMaKH], [sTenKH], [sSdt], [dNgaysinh], [sGioitinh], [sEmail], [sDiachi], [sTenDangNhap], [dThoigiantao], [dThoigiansua]) VALUES (2, N'Khách hàng Test 2', N'0965265984', NULL, NULL, NULL, N'Tích Sơn, Vĩnh Yên, Vĩnh Phúc', N'khachhangtest', CAST(N'2021-03-31T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[tblKhachHang] ([iMaKH], [sTenKH], [sSdt], [dNgaysinh], [sGioitinh], [sEmail], [sDiachi], [sTenDangNhap], [dThoigiantao], [dThoigiansua]) VALUES (3, N'Vũ Thị Linh', N'0954526564', NULL, NULL, NULL, N'Tích Sơn, Vĩnh Yên, Vĩnh Phúc', N'vtl14012000', CAST(N'2021-04-01T15:36:15.623' AS DateTime), NULL)
INSERT [dbo].[tblKhachHang] ([iMaKH], [sTenKH], [sSdt], [dNgaysinh], [sGioitinh], [sEmail], [sDiachi], [sTenDangNhap], [dThoigiantao], [dThoigiansua]) VALUES (4, N'', NULL, NULL, NULL, NULL, N'Định Công, Hoàng Mai, Hà Nội', NULL, CAST(N'2021-04-01T16:19:17.170' AS DateTime), NULL)
INSERT [dbo].[tblKhachHang] ([iMaKH], [sTenKH], [sSdt], [dNgaysinh], [sGioitinh], [sEmail], [sDiachi], [sTenDangNhap], [dThoigiantao], [dThoigiansua]) VALUES (5, N'', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-04-01T16:22:56.723' AS DateTime), NULL)
INSERT [dbo].[tblKhachHang] ([iMaKH], [sTenKH], [sSdt], [dNgaysinh], [sGioitinh], [sEmail], [sDiachi], [sTenDangNhap], [dThoigiantao], [dThoigiansua]) VALUES (6, N'Phạm Văn Giao', N'0962091604', NULL, NULL, NULL, N'Tích Sơn, Vĩnh Yên, Vĩnh Phúc', NULL, CAST(N'2021-04-02T02:52:06.290' AS DateTime), NULL)
INSERT [dbo].[tblKhachHang] ([iMaKH], [sTenKH], [sSdt], [dNgaysinh], [sGioitinh], [sEmail], [sDiachi], [sTenDangNhap], [dThoigiantao], [dThoigiansua]) VALUES (9, N'Nguyễn Văn A', N'0999996666', NULL, NULL, NULL, N'Tích Sơn, Vĩnh Yên, Vĩnh Phúc', NULL, CAST(N'2021-04-02T03:19:56.407' AS DateTime), NULL)
INSERT [dbo].[tblKhachHang] ([iMaKH], [sTenKH], [sSdt], [dNgaysinh], [sGioitinh], [sEmail], [sDiachi], [sTenDangNhap], [dThoigiantao], [dThoigiansua]) VALUES (10, N'Hoàng Thành B', N'0933334444', NULL, NULL, NULL, N'Lê Thanh Nghị, Hai Bà Trưng, Hà Nội', N'bhoa', CAST(N'2021-04-02T04:25:42.310' AS DateTime), NULL)
INSERT [dbo].[tblKhachHang] ([iMaKH], [sTenKH], [sSdt], [dNgaysinh], [sGioitinh], [sEmail], [sDiachi], [sTenDangNhap], [dThoigiantao], [dThoigiansua]) VALUES (11, N'Đinh Hoàng Nam', N'0912345678', NULL, NULL, NULL, N'Lê Thanh Nghị, Hai Bà Trưng, Hà Nội', N'khachhang123', CAST(N'2021-04-02T04:30:38.227' AS DateTime), NULL)
INSERT [dbo].[tblKhachHang] ([iMaKH], [sTenKH], [sSdt], [dNgaysinh], [sGioitinh], [sEmail], [sDiachi], [sTenDangNhap], [dThoigiantao], [dThoigiansua]) VALUES (12, N'Phạm Ngọc Quỳnh', N'0972107672', NULL, NULL, NULL, N'Lê Thanh Nghị, Hai Bà Trưng, Hà Nội', N'ngocquynh', CAST(N'2021-04-02T04:32:42.143' AS DateTime), NULL)
INSERT [dbo].[tblKhachHang] ([iMaKH], [sTenKH], [sSdt], [dNgaysinh], [sGioitinh], [sEmail], [sDiachi], [sTenDangNhap], [dThoigiantao], [dThoigiansua]) VALUES (13, N'Phạm Thanh Tuấn', N'0978744444', NULL, NULL, NULL, N'Tích Sơn, Vĩnh Yên, Vĩnh Phúc', NULL, CAST(N'2021-04-02T05:08:45.837' AS DateTime), NULL)
INSERT [dbo].[tblKhachHang] ([iMaKH], [sTenKH], [sSdt], [dNgaysinh], [sGioitinh], [sEmail], [sDiachi], [sTenDangNhap], [dThoigiantao], [dThoigiansua]) VALUES (14, N'Nguyễn Văn A', N'0999996666', NULL, NULL, NULL, N'Tích Sơn, Vĩnh Yên, Vĩnh Phúc', NULL, CAST(N'2021-04-02T05:38:02.960' AS DateTime), NULL)
INSERT [dbo].[tblKhachHang] ([iMaKH], [sTenKH], [sSdt], [dNgaysinh], [sGioitinh], [sEmail], [sDiachi], [sTenDangNhap], [dThoigiantao], [dThoigiansua]) VALUES (15, N'12312312312312', N'13123123123', NULL, NULL, NULL, N'Tích Sơn, Vĩnh Yên, Vĩnh Phúc', NULL, CAST(N'2021-04-02T05:48:12.510' AS DateTime), NULL)
INSERT [dbo].[tblKhachHang] ([iMaKH], [sTenKH], [sSdt], [dNgaysinh], [sGioitinh], [sEmail], [sDiachi], [sTenDangNhap], [dThoigiantao], [dThoigiansua]) VALUES (16, N'Test', N'0999996666', NULL, NULL, NULL, N'Tích Sơn, Vĩnh Yên, Vĩnh Phúc', NULL, CAST(N'2021-04-02T05:57:00.607' AS DateTime), NULL)
INSERT [dbo].[tblKhachHang] ([iMaKH], [sTenKH], [sSdt], [dNgaysinh], [sGioitinh], [sEmail], [sDiachi], [sTenDangNhap], [dThoigiantao], [dThoigiansua]) VALUES (17, N'Nguyễn Văn A', N'0999996666', NULL, NULL, NULL, N'Tích Sơn, Vĩnh Yên, Vĩnh Phúc', NULL, CAST(N'2021-04-02T16:34:25.460' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[tblKhachHang] OFF
GO
SET IDENTITY_INSERT [dbo].[tblKho] ON 

INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (2, N'DDS-MH-1', 1500, 1)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (3, N'DDS-MH-1', 1000, 2)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (4, N'DDS-MH-1', 1000, 3)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (5, N'DDS-MH-1', 1000, 4)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (7, N'DDS-MH-1', 1000, 6)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (9, N'DDS-MH-32', 500, 1)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (10, N'DDS-MH-32', 1000, 2)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (11, N'DDS-MH-32', 500, 3)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (12, N'DDS-MH-32', 500, 4)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (13, N'DDS-MH-11', 500, 1)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (14, N'DDS-MH-11', 500, 2)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (15, N'DDS-MH-11', 500, 3)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (16, N'DDS-MH-11', 500, 4)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (17, N'DDS-MH-12', 1000, 1)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (18, N'DDS-MH-12', 1000, 2)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (20, N'DDS-MH-12', 1000, 3)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (21, N'DDS-MH-12', 1000, 4)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (22, N'DDS-MH-13', 1000, 1)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (23, N'DDS-MH-13', 1000, 2)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (24, N'DDS-MH-13', 1000, 3)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (25, N'DDS-MH-13', 1000, 4)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (26, N'DDS-MH-14', 498, 1)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (27, N'DDS-MH-14', 500, 2)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (28, N'DDS-MH-14', 500, 3)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (29, N'DDS-MH-14', 500, 4)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (30, N'DDS-MH-15', 500, 1)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (31, N'DDS-MH-15', 500, 2)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (32, N'DDS-MH-15', 500, 3)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (33, N'DDS-MH-15', 500, 4)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (34, N'DDS-MH-16', 499, 1)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (35, N'DDS-MH-16', 500, 2)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (36, N'DDS-MH-16', 500, 3)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (37, N'DDS-MH-16', 500, 4)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (38, N'DDS-MH-17', 100, 1)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (39, N'DDS-MH-17', 100, 2)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (40, N'DDS-MH-17', 100, 3)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (41, N'DDS-MH-17', 100, 4)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (42, N'DDS-MH-18', 500, 1)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (43, N'DDS-MH-18', 500, 2)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (44, N'DDS-MH-18', 500, 3)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (45, N'DDS-MH-18', 500, 4)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (46, N'DDS-MH-19', 100, 1)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (47, N'DDS-MH-19', 100, 1)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (48, N'DDS-MH-19', 100, 2)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (49, N'DDS-MH-19', 100, 3)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (50, N'DDS-MH-19', 100, 4)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (51, N'DDS-MH-20', 150, 1)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (52, N'DDS-MH-20', 150, 2)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (53, N'DDS-MH-20', 150, 3)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (54, N'DDS-MH-20', 150, 4)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (56, N'DDS-MH-21', 500, 1)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (57, N'DDS-MH-21', 496, 2)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (58, N'DDS-MH-21', 500, 3)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (59, N'DDS-MH-21', 500, 4)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (62, N'DDS-MH-22', 100, 1)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (63, N'DDS-MH-22', 100, 2)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (64, N'DDS-MH-22', 100, 3)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (65, N'DDS-MH-22', 100, 4)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (66, N'DDS-MH-23', 100, 1)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (67, N'DDS-MH-23', 100, 2)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (68, N'DDS-MH-23', 100, 3)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (69, N'DDS-MH-23', 100, 4)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (71, N'DDS-MH-24', 100, 1)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (72, N'DDS-MH-24', 100, 2)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (73, N'DDS-MH-24', 100, 3)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (74, N'DDS-MH-24', 100, 4)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (75, N'DDS-MH-25', 100, 1)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (76, N'DDS-MH-25', 100, 2)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (77, N'DDS-MH-25', 100, 3)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (78, N'DDS-MH-25', 100, 4)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (79, N'DDS-MH-26', 150, 1)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (80, N'DDS-MH-26', 150, 2)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (81, N'DDS-MH-26', 150, 3)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (82, N'DDS-MH-26', 150, 4)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (83, N'DDS-MH-27', 500, 1)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (84, N'DDS-MH-27', 500, 2)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (85, N'DDS-MH-27', 500, 3)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (86, N'DDS-MH-27', 500, 4)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (88, N'DDS-MH-28', 100, 1)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (89, N'DDS-MH-28', 100, 2)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (90, N'DDS-MH-28', 100, 3)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (91, N'DDS-MH-28', 100, 4)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (92, N'DDS-MH-29', 100, 1)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (93, N'DDS-MH-29', 100, 2)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (94, N'DDS-MH-29', 100, 3)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (95, N'DDS-MH-29', 100, 4)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (96, N'DDS-MH-30', 100, 1)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (97, N'DDS-MH-30', 100, 2)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (98, N'DDS-MH-30', 100, 3)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (99, N'DDS-MH-30', 100, 4)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (100, N'DDS-MH-31', 500, 1)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (101, N'DDS-MH-31', 500, 2)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (102, N'DDS-MH-31', 496, 3)
INSERT [dbo].[tblKho] ([iMaKho], [sMaMH], [iSoluong], [iMaSize]) VALUES (103, N'DDS-MH-31', 500, 4)
SET IDENTITY_INSERT [dbo].[tblKho] OFF
GO
SET IDENTITY_INSERT [dbo].[tblKhuyenMai] ON 

INSERT [dbo].[tblKhuyenMai] ([iMaKM], [sTenKM], [sMota], [sDonvitinh], [dThoigianbatdau], [dThoigianketthuc], [dThoigiantao], [dThoigiansua]) VALUES (1, N'Giảm giá toàn bộ sản phẩm', N'Giảm giá toàn bộ sản phẩm', N'10%', CAST(N'2021-04-04T00:00:00.000' AS DateTime), CAST(N'2021-04-30T00:00:00.000' AS DateTime), CAST(N'2021-04-04T00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[tblKhuyenMai] OFF
GO
SET IDENTITY_INSERT [dbo].[tblLoaiMatHang] ON 

INSERT [dbo].[tblLoaiMatHang] ([iMaLoaiMH], [sTenLoaiMH], [dThoigiantao], [dThoigiansua], [iMaDM]) VALUES (1, N'Áo bóng đá câu lạc bộ', NULL, NULL, 1)
INSERT [dbo].[tblLoaiMatHang] ([iMaLoaiMH], [sTenLoaiMH], [dThoigiantao], [dThoigiansua], [iMaDM]) VALUES (2, N'Áo bóng đá đội tuyển quốc gia', NULL, NULL, 1)
INSERT [dbo].[tblLoaiMatHang] ([iMaLoaiMH], [sTenLoaiMH], [dThoigiantao], [dThoigiansua], [iMaDM]) VALUES (3, N'Áo bóng đá trẻ em', NULL, NULL, 1)
INSERT [dbo].[tblLoaiMatHang] ([iMaLoaiMH], [sTenLoaiMH], [dThoigiantao], [dThoigiansua], [iMaDM]) VALUES (5, N'Phụ kiện bóng đá', NULL, NULL, 2)
INSERT [dbo].[tblLoaiMatHang] ([iMaLoaiMH], [sTenLoaiMH], [dThoigiantao], [dThoigiansua], [iMaDM]) VALUES (7, N'Phụ kiện môn thể thao khác', NULL, NULL, 2)
INSERT [dbo].[tblLoaiMatHang] ([iMaLoaiMH], [sTenLoaiMH], [dThoigiantao], [dThoigiansua], [iMaDM]) VALUES (8, N'Áo bóng đá không logo', NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[tblLoaiMatHang] OFF
GO
SET IDENTITY_INSERT [dbo].[tblLoaiTrangThai] ON 

INSERT [dbo].[tblLoaiTrangThai] ([iMaLoaiTrangThai], [sTenLoaiTrangThai]) VALUES (1, N'Tài khoản')
INSERT [dbo].[tblLoaiTrangThai] ([iMaLoaiTrangThai], [sTenLoaiTrangThai]) VALUES (2, N'Đơn đặt hàng')
INSERT [dbo].[tblLoaiTrangThai] ([iMaLoaiTrangThai], [sTenLoaiTrangThai]) VALUES (3, N'Đơn nhập hàng')
INSERT [dbo].[tblLoaiTrangThai] ([iMaLoaiTrangThai], [sTenLoaiTrangThai]) VALUES (4, N'Phiếu nhập kho')
INSERT [dbo].[tblLoaiTrangThai] ([iMaLoaiTrangThai], [sTenLoaiTrangThai]) VALUES (5, N'Phiếu xuất kho')
INSERT [dbo].[tblLoaiTrangThai] ([iMaLoaiTrangThai], [sTenLoaiTrangThai]) VALUES (6, N'Mặt hàng')
INSERT [dbo].[tblLoaiTrangThai] ([iMaLoaiTrangThai], [sTenLoaiTrangThai]) VALUES (7, N'Tài khoản')
INSERT [dbo].[tblLoaiTrangThai] ([iMaLoaiTrangThai], [sTenLoaiTrangThai]) VALUES (8, N'Nhân Viên - Khách Hàng')
SET IDENTITY_INSERT [dbo].[tblLoaiTrangThai] OFF
GO
INSERT [dbo].[tblMatHang] ([sMaMH], [sTenMH], [sHinhanh], [sDonvitinh], [sMota], [iMaLoaiMH], [dThoigiantao], [dThoigiansua], [iMaTrangThai]) VALUES (N'DDS-MH-1', N'Áo bóng đá AC Milan sân nhà 2018 - 2019', N'aoclb_ac.png', N'Bộ', N'🎁Ưu đãi & Chính Sách Đặt Đội: ✔️ Từ 1 - 9 bộ: Miễn phí in ✔️ Từ 10 - 19 bộ: Miễn phí in + Tặng 1 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️ Từ 20 - 29 bộ: Miễn phí in + Tặng 2 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️', 1, CAST(N'2021-04-01T10:08:37.377' AS DateTime), CAST(N'2021-04-01T10:21:38.457' AS DateTime), 15)
INSERT [dbo].[tblMatHang] ([sMaMH], [sTenMH], [sHinhanh], [sDonvitinh], [sMota], [iMaLoaiMH], [dThoigiantao], [dThoigiansua], [iMaTrangThai]) VALUES (N'DDS-MH-10', N'Áo Bóng Đá Hàn Quốc Đỏ 2020 - 2021', N'aotuyen_han_do.png', N'Bộ', N'🎁Ưu đãi & Chính Sách Đặt Đội: ✔️ Từ 1 - 9 bộ: Miễn phí in ✔️ Từ 10 - 19 bộ: Miễn phí in + Tặng 1 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️ Từ 20 - 29 bộ: Miễn phí in + Tặng 2 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️', 2, CAST(N'2021-04-01T11:14:41.280' AS DateTime), CAST(N'2021-04-01T11:16:55.310' AS DateTime), 15)
INSERT [dbo].[tblMatHang] ([sMaMH], [sTenMH], [sHinhanh], [sDonvitinh], [sMota], [iMaLoaiMH], [dThoigiantao], [dThoigiansua], [iMaTrangThai]) VALUES (N'DDS-MH-11', N'Áo Tottenham Hospur 2020 - 2021 ps trắng', N'aoclb_tot.png', N'Bộ', N'🎁Ưu đãi & Chính Sách Đặt Đội: ✔️ Từ 1 - 9 bộ: Miễn phí in ✔️ Từ 10 - 19 bộ: Miễn phí in + Tặng 1 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️ Từ 20 - 29 bộ: Miễn phí in + Tặng 2 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️', 1, CAST(N'2021-04-01T11:17:17.193' AS DateTime), NULL, 15)
INSERT [dbo].[tblMatHang] ([sMaMH], [sTenMH], [sHinhanh], [sDonvitinh], [sMota], [iMaLoaiMH], [dThoigiantao], [dThoigiansua], [iMaTrangThai]) VALUES (N'DDS-MH-12', N'	Bộ Quần Áo bóng đá trẻ em Bulbal Flash Trắng', N'aobongdatreemkhonglogo3.png', N'Bộ', N'🎁Ưu đãi & Chính Sách Đặt Đội: ✔️ Từ 1 - 9 bộ: Miễn phí in ✔️ Từ 10 - 19 bộ: Miễn phí in + Tặng 1 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️ Từ 20 - 29 bộ: Miễn phí in + Tặng 2 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️', 3, CAST(N'2021-04-01T11:17:51.907' AS DateTime), NULL, 15)
INSERT [dbo].[tblMatHang] ([sMaMH], [sTenMH], [sHinhanh], [sDonvitinh], [sMota], [iMaLoaiMH], [dThoigiantao], [dThoigiansua], [iMaTrangThai]) VALUES (N'DDS-MH-13', N'	Bộ Quần Áo bóng đá trẻ em Bulbal Flash Xanh Lá Mạ', N'aobongdatreemkhonglogo1.png', N'Bộ', N'🎁Ưu đãi & Chính Sách Đặt Đội: ✔️ Từ 1 - 9 bộ: Miễn phí in ✔️ Từ 10 - 19 bộ: Miễn phí in + Tặng 1 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️ Từ 20 - 29 bộ: Miễn phí in + Tặng 2 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️', 3, CAST(N'2021-04-01T11:18:05.560' AS DateTime), NULL, 15)
INSERT [dbo].[tblMatHang] ([sMaMH], [sTenMH], [sHinhanh], [sDonvitinh], [sMota], [iMaLoaiMH], [dThoigiantao], [dThoigiansua], [iMaTrangThai]) VALUES (N'DDS-MH-14', N'Áo bóng đá Tottenham sân nhà 2018 - 2019', N'aoclb_tot_trang.png', N'Bộ', N'🎁Ưu đãi & Chính Sách Đặt Đội: ✔️ Từ 1 - 9 bộ: Miễn phí in ✔️ Từ 10 - 19 bộ: Miễn phí in + Tặng 1 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️ Từ 20 - 29 bộ: Miễn phí in + Tặng 2 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️', 1, CAST(N'2021-04-01T11:18:25.160' AS DateTime), NULL, 15)
INSERT [dbo].[tblMatHang] ([sMaMH], [sTenMH], [sHinhanh], [sDonvitinh], [sMota], [iMaLoaiMH], [dThoigiantao], [dThoigiansua], [iMaTrangThai]) VALUES (N'DDS-MH-15', N'Áo bóng đá Tottenham sân khách mẫu thứ 3 2018 - 2019', N'aoclb_tot_3.png', N'Bộ', N'🎁Ưu đãi & Chính Sách Đặt Đội: ✔️ Từ 1 - 9 bộ: Miễn phí in ✔️ Từ 10 - 19 bộ: Miễn phí in + Tặng 1 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️ Từ 20 - 29 bộ: Miễn phí in + Tặng 2 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️', 1, CAST(N'2021-04-01T11:18:39.113' AS DateTime), CAST(N'2021-04-01T11:19:27.893' AS DateTime), 15)
INSERT [dbo].[tblMatHang] ([sMaMH], [sTenMH], [sHinhanh], [sDonvitinh], [sMota], [iMaLoaiMH], [dThoigiantao], [dThoigiansua], [iMaTrangThai]) VALUES (N'DDS-MH-16', N'Áo Leicester City xanh sân khách 2020 - 2021', N'aoclb_let.png', N'Bộ', N'🎁Ưu đãi & Chính Sách Đặt Đội: ✔️ Từ 1 - 9 bộ: Miễn phí in ✔️ Từ 10 - 19 bộ: Miễn phí in + Tặng 1 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️ Từ 20 - 29 bộ: Miễn phí in + Tặng 2 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️', 1, CAST(N'2021-04-01T11:18:52.090' AS DateTime), NULL, 15)
INSERT [dbo].[tblMatHang] ([sMaMH], [sTenMH], [sHinhanh], [sDonvitinh], [sMota], [iMaLoaiMH], [dThoigiantao], [dThoigiansua], [iMaTrangThai]) VALUES (N'DDS-MH-17', N'Áo Bóng Đá Dortmund Sân Nhà 2018 - 2019', N'aoclb_dortmund.png', N'Bộ', N'🎁Ưu đãi & Chính Sách Đặt Đội: ✔️ Từ 1 - 9 bộ: Miễn phí in ✔️ Từ 10 - 19 bộ: Miễn phí in + Tặng 1 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️ Từ 20 - 29 bộ: Miễn phí in + Tặng 2 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️', 1, CAST(N'2021-04-01T11:19:06.653' AS DateTime), NULL, 15)
INSERT [dbo].[tblMatHang] ([sMaMH], [sTenMH], [sHinhanh], [sDonvitinh], [sMota], [iMaLoaiMH], [dThoigiantao], [dThoigiansua], [iMaTrangThai]) VALUES (N'DDS-MH-18', N'Bộ quần áo bóng đá CP MANCITY xanh biển 2020 - 2021', N'aoclb_mc.png', N'Bộ', N'🎁Ưu đãi & Chính Sách Đặt Đội: ✔️ Từ 1 - 9 bộ: Miễn phí in ✔️ Từ 10 - 19 bộ: Miễn phí in + Tặng 1 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️ Từ 20 - 29 bộ: Miễn phí in + Tặng 2 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️', 1, CAST(N'2021-04-01T11:20:17.327' AS DateTime), NULL, 15)
INSERT [dbo].[tblMatHang] ([sMaMH], [sTenMH], [sHinhanh], [sDonvitinh], [sMota], [iMaLoaiMH], [dThoigiantao], [dThoigiansua], [iMaTrangThai]) VALUES (N'DDS-MH-19', N'	Bộ Quần Áo bóng đá trẻ em Bulbal Flash Hồng', N'aobongdatreemkhonglogo4.png', N'Bộ', N'🎁Ưu đãi & Chính Sách Đặt Đội: ✔️ Từ 1 - 9 bộ: Miễn phí in ✔️ Từ 10 - 19 bộ: Miễn phí in + Tặng 1 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️ Từ 20 - 29 bộ: Miễn phí in + Tặng 2 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️', 3, CAST(N'2021-04-01T11:20:27.597' AS DateTime), CAST(N'2021-04-01T11:20:39.503' AS DateTime), 15)
INSERT [dbo].[tblMatHang] ([sMaMH], [sTenMH], [sHinhanh], [sDonvitinh], [sMota], [iMaLoaiMH], [dThoigiantao], [dThoigiansua], [iMaTrangThai]) VALUES (N'DDS-MH-2', N'Áo Bóng Đá Manchester United 2020 - 2021 ps xanh đen', N'aoclb_mu.png', N'Bộ', N'🎁Ưu đãi & Chính Sách Đặt Đội: ✔️ Từ 1 - 9 bộ: Miễn phí in ✔️ Từ 10 - 19 bộ: Miễn phí in + Tặng 1 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️ Từ 20 - 29 bộ: Miễn phí in + Tặng 2 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️', 1, CAST(N'2021-04-01T10:55:09.953' AS DateTime), CAST(N'2021-04-01T10:58:51.450' AS DateTime), 15)
INSERT [dbo].[tblMatHang] ([sMaMH], [sTenMH], [sHinhanh], [sDonvitinh], [sMota], [iMaLoaiMH], [dThoigiantao], [dThoigiansua], [iMaTrangThai]) VALUES (N'DDS-MH-20', N'Áo bóng đá không logo Bubal City xanh dương', N'aokhonglogo4.png', N'Bộ', N'🎁Ưu đãi & Chính Sách Đặt Đội: ✔️ Từ 1 - 9 bộ: Miễn phí in ✔️ Từ 10 - 19 bộ: Miễn phí in + Tặng 1 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️ Từ 20 - 29 bộ: Miễn phí in + Tặng 2 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️', 8, CAST(N'2021-04-01T11:21:30.960' AS DateTime), NULL, 15)
INSERT [dbo].[tblMatHang] ([sMaMH], [sTenMH], [sHinhanh], [sDonvitinh], [sMota], [iMaLoaiMH], [dThoigiantao], [dThoigiansua], [iMaTrangThai]) VALUES (N'DDS-MH-21', N'Áo bóng đá LA Galaxy 2018 - 2019', N'aoclb_la.png', N'Bộ', N'🎁Ưu đãi & Chính Sách Đặt Đội: ✔️ Từ 1 - 9 bộ: Miễn phí in ✔️ Từ 10 - 19 bộ: Miễn phí in + Tặng 1 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️ Từ 20 - 29 bộ: Miễn phí in + Tặng 2 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️', 1, CAST(N'2021-04-01T11:21:44.013' AS DateTime), NULL, 15)
INSERT [dbo].[tblMatHang] ([sMaMH], [sTenMH], [sHinhanh], [sDonvitinh], [sMota], [iMaLoaiMH], [dThoigiantao], [dThoigiansua], [iMaTrangThai]) VALUES (N'DDS-MH-22', N'Áo Bóng Đá Hàn Quốc Trắng 2020 - 2021', N'aotuyen_han.png', N'Bộ', N'🎁Ưu đãi & Chính Sách Đặt Đội: ✔️ Từ 1 - 9 bộ: Miễn phí in ✔️ Từ 10 - 19 bộ: Miễn phí in + Tặng 1 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️ Từ 20 - 29 bộ: Miễn phí in + Tặng 2 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️', 2, CAST(N'2021-04-01T11:22:02.613' AS DateTime), NULL, 15)
INSERT [dbo].[tblMatHang] ([sMaMH], [sTenMH], [sHinhanh], [sDonvitinh], [sMota], [iMaLoaiMH], [dThoigiantao], [dThoigiansua], [iMaTrangThai]) VALUES (N'DDS-MH-23', N'Áo Bóng Đá Bồ Đào Nha 2020 - 2021', N'aotuyen_bodaonha.png', N'Bộ', N'🎁Ưu đãi & Chính Sách Đặt Đội: ✔️ Từ 1 - 9 bộ: Miễn phí in ✔️ Từ 10 - 19 bộ: Miễn phí in + Tặng 1 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️ Từ 20 - 29 bộ: Miễn phí in + Tặng 2 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️', 2, CAST(N'2021-04-01T11:22:33.050' AS DateTime), NULL, 15)
INSERT [dbo].[tblMatHang] ([sMaMH], [sTenMH], [sHinhanh], [sDonvitinh], [sMota], [iMaLoaiMH], [dThoigiantao], [dThoigiansua], [iMaTrangThai]) VALUES (N'DDS-MH-24', N'Áo Bóng Đá Dortmund Sân Khách 2018 - 2019', N'aoclb_dortmund_2.png', N'Bộ', N'🎁Ưu đãi & Chính Sách Đặt Đội: ✔️ Từ 1 - 9 bộ: Miễn phí in ✔️ Từ 10 - 19 bộ: Miễn phí in + Tặng 1 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️ Từ 20 - 29 bộ: Miễn phí in + Tặng 2 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️', 2, CAST(N'2021-04-01T11:22:49.850' AS DateTime), NULL, 15)
INSERT [dbo].[tblMatHang] ([sMaMH], [sTenMH], [sHinhanh], [sDonvitinh], [sMota], [iMaLoaiMH], [dThoigiantao], [dThoigiansua], [iMaTrangThai]) VALUES (N'DDS-MH-25', N'Bộ Quần Áo bóng đá trẻ em Bulbal Flash Xanh Cực Quang', N'aobongdatreemkhonglogo.png', N'Bộ', N'🎁Ưu đãi & Chính Sách Đặt Đội: ✔️ Từ 1 - 9 bộ: Miễn phí in ✔️ Từ 10 - 19 bộ: Miễn phí in + Tặng 1 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️ Từ 20 - 29 bộ: Miễn phí in + Tặng 2 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️', 3, CAST(N'2021-04-01T11:23:13.820' AS DateTime), NULL, 15)
INSERT [dbo].[tblMatHang] ([sMaMH], [sTenMH], [sHinhanh], [sDonvitinh], [sMota], [iMaLoaiMH], [dThoigiantao], [dThoigiansua], [iMaTrangThai]) VALUES (N'DDS-MH-26', N'	Bộ Quần Áo bóng đá trẻ em Bulbal Flash Xanh Nước Biển', N'aobongdatreemkhonglogo5.png', N'Bộ', N'🎁Ưu đãi & Chính Sách Đặt Đội: ✔️ Từ 1 - 9 bộ: Miễn phí in ✔️ Từ 10 - 19 bộ: Miễn phí in + Tặng 1 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️ Từ 20 - 29 bộ: Miễn phí in + Tặng 2 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️', 3, CAST(N'2021-04-01T11:23:25.067' AS DateTime), NULL, 15)
INSERT [dbo].[tblMatHang] ([sMaMH], [sTenMH], [sHinhanh], [sDonvitinh], [sMota], [iMaLoaiMH], [dThoigiantao], [dThoigiansua], [iMaTrangThai]) VALUES (N'DDS-MH-27', N'Áo Bóng Đá Liverpool ngọc lợt mùa giải 2020 - 2021', N'aoclb_liverpool.png', N'Bộ', N'🎁Ưu đãi & Chính Sách Đặt Đội: ✔️ Từ 1 - 9 bộ: Miễn phí in ✔️ Từ 10 - 19 bộ: Miễn phí in + Tặng 1 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️ Từ 20 - 29 bộ: Miễn phí in + Tặng 2 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️', 1, CAST(N'2021-04-01T11:23:43.187' AS DateTime), CAST(N'2021-04-02T01:06:08.447' AS DateTime), 15)
INSERT [dbo].[tblMatHang] ([sMaMH], [sTenMH], [sHinhanh], [sDonvitinh], [sMota], [iMaLoaiMH], [dThoigiantao], [dThoigiansua], [iMaTrangThai]) VALUES (N'DDS-MH-28', N'	Bộ Quần Áo bóng đá trẻ em Bulbal Flash Trắng Trơn', N'aobongdatreemkhonglogo7.png', N'Bộ', N'🎁Ưu đãi & Chính Sách Đặt Đội: ✔️ Từ 1 - 9 bộ: Miễn phí in ✔️ Từ 10 - 19 bộ: Miễn phí in + Tặng 1 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️ Từ 20 - 29 bộ: Miễn phí in + Tặng 2 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️', 3, CAST(N'2021-04-01T11:23:55.780' AS DateTime), NULL, 15)
INSERT [dbo].[tblMatHang] ([sMaMH], [sTenMH], [sHinhanh], [sDonvitinh], [sMota], [iMaLoaiMH], [dThoigiantao], [dThoigiansua], [iMaTrangThai]) VALUES (N'DDS-MH-29', N'Áo bóng đá PSG sân nhà 2018 - 2019', N'aoclb_psg_1819.png', N'Bộ', N'🎁Ưu đãi & Chính Sách Đặt Đội: ✔️ Từ 1 - 9 bộ: Miễn phí in ✔️ Từ 10 - 19 bộ: Miễn phí in + Tặng 1 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️ Từ 20 - 29 bộ: Miễn phí in + Tặng 2 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️', 1, CAST(N'2021-04-01T11:24:27.217' AS DateTime), NULL, 15)
INSERT [dbo].[tblMatHang] ([sMaMH], [sTenMH], [sHinhanh], [sDonvitinh], [sMota], [iMaLoaiMH], [dThoigiantao], [dThoigiansua], [iMaTrangThai]) VALUES (N'DDS-MH-3', N'	Bộ Quần Áo bóng đá trẻ em Bulbal Flash Cam', N'aobongdatreemkhonglogo2.png', N'Bộ', N'🎁Ưu đãi & Chính Sách Đặt Đội: ✔️ Từ 1 - 9 bộ: Miễn phí in ✔️ Từ 10 - 19 bộ: Miễn phí in + Tặng 1 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️ Từ 20 - 29 bộ: Miễn phí in + Tặng 2 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️', 3, CAST(N'2021-04-01T11:01:48.207' AS DateTime), NULL, 15)
INSERT [dbo].[tblMatHang] ([sMaMH], [sTenMH], [sHinhanh], [sDonvitinh], [sMota], [iMaLoaiMH], [dThoigiantao], [dThoigiansua], [iMaTrangThai]) VALUES (N'DDS-MH-30', N'Bộ quần áo bóng đá CP Pháp trắng 2020 - 2021', N'aotuyen_phap.png', N'Bộ', N'🎁Ưu đãi & Chính Sách Đặt Đội: ✔️ Từ 1 - 9 bộ: Miễn phí in ✔️ Từ 10 - 19 bộ: Miễn phí in + Tặng 1 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️ Từ 20 - 29 bộ: Miễn phí in + Tặng 2 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️', 2, CAST(N'2021-04-01T11:25:01.540' AS DateTime), NULL, 15)
INSERT [dbo].[tblMatHang] ([sMaMH], [sTenMH], [sHinhanh], [sDonvitinh], [sMota], [iMaLoaiMH], [dThoigiantao], [dThoigiansua], [iMaTrangThai]) VALUES (N'DDS-MH-31', N'Áo bóng đá Tottenham sân khách 2018 - 2019', N'aoclb_tot_2.png', N'Bộ', N'🎁Ưu đãi & Chính Sách Đặt Đội: ✔️ Từ 1 - 9 bộ: Miễn phí in ✔️ Từ 10 - 19 bộ: Miễn phí in + Tặng 1 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️ Từ 20 - 29 bộ: Miễn phí in + Tặng 2 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️', 1, CAST(N'2021-04-01T11:25:17.957' AS DateTime), NULL, 15)
INSERT [dbo].[tblMatHang] ([sMaMH], [sTenMH], [sHinhanh], [sDonvitinh], [sMota], [iMaLoaiMH], [dThoigiantao], [dThoigiansua], [iMaTrangThai]) VALUES (N'DDS-MH-32', N'Áo CLB Ajax Amsterdam sân khách đen 2020 - 2021', N'aoclb_ajax.png', N'Bộ', N'🎁Ưu đãi & Chính Sách Đặt Đội: ✔️ Từ 1 - 9 bộ: Miễn phí in ✔️ Từ 10 - 19 bộ: Miễn phí in + Tặng 1 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️ Từ 20 - 29 bộ: Miễn phí in + Tặng 2 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️', 1, CAST(N'2021-04-01T11:25:31.200' AS DateTime), NULL, 15)
INSERT [dbo].[tblMatHang] ([sMaMH], [sTenMH], [sHinhanh], [sDonvitinh], [sMota], [iMaLoaiMH], [dThoigiantao], [dThoigiansua], [iMaTrangThai]) VALUES (N'DDS-MH-4', N'	Bộ Quần Áo bóng đá trẻ em Bulbal Flash Đen', N'aobongdatreemkhonglogo6.png', N'Bộ', N'🎁Ưu đãi & Chính Sách Đặt Đội: ✔️ Từ 1 - 9 bộ: Miễn phí in ✔️ Từ 10 - 19 bộ: Miễn phí in + Tặng 1 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️ Từ 20 - 29 bộ: Miễn phí in + Tặng 2 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️', 3, CAST(N'2021-04-01T11:03:12.427' AS DateTime), NULL, 15)
INSERT [dbo].[tblMatHang] ([sMaMH], [sTenMH], [sHinhanh], [sDonvitinh], [sMota], [iMaLoaiMH], [dThoigiantao], [dThoigiansua], [iMaTrangThai]) VALUES (N'DDS-MH-5', N'Áo bóng đá PSG sân khách 2018 - 2019', N'aoclb_psg_trang.png', N'Bộ', N'🎁Ưu đãi & Chính Sách Đặt Đội: ✔️ Từ 1 - 9 bộ: Miễn phí in ✔️ Từ 10 - 19 bộ: Miễn phí in + Tặng 1 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️ Từ 20 - 29 bộ: Miễn phí in + Tặng 2 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️', 1, CAST(N'2021-04-01T11:03:43.523' AS DateTime), CAST(N'2021-04-01T11:12:57.670' AS DateTime), 15)
INSERT [dbo].[tblMatHang] ([sMaMH], [sTenMH], [sHinhanh], [sDonvitinh], [sMota], [iMaLoaiMH], [dThoigiantao], [dThoigiansua], [iMaTrangThai]) VALUES (N'DDS-MH-6', N'Áo Bóng Đá CLB Arsenal hồng mùa giải 2020 -  2021', N'aoclb_arsernal.png', N'Bộ', N'🎁Ưu đãi & Chính Sách Đặt Đội: ✔️ Từ 1 - 9 bộ: Miễn phí in ✔️ Từ 10 - 19 bộ: Miễn phí in + Tặng 1 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️ Từ 20 - 29 bộ: Miễn phí in + Tặng 2 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️', 1, CAST(N'2021-04-01T11:04:37.393' AS DateTime), NULL, 15)
INSERT [dbo].[tblMatHang] ([sMaMH], [sTenMH], [sHinhanh], [sDonvitinh], [sMota], [iMaLoaiMH], [dThoigiantao], [dThoigiansua], [iMaTrangThai]) VALUES (N'DDS-MH-7', N'Bộ quần áo bóng đá CP REAL đen 2020 - 2021', N'aoclb_real_2021.png', N'Bộ', N'🎁Ưu đãi & Chính Sách Đặt Đội: ✔️ Từ 1 - 9 bộ: Miễn phí in ✔️ Từ 10 - 19 bộ: Miễn phí in + Tặng 1 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️ Từ 20 - 29 bộ: Miễn phí in + Tặng 2 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️', 1, CAST(N'2021-04-01T11:12:41.410' AS DateTime), NULL, 15)
INSERT [dbo].[tblMatHang] ([sMaMH], [sTenMH], [sHinhanh], [sDonvitinh], [sMota], [iMaLoaiMH], [dThoigiantao], [dThoigiansua], [iMaTrangThai]) VALUES (N'DDS-MH-8', N'Bộ Bóng Đá Đội Tuyển Nhật Bản 2019', N'aotuyen_han_xanh.png', N'Bộ', N'🎁Ưu đãi & Chính Sách Đặt Đội: ✔️ Từ 1 - 9 bộ: Miễn phí in ✔️ Từ 10 - 19 bộ: Miễn phí in + Tặng 1 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️ Từ 20 - 29 bộ: Miễn phí in + Tặng 2 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️', 2, CAST(N'2021-04-01T11:13:31.400' AS DateTime), NULL, 15)
INSERT [dbo].[tblMatHang] ([sMaMH], [sTenMH], [sHinhanh], [sDonvitinh], [sMota], [iMaLoaiMH], [dThoigiantao], [dThoigiansua], [iMaTrangThai]) VALUES (N'DDS-MH-9', N'Bộ Bóng Đá Đội Tuyển Nhật Bản 2019', N'aotuyen_arg.png', N'Bộ', N'🎁Ưu đãi & Chính Sách Đặt Đội: ✔️ Từ 1 - 9 bộ: Miễn phí in ✔️ Từ 10 - 19 bộ: Miễn phí in + Tặng 1 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️ Từ 20 - 29 bộ: Miễn phí in + Tặng 2 trong (Bóng, Găng Thủ Môn, Giầy) + Băng C + Túi Đựng Giầy ✔️', 2, CAST(N'2021-04-01T11:13:55.763' AS DateTime), NULL, 15)
GO
SET IDENTITY_INSERT [dbo].[tblNhanVien] ON 

INSERT [dbo].[tblNhanVien] ([iMaNV], [sTenNV], [sGioitinh], [dNgaysinh], [sSdt], [sQuequan], [sEmail], [dNgayvaolam], [sTenDangNhap]) VALUES (1, N'Phạm Xuân Tú', NULL, NULL, NULL, NULL, NULL, NULL, N'admin')
INSERT [dbo].[tblNhanVien] ([iMaNV], [sTenNV], [sGioitinh], [dNgaysinh], [sSdt], [sQuequan], [sEmail], [dNgayvaolam], [sTenDangNhap]) VALUES (2, N'QL Cửa hàng', NULL, NULL, NULL, NULL, NULL, NULL, N'quanly')
INSERT [dbo].[tblNhanVien] ([iMaNV], [sTenNV], [sGioitinh], [dNgaysinh], [sSdt], [sQuequan], [sEmail], [dNgayvaolam], [sTenDangNhap]) VALUES (3, N'NV Kho', NULL, NULL, NULL, NULL, NULL, NULL, N'nvkho')
INSERT [dbo].[tblNhanVien] ([iMaNV], [sTenNV], [sGioitinh], [dNgaysinh], [sSdt], [sQuequan], [sEmail], [dNgayvaolam], [sTenDangNhap]) VALUES (4, N'NV Bán hàng', NULL, NULL, NULL, NULL, NULL, NULL, N'nvbanhang')
SET IDENTITY_INSERT [dbo].[tblNhanVien] OFF
GO
SET IDENTITY_INSERT [dbo].[tblNhaSanXuat] ON 

INSERT [dbo].[tblNhaSanXuat] ([iMaNSX], [sTenNSX], [sDiachi], [sSdt], [dThoigiantao], [dThoigiansua]) VALUES (1, N'ADIDAS', NULL, NULL, NULL, NULL)
INSERT [dbo].[tblNhaSanXuat] ([iMaNSX], [sTenNSX], [sDiachi], [sSdt], [dThoigiantao], [dThoigiansua]) VALUES (2, N'NIKE', NULL, NULL, NULL, NULL)
INSERT [dbo].[tblNhaSanXuat] ([iMaNSX], [sTenNSX], [sDiachi], [sSdt], [dThoigiantao], [dThoigiansua]) VALUES (3, N'PUMA', NULL, NULL, NULL, NULL)
INSERT [dbo].[tblNhaSanXuat] ([iMaNSX], [sTenNSX], [sDiachi], [sSdt], [dThoigiantao], [dThoigiansua]) VALUES (4, N'NILING', NULL, NULL, NULL, NULL)
INSERT [dbo].[tblNhaSanXuat] ([iMaNSX], [sTenNSX], [sDiachi], [sSdt], [dThoigiantao], [dThoigiansua]) VALUES (5, N'YONEX', NULL, NULL, NULL, NULL)
INSERT [dbo].[tblNhaSanXuat] ([iMaNSX], [sTenNSX], [sDiachi], [sSdt], [dThoigiantao], [dThoigiansua]) VALUES (6, N'JOBDAN', NULL, NULL, NULL, NULL)
INSERT [dbo].[tblNhaSanXuat] ([iMaNSX], [sTenNSX], [sDiachi], [sSdt], [dThoigiantao], [dThoigiansua]) VALUES (7, N'XPEED', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblNhaSanXuat] OFF
GO
INSERT [dbo].[tblPhieuNhapKho] ([sMaPhieuNhapKho], [iMaNV], [dNgaynhapkho], [dThoigiantao], [dThoigiansua], [iMaTrangThai], [iMaKho], [sMaDonNhapHang]) VALUES (N'DDS-PNK-1', 1, CAST(N'2021-04-01T16:51:45.740' AS DateTime), CAST(N'2021-04-01T16:51:45.740' AS DateTime), CAST(N'2021-04-02T09:40:41.563' AS DateTime), 9, 2, N'DDS-DNH-2')
INSERT [dbo].[tblPhieuNhapKho] ([sMaPhieuNhapKho], [iMaNV], [dNgaynhapkho], [dThoigiantao], [dThoigiansua], [iMaTrangThai], [iMaKho], [sMaDonNhapHang]) VALUES (N'DDS-PNK-2', 1, CAST(N'2021-04-02T15:39:42.210' AS DateTime), CAST(N'2021-04-02T15:39:42.210' AS DateTime), CAST(N'2021-04-02T15:58:27.127' AS DateTime), 9, 2, N'DDS-DNH-1')
GO
INSERT [dbo].[tblPhieuXuatKho] ([sMaPhieuXuatKho], [iMaNV], [dNgayxuat], [dThoigiantao], [dThoigiansua], [iMaTrangThai], [iMaKho], [sMaDonDatHang]) VALUES (N'DDS-PXK-1', 1, CAST(N'2021-04-01T16:40:41.130' AS DateTime), CAST(N'2021-04-01T16:40:41.130' AS DateTime), NULL, 13, 2, N'DDS-DDH-3')
INSERT [dbo].[tblPhieuXuatKho] ([sMaPhieuXuatKho], [iMaNV], [dNgayxuat], [dThoigiantao], [dThoigiansua], [iMaTrangThai], [iMaKho], [sMaDonDatHang]) VALUES (N'DDS-PXK-2', 1, CAST(N'2021-04-02T14:05:04.037' AS DateTime), CAST(N'2021-04-02T14:05:04.037' AS DateTime), NULL, 12, 2, N'DDS-DDH-9')
INSERT [dbo].[tblPhieuXuatKho] ([sMaPhieuXuatKho], [iMaNV], [dNgayxuat], [dThoigiantao], [dThoigiansua], [iMaTrangThai], [iMaKho], [sMaDonDatHang]) VALUES (N'DDS-PXK-3', 1, CAST(N'2021-04-02T16:35:38.807' AS DateTime), CAST(N'2021-04-02T16:35:38.807' AS DateTime), CAST(N'2021-04-02T16:36:38.957' AS DateTime), 12, 2, N'DDS-DDH-10')
GO
SET IDENTITY_INSERT [dbo].[tblQuyen] ON 

INSERT [dbo].[tblQuyen] ([iMaQuyen], [sTenQuyen], [dThoigiantao], [dThoigiansua]) VALUES (2, N'Chủ cửa hàng', CAST(N'2021-03-30T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[tblQuyen] ([iMaQuyen], [sTenQuyen], [dThoigiantao], [dThoigiansua]) VALUES (3, N'Quản lý cửa hàng', CAST(N'2021-03-30T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[tblQuyen] ([iMaQuyen], [sTenQuyen], [dThoigiantao], [dThoigiansua]) VALUES (4, N'Nhân viên kho', CAST(N'2021-03-30T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[tblQuyen] ([iMaQuyen], [sTenQuyen], [dThoigiantao], [dThoigiansua]) VALUES (5, N'Nhân viên bán hàng', CAST(N'2021-03-30T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[tblQuyen] ([iMaQuyen], [sTenQuyen], [dThoigiantao], [dThoigiansua]) VALUES (6, N'Khách hàng', CAST(N'2021-03-30T00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[tblQuyen] OFF
GO
SET IDENTITY_INSERT [dbo].[tblSize] ON 

INSERT [dbo].[tblSize] ([iMaSize], [sTenSize], [sChieucao], [sCannang]) VALUES (1, N'S', NULL, NULL)
INSERT [dbo].[tblSize] ([iMaSize], [sTenSize], [sChieucao], [sCannang]) VALUES (2, N'M', NULL, NULL)
INSERT [dbo].[tblSize] ([iMaSize], [sTenSize], [sChieucao], [sCannang]) VALUES (3, N'L', NULL, NULL)
INSERT [dbo].[tblSize] ([iMaSize], [sTenSize], [sChieucao], [sCannang]) VALUES (4, N'XL', NULL, NULL)
INSERT [dbo].[tblSize] ([iMaSize], [sTenSize], [sChieucao], [sCannang]) VALUES (6, N'XXL', NULL, NULL)
INSERT [dbo].[tblSize] ([iMaSize], [sTenSize], [sChieucao], [sCannang]) VALUES (7, N'3XL', NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblSize] OFF
GO
INSERT [dbo].[tblTaiKhoan] ([sTenDangNhap], [sMatKhau], [sAnhdaidien], [iMaTrangThai], [iMaQuyen], [dThoigiantao], [dThoigiansua]) VALUES (N'admin', N'123', NULL, 1, 2, CAST(N'2021-03-31T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[tblTaiKhoan] ([sTenDangNhap], [sMatKhau], [sAnhdaidien], [iMaTrangThai], [iMaQuyen], [dThoigiantao], [dThoigiansua]) VALUES (N'bhoa', N'123', NULL, 1, 6, CAST(N'2021-04-02T04:25:42.307' AS DateTime), NULL)
INSERT [dbo].[tblTaiKhoan] ([sTenDangNhap], [sMatKhau], [sAnhdaidien], [iMaTrangThai], [iMaQuyen], [dThoigiantao], [dThoigiansua]) VALUES (N'khachhang', N'123', NULL, 1, 6, CAST(N'2021-03-31T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[tblTaiKhoan] ([sTenDangNhap], [sMatKhau], [sAnhdaidien], [iMaTrangThai], [iMaQuyen], [dThoigiantao], [dThoigiansua]) VALUES (N'khachhang123', N'123', NULL, 1, 6, CAST(N'2021-04-02T04:30:38.227' AS DateTime), NULL)
INSERT [dbo].[tblTaiKhoan] ([sTenDangNhap], [sMatKhau], [sAnhdaidien], [iMaTrangThai], [iMaQuyen], [dThoigiantao], [dThoigiansua]) VALUES (N'khachhangtest', N'123', NULL, 1, 6, CAST(N'2021-03-31T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[tblTaiKhoan] ([sTenDangNhap], [sMatKhau], [sAnhdaidien], [iMaTrangThai], [iMaQuyen], [dThoigiantao], [dThoigiansua]) VALUES (N'ngocquynh', N'123', NULL, 1, 6, CAST(N'2021-04-02T04:32:42.143' AS DateTime), NULL)
INSERT [dbo].[tblTaiKhoan] ([sTenDangNhap], [sMatKhau], [sAnhdaidien], [iMaTrangThai], [iMaQuyen], [dThoigiantao], [dThoigiansua]) VALUES (N'nvbanhang', N'123', NULL, 1, 5, CAST(N'2021-03-31T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[tblTaiKhoan] ([sTenDangNhap], [sMatKhau], [sAnhdaidien], [iMaTrangThai], [iMaQuyen], [dThoigiantao], [dThoigiansua]) VALUES (N'nvkho', N'123', NULL, 1, 4, CAST(N'2021-03-31T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[tblTaiKhoan] ([sTenDangNhap], [sMatKhau], [sAnhdaidien], [iMaTrangThai], [iMaQuyen], [dThoigiantao], [dThoigiansua]) VALUES (N'quanly', N'123', NULL, 1, 3, CAST(N'2021-03-31T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[tblTaiKhoan] ([sTenDangNhap], [sMatKhau], [sAnhdaidien], [iMaTrangThai], [iMaQuyen], [dThoigiantao], [dThoigiansua]) VALUES (N'vtl14012000', N'123', NULL, 1, 6, CAST(N'2021-03-31T00:00:00.000' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[tblTrangThai] ON 

INSERT [dbo].[tblTrangThai] ([iMaTrangThai], [sTenTrangThai], [iMaLoaiTrangThai]) VALUES (1, N'Hoạt động', 1)
INSERT [dbo].[tblTrangThai] ([iMaTrangThai], [sTenTrangThai], [iMaLoaiTrangThai]) VALUES (2, N'Không hoạt động', 1)
INSERT [dbo].[tblTrangThai] ([iMaTrangThai], [sTenTrangThai], [iMaLoaiTrangThai]) VALUES (3, N'Đã xác nhận', 2)
INSERT [dbo].[tblTrangThai] ([iMaTrangThai], [sTenTrangThai], [iMaLoaiTrangThai]) VALUES (4, N'Chờ xử lý', 2)
INSERT [dbo].[tblTrangThai] ([iMaTrangThai], [sTenTrangThai], [iMaLoaiTrangThai]) VALUES (5, N'Tất cả đơn đặt hàng', 2)
INSERT [dbo].[tblTrangThai] ([iMaTrangThai], [sTenTrangThai], [iMaLoaiTrangThai]) VALUES (6, N'Đã xác nhận', 3)
INSERT [dbo].[tblTrangThai] ([iMaTrangThai], [sTenTrangThai], [iMaLoaiTrangThai]) VALUES (7, N'Chờ xử lý', 3)
INSERT [dbo].[tblTrangThai] ([iMaTrangThai], [sTenTrangThai], [iMaLoaiTrangThai]) VALUES (8, N'Tất cả đơn nhập hàng', 3)
INSERT [dbo].[tblTrangThai] ([iMaTrangThai], [sTenTrangThai], [iMaLoaiTrangThai]) VALUES (9, N'Đã xác nhận', 4)
INSERT [dbo].[tblTrangThai] ([iMaTrangThai], [sTenTrangThai], [iMaLoaiTrangThai]) VALUES (10, N'Chờ xử lý', 4)
INSERT [dbo].[tblTrangThai] ([iMaTrangThai], [sTenTrangThai], [iMaLoaiTrangThai]) VALUES (11, N'Tất cả đơn nhập kho', 4)
INSERT [dbo].[tblTrangThai] ([iMaTrangThai], [sTenTrangThai], [iMaLoaiTrangThai]) VALUES (12, N'Đã xác nhận', 5)
INSERT [dbo].[tblTrangThai] ([iMaTrangThai], [sTenTrangThai], [iMaLoaiTrangThai]) VALUES (13, N'Chờ xử lý', 5)
INSERT [dbo].[tblTrangThai] ([iMaTrangThai], [sTenTrangThai], [iMaLoaiTrangThai]) VALUES (14, N'Tất cả đơn xuất kho', 5)
INSERT [dbo].[tblTrangThai] ([iMaTrangThai], [sTenTrangThai], [iMaLoaiTrangThai]) VALUES (15, N'Hiển thị', 6)
INSERT [dbo].[tblTrangThai] ([iMaTrangThai], [sTenTrangThai], [iMaLoaiTrangThai]) VALUES (16, N'Ẩn', 6)
INSERT [dbo].[tblTrangThai] ([iMaTrangThai], [sTenTrangThai], [iMaLoaiTrangThai]) VALUES (17, N'Nhân viên', 8)
INSERT [dbo].[tblTrangThai] ([iMaTrangThai], [sTenTrangThai], [iMaLoaiTrangThai]) VALUES (18, N'Khách hàng', 8)
SET IDENTITY_INSERT [dbo].[tblTrangThai] OFF
GO
ALTER TABLE [dbo].[tblChiTietDatHang]  WITH CHECK ADD  CONSTRAINT [FK_MaDonDatHang] FOREIGN KEY([sMaDonDatHang])
REFERENCES [dbo].[tblDonDatHang] ([sMaDonDatHang])
GO
ALTER TABLE [dbo].[tblChiTietDatHang] CHECK CONSTRAINT [FK_MaDonDatHang]
GO
ALTER TABLE [dbo].[tblChiTietDatHang]  WITH CHECK ADD  CONSTRAINT [FK_MaKM] FOREIGN KEY([iMaKM])
REFERENCES [dbo].[tblKhuyenMai] ([iMaKM])
GO
ALTER TABLE [dbo].[tblChiTietDatHang] CHECK CONSTRAINT [FK_MaKM]
GO
ALTER TABLE [dbo].[tblChiTietDatHang]  WITH CHECK ADD  CONSTRAINT [FK_MaMH_CTDH] FOREIGN KEY([sMaMH])
REFERENCES [dbo].[tblMatHang] ([sMaMH])
GO
ALTER TABLE [dbo].[tblChiTietDatHang] CHECK CONSTRAINT [FK_MaMH_CTDH]
GO
ALTER TABLE [dbo].[tblChiTietDatHang]  WITH CHECK ADD  CONSTRAINT [FK_MaSize_CTDH] FOREIGN KEY([iMaSize])
REFERENCES [dbo].[tblSize] ([iMaSize])
GO
ALTER TABLE [dbo].[tblChiTietDatHang] CHECK CONSTRAINT [FK_MaSize_CTDH]
GO
ALTER TABLE [dbo].[tblChiTietNhapHang]  WITH CHECK ADD  CONSTRAINT [FK_MaDonNhapHang] FOREIGN KEY([sMaDonNhapHang])
REFERENCES [dbo].[tblDonNhapHang] ([sMaDonNhapHang])
GO
ALTER TABLE [dbo].[tblChiTietNhapHang] CHECK CONSTRAINT [FK_MaDonNhapHang]
GO
ALTER TABLE [dbo].[tblChiTietNhapHang]  WITH CHECK ADD  CONSTRAINT [FK_MaMH_CTNH] FOREIGN KEY([sMaMH])
REFERENCES [dbo].[tblMatHang] ([sMaMH])
GO
ALTER TABLE [dbo].[tblChiTietNhapHang] CHECK CONSTRAINT [FK_MaMH_CTNH]
GO
ALTER TABLE [dbo].[tblChiTietNhapHang]  WITH CHECK ADD  CONSTRAINT [FK_MaSize_CTNH] FOREIGN KEY([iMaSize])
REFERENCES [dbo].[tblSize] ([iMaSize])
GO
ALTER TABLE [dbo].[tblChiTietNhapHang] CHECK CONSTRAINT [FK_MaSize_CTNH]
GO
ALTER TABLE [dbo].[tblDonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_MaKH] FOREIGN KEY([iMaKH])
REFERENCES [dbo].[tblKhachHang] ([iMaKH])
GO
ALTER TABLE [dbo].[tblDonDatHang] CHECK CONSTRAINT [FK_MaKH]
GO
ALTER TABLE [dbo].[tblDonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_MaNV_DDH] FOREIGN KEY([iMaNV])
REFERENCES [dbo].[tblNhanVien] ([iMaNV])
GO
ALTER TABLE [dbo].[tblDonDatHang] CHECK CONSTRAINT [FK_MaNV_DDH]
GO
ALTER TABLE [dbo].[tblDonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_MaTT_DDH] FOREIGN KEY([iMaTrangThai])
REFERENCES [dbo].[tblTrangThai] ([iMaTrangThai])
GO
ALTER TABLE [dbo].[tblDonDatHang] CHECK CONSTRAINT [FK_MaTT_DDH]
GO
ALTER TABLE [dbo].[tblDonNhapHang]  WITH CHECK ADD  CONSTRAINT [FK_MaNSX2] FOREIGN KEY([iMaNSX])
REFERENCES [dbo].[tblNhaSanXuat] ([iMaNSX])
GO
ALTER TABLE [dbo].[tblDonNhapHang] CHECK CONSTRAINT [FK_MaNSX2]
GO
ALTER TABLE [dbo].[tblDonNhapHang]  WITH CHECK ADD  CONSTRAINT [FK_MaNV_DNH] FOREIGN KEY([iMaNV])
REFERENCES [dbo].[tblNhanVien] ([iMaNV])
GO
ALTER TABLE [dbo].[tblDonNhapHang] CHECK CONSTRAINT [FK_MaNV_DNH]
GO
ALTER TABLE [dbo].[tblDonNhapHang]  WITH CHECK ADD  CONSTRAINT [FK_MaTT] FOREIGN KEY([iMaTrangThai])
REFERENCES [dbo].[tblTrangThai] ([iMaTrangThai])
GO
ALTER TABLE [dbo].[tblDonNhapHang] CHECK CONSTRAINT [FK_MaTT]
GO
ALTER TABLE [dbo].[tblHeThong]  WITH CHECK ADD  CONSTRAINT [FK_TK] FOREIGN KEY([sTenDangNhap])
REFERENCES [dbo].[tblTaiKhoan] ([sTenDangNhap])
GO
ALTER TABLE [dbo].[tblHeThong] CHECK CONSTRAINT [FK_TK]
GO
ALTER TABLE [dbo].[tblKhachHang]  WITH CHECK ADD  CONSTRAINT [FK_TenDangNhap] FOREIGN KEY([sTenDangNhap])
REFERENCES [dbo].[tblTaiKhoan] ([sTenDangNhap])
GO
ALTER TABLE [dbo].[tblKhachHang] CHECK CONSTRAINT [FK_TenDangNhap]
GO
ALTER TABLE [dbo].[tblKhachHang]  WITH CHECK ADD  CONSTRAINT [FK_TenDangNhap_NV] FOREIGN KEY([sTenDangNhap])
REFERENCES [dbo].[tblTaiKhoan] ([sTenDangNhap])
GO
ALTER TABLE [dbo].[tblKhachHang] CHECK CONSTRAINT [FK_TenDangNhap_NV]
GO
ALTER TABLE [dbo].[tblKho]  WITH CHECK ADD  CONSTRAINT [FK_MaMH] FOREIGN KEY([sMaMH])
REFERENCES [dbo].[tblMatHang] ([sMaMH])
GO
ALTER TABLE [dbo].[tblKho] CHECK CONSTRAINT [FK_MaMH]
GO
ALTER TABLE [dbo].[tblKho]  WITH CHECK ADD  CONSTRAINT [FK_MaSize] FOREIGN KEY([iMaSize])
REFERENCES [dbo].[tblSize] ([iMaSize])
GO
ALTER TABLE [dbo].[tblKho] CHECK CONSTRAINT [FK_MaSize]
GO
ALTER TABLE [dbo].[tblLoaiMatHang]  WITH CHECK ADD  CONSTRAINT [FK_MaDM] FOREIGN KEY([iMaDM])
REFERENCES [dbo].[tblDanhMuc] ([iMaDM])
GO
ALTER TABLE [dbo].[tblLoaiMatHang] CHECK CONSTRAINT [FK_MaDM]
GO
ALTER TABLE [dbo].[tblMatHang]  WITH CHECK ADD  CONSTRAINT [FK_MaLoaiMH] FOREIGN KEY([iMaLoaiMH])
REFERENCES [dbo].[tblLoaiMatHang] ([iMaLoaiMH])
GO
ALTER TABLE [dbo].[tblMatHang] CHECK CONSTRAINT [FK_MaLoaiMH]
GO
ALTER TABLE [dbo].[tblMatHang]  WITH CHECK ADD  CONSTRAINT [FK_MaTT_MH] FOREIGN KEY([iMaTrangThai])
REFERENCES [dbo].[tblTrangThai] ([iMaTrangThai])
GO
ALTER TABLE [dbo].[tblMatHang] CHECK CONSTRAINT [FK_MaTT_MH]
GO
ALTER TABLE [dbo].[tblPhieuNhapKho]  WITH CHECK ADD  CONSTRAINT [FK_MaDNH] FOREIGN KEY([sMaDonNhapHang])
REFERENCES [dbo].[tblDonNhapHang] ([sMaDonNhapHang])
GO
ALTER TABLE [dbo].[tblPhieuNhapKho] CHECK CONSTRAINT [FK_MaDNH]
GO
ALTER TABLE [dbo].[tblPhieuNhapKho]  WITH CHECK ADD  CONSTRAINT [FK_MaNV_PNK] FOREIGN KEY([iMaNV])
REFERENCES [dbo].[tblNhanVien] ([iMaNV])
GO
ALTER TABLE [dbo].[tblPhieuNhapKho] CHECK CONSTRAINT [FK_MaNV_PNK]
GO
ALTER TABLE [dbo].[tblPhieuNhapKho]  WITH CHECK ADD  CONSTRAINT [FK_MaTrangThai_PNK] FOREIGN KEY([iMaTrangThai])
REFERENCES [dbo].[tblTrangThai] ([iMaTrangThai])
GO
ALTER TABLE [dbo].[tblPhieuNhapKho] CHECK CONSTRAINT [FK_MaTrangThai_PNK]
GO
ALTER TABLE [dbo].[tblPhieuNhapKho]  WITH CHECK ADD  CONSTRAINT [FK_PNK_Kho] FOREIGN KEY([iMaKho])
REFERENCES [dbo].[tblKho] ([iMaKho])
GO
ALTER TABLE [dbo].[tblPhieuNhapKho] CHECK CONSTRAINT [FK_PNK_Kho]
GO
ALTER TABLE [dbo].[tblPhieuXuatKho]  WITH CHECK ADD  CONSTRAINT [FK_MaDDH] FOREIGN KEY([sMaDonDatHang])
REFERENCES [dbo].[tblDonDatHang] ([sMaDonDatHang])
GO
ALTER TABLE [dbo].[tblPhieuXuatKho] CHECK CONSTRAINT [FK_MaDDH]
GO
ALTER TABLE [dbo].[tblPhieuXuatKho]  WITH CHECK ADD  CONSTRAINT [FK_MaKho] FOREIGN KEY([iMaKho])
REFERENCES [dbo].[tblKho] ([iMaKho])
GO
ALTER TABLE [dbo].[tblPhieuXuatKho] CHECK CONSTRAINT [FK_MaKho]
GO
ALTER TABLE [dbo].[tblPhieuXuatKho]  WITH CHECK ADD  CONSTRAINT [FK_MaNV] FOREIGN KEY([iMaNV])
REFERENCES [dbo].[tblNhanVien] ([iMaNV])
GO
ALTER TABLE [dbo].[tblPhieuXuatKho] CHECK CONSTRAINT [FK_MaNV]
GO
ALTER TABLE [dbo].[tblPhieuXuatKho]  WITH CHECK ADD  CONSTRAINT [FK_MaTrangThai] FOREIGN KEY([iMaTrangThai])
REFERENCES [dbo].[tblTrangThai] ([iMaTrangThai])
GO
ALTER TABLE [dbo].[tblPhieuXuatKho] CHECK CONSTRAINT [FK_MaTrangThai]
GO
ALTER TABLE [dbo].[tblTaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_MaQuyen] FOREIGN KEY([iMaQuyen])
REFERENCES [dbo].[tblQuyen] ([iMaQuyen])
GO
ALTER TABLE [dbo].[tblTaiKhoan] CHECK CONSTRAINT [FK_MaQuyen]
GO
ALTER TABLE [dbo].[tblTaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_MaTT_TK] FOREIGN KEY([iMaTrangThai])
REFERENCES [dbo].[tblTrangThai] ([iMaTrangThai])
GO
ALTER TABLE [dbo].[tblTaiKhoan] CHECK CONSTRAINT [FK_MaTT_TK]
GO
ALTER TABLE [dbo].[tblTrangThai]  WITH CHECK ADD  CONSTRAINT [FK_LTT] FOREIGN KEY([iMaLoaiTrangThai])
REFERENCES [dbo].[tblLoaiTrangThai] ([iMaLoaiTrangThai])
GO
ALTER TABLE [dbo].[tblTrangThai] CHECK CONSTRAINT [FK_LTT]
GO
/****** Object:  StoredProcedure [dbo].[capnhat_Trangthai_Mathang]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[capnhat_Trangthai_Mathang](@MaMH VARCHAR(50),@MaTrangThai INT)
AS
BEGIN
	UPDATE tblMatHang
	SET iMaTrangThai = @MaTrangThai
	WHERE sMaMH = @MaMH
END
GO
/****** Object:  StoredProcedure [dbo].[count_DDH]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[count_DDH]
AS
BEGIN
	SELECT COUNT(sMaDonDatHang) FROM tblDonDatHang
END
GO
/****** Object:  StoredProcedure [dbo].[count_DNH]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[count_DNH]
AS
BEGIN
	SELECT COUNT(sMaDonNhapHang) FROM tblDonNhapHang
END
GO
/****** Object:  StoredProcedure [dbo].[count_Mathang]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[count_Mathang]
AS
BEGIN
	SELECT COUNT(sMaMH) FROM tblMatHang
END
GO
/****** Object:  StoredProcedure [dbo].[count_PNK]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[count_PNK]
AS
BEGIN
	SELECT COUNT(sMaPhieuNhapKho) FROM tblPhieuNhapKho
END
GO
/****** Object:  StoredProcedure [dbo].[count_PXK]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[count_PXK]
AS
BEGIN
	SELECT COUNT(sMaPhieuXuatKho) FROM tblPhieuXuatKho
END
GO
/****** Object:  StoredProcedure [dbo].[dangki_TKKhachhang]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[dangki_TKKhachhang](@TenKH NVARCHAR(100),@Sdt VARCHAR(20),@Diachigiaohang NVARCHAR(100),@Tendangnhap VARCHAR(50),@Matkhau VARCHAR(50))
AS
BEGIN
	IF NOT EXISTS(SELECT * FROM tblTaiKhoan WHERE sTenDangNhap = @Tendangnhap)
	BEGIN
		INSERT INTO tblTaiKhoan
		VALUES(@Tendangnhap,@Matkhau,NULL,'1','6',GETDATE(),NULL)

		INSERT INTO tblKhachHang
		VALUES(@TenKH,@Sdt,NULL,NULL,NULL,@Diachigiaohang,@Tendangnhap,GETDATE(),NULL)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[dsAnhMathang_theoID]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[dsAnhMathang_theoID](@id VARCHAR(50))
AS
BEGIN
	SELECT sHinhanh
	FROM tblMatHang,tblLoaiMatHang,tblChiTietNhapHang 
	WHERE tblMatHang.iMaLoaiMH = tblLoaiMatHang.iMaLoaiMH AND tblChiTietNhapHang.sMaMH = tblMatHang.sMaMH AND tblMatHang.sMaMH = @id
	GROUP BY sHinhanh
END
GO
/****** Object:  StoredProcedure [dbo].[dsLoaimathang_random]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[dsLoaimathang_random]
AS
BEGIN
	SELECT TOP 4 * FROM tblLoaiMatHang
	ORDER BY NEWID()
END
GO
/****** Object:  StoredProcedure [dbo].[dsMathang_Aobongdatreem_random]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[dsMathang_Aobongdatreem_random]
AS
BEGIN
	SELECT TOP 3 * FROM tblLoaiMatHang,tblMatHang,tblChiTietNhapHang
	WHERE tblMatHang.iMaLoaiMH = tblLoaiMatHang.iMaLoaiMH AND tblChiTietNhapHang.sMaMH = tblMatHang.sMaMH
	AND tblLoaiMatHang.iMaLoaiMH = '3'
		AND tblMatHang.sMaMH IN (SELECT sMaMH FROM tblKho)
	ORDER BY NEWID()
END
GO
/****** Object:  StoredProcedure [dbo].[dsMathang_MoiNhat]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[dsMathang_MoiNhat]
AS
BEGIN
	SELECT tblDonDatHang.sMaDonDatHang,tblDonDatHang.dThoigiantao,sHinhanh,sTenSize,fGianhap,iSLMua,sTenTrangThai,tblMatHang.sMaMH,sTenMH,(fGianhap*iSLMua) AS [fThanhtien]
	FROM tblMatHang,tblTrangThai,tblChiTietNhapHang,tblDonDatHang,tblChiTietDatHang,tblSize
	WHERE tblMatHang.sMaMH = tblChiTietNhapHang.sMaMH AND tblChiTietDatHang.sMaMH = tblMatHang.sMaMH AND tblSize.iMaSize = tblChiTietDatHang.iMaSize
		AND tblDonDatHang.sMaDonDatHang = tblChiTietDatHang.sMaDonDatHang AND tblTrangThai.iMaTrangThai = tblDonDatHang.iMaTrangThai
		AND tblDonDatHang.sMaDonDatHang = (SELECT TOP 1 sMaDonDatHang FROM tblDonDatHang ORDER BY dThoigiantao DESC)
	GROUP BY tblDonDatHang.sMaDonDatHang,tblDonDatHang.dThoigiantao,sHinhanh,sTenSize,fGianhap,iSLMua,sTenTrangThai,tblMatHang.sMaMH,sTenMH,(fGianhap*iSLMua)
	ORDER BY tblDonDatHang.dThoigiantao DESC
END
GO
/****** Object:  StoredProcedure [dbo].[dsMathang_theoID]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[dsMathang_theoID](@id VARCHAR(50))
AS
BEGIN
	SELECT *
	FROM tblMatHang,tblLoaiMatHang,tblChiTietNhapHang 
	WHERE tblMatHang.iMaLoaiMH = tblLoaiMatHang.iMaLoaiMH AND tblChiTietNhapHang.sMaMH = tblMatHang.sMaMH AND tblMatHang.sMaMH = @id
END
GO
/****** Object:  StoredProcedure [dbo].[duyet_Donnhaphang]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[duyet_Donnhaphang](@MaDonNhapHang VARCHAR(50),@PhieuNhapKho VARCHAR(50),@MaNV INT)
AS
BEGIN
	BEGIN
		UPDATE tblDonNhapHang
		SET iMaTrangThai = '6',dThoigiansua = GETDATE()
		WHERE sMaDonNhapHang = @MaDonNhapHang
	END
	BEGIN
		INSERT INTO tblPhieuNhapKho
		VALUES(@PhieuNhapKho,@MaNV,GETDATE(),GETDATE(),NULL,'10','2',@MaDonNhapHang)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[get_chitietDonhang]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_chitietDonhang](@id VARCHAR(50))
AS
BEGIN
	SELECT tblChiTietDatHang.dThoigiantao,tblDonDatHang.sMaDonDatHang,tblChiTietDatHang.sMaMH,sTenMH,tblSize.iMaSize,sTenSize,fGianhap,iSLMua, (fGianhap*iSLMua) AS [fThanhtien] 
	FROM tblChiTietDatHang,tblMatHang,tblSize,tblDonDatHang,tblChiTietNhapHang
	WHERE tblChiTietDatHang.sMaMH = tblMatHang.sMaMH AND tblSize.iMaSize = tblChiTietDatHang.iMaSize 
		AND tblDonDatHang.sMaDonDatHang = tblChiTietDatHang.sMaDonDatHang AND tblChiTietNhapHang.sMaMH = tblMatHang.sMaMH 
		AND tblDonDatHang.sMaDonDatHang = @id
	GROUP BY tblChiTietDatHang.dThoigiantao,tblDonDatHang.sMaDonDatHang,tblChiTietDatHang.sMaMH,sTenMH,tblSize.iMaSize,sTenSize,fGianhap,iSLMua
	ORDER BY tblChiTietDatHang.dThoigiantao DESC
END
GO
/****** Object:  StoredProcedure [dbo].[get_chitietDonnhaphang]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_chitietDonnhaphang](@id VARCHAR(50))
AS
BEGIN
	SELECT *, (fGianhap*iSoluongnhap) AS [fThanhtien],((fGianhap*iSoluongnhap) - (fGianhap*iSoluongnhap*(fMucchietkhau/100))) AS [fThanhtien_Sauchietkhau]
	FROM tblDonNhapHang,tblNhaSanXuat,tblNhanVien,tblChiTietNhapHang,tblMatHang,tblSize
	WHERE tblNhanVien.iMaNV = tblDonNhapHang.iMaNV AND tblDonNhapHang.sMaDonNhapHang = tblChiTietNhapHang.sMaDonNhapHang 
		AND tblChiTietNhapHang.sMaMH = tblMatHang.sMaMH AND tblNhaSanXuat.iMaNSX = tblDonNhapHang.iMaNSX AND tblChiTietNhapHang.iMaSize = tblSize.iMaSize
		AND tblDonNhapHang.sMaDonNhapHang = @id
	ORDER BY dNgaynhap DESC
END
GO
/****** Object:  StoredProcedure [dbo].[get_Donhang_Tongtien]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_Donhang_Tongtien](@id VARCHAR(50))
AS
BEGIN
	SELECT sMaDonDatHang, SUM(fThanhtien) AS [fTongtien]
	FROM vw_chitietDonhang
	WHERE sMaDonDatHang = @id
	GROUP BY sMaDonDatHang
END
	
GO
/****** Object:  StoredProcedure [dbo].[get_Donnhaphang_Tongtien]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_Donnhaphang_Tongtien](@id VARCHAR(50))
AS
BEGIN
	SELECT sMaDonNhapHang, SUM(fThanhtien_Sauchietkhau) AS [fTongtien_Donnhaphang]
	FROM vw_chitietDonnhaphang
	WHERE sMaDonNhapHang = @id
	GROUP BY sMaDonNhapHang
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsALL_PhieuXuatKho]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsALL_PhieuXuatKho]
AS
BEGIN
	SELECT * FROM tblPhieuXuatKho,tblTrangThai,tblNhanVien
	WHERE tblPhieuXuatKho.iMaTrangThai = tblTrangThai.iMaTrangThai AND tblPhieuXuatKho.iMaNV = tblNhanVien.iMaNV
		--AND tblNhanVien.iMaNV = '1'
	ORDER BY dNgayxuat DESC
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsALLPhieuNhapKho]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsALLPhieuNhapKho]
AS
BEGIN
	SELECT * FROM tblPhieuNhapKho,tblTrangThai,tblNhanVien
	WHERE tblPhieuNhapKho.iMaTrangThai = tblTrangThai.iMaTrangThai AND tblPhieuNhapKho.iMaNV = tblNhanVien.iMaNV
	ORDER BY dNgaynhapkho DESC
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsDanhmuc]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsDanhmuc]
AS
BEGIN
	SELECT *
	FROM tblDanhMuc
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsDonhang]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsDonhang]
AS
BEGIN
	SELECT tblDonDatHang.dThoigiantao,tblDonDatHang.dThoigiansua,sTenNV,sTenKH,* 
	FROM tblDonDatHang,tblTrangthai,tblNhanVien,tblKhachHang
	WHERE tblDonDatHang.iMaTrangThai = tblTrangthai.iMaTrangThai AND
		tblNhanVien.iMaNV = tblDonDatHang.iMaNV AND tblDonDatHang.iMaKH = tblKhachHang.iMaKH
	ORDER BY tblDonDatHang.dThoigiantao DESC
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsDonhang_theoIDTrangthai]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsDonhang_theoIDTrangthai](@id VARCHAR(50))
AS
BEGIN
	SELECT tblDonDatHang.dThoigiantao,tblDonDatHang.dThoigiansua,* 
	FROM tblDonDatHang,tblTrangthai,tblNhanVien,tblLoaiTrangThai
	WHERE tblDonDatHang.iMaTrangThai = tblTrangthai.iMaTrangThai AND 
		tblNhanVien.iMaNV = tblDonDatHang.iMaNV AND tblLoaiTrangThai.iMaLoaiTrangThai = tblTrangThai.iMaLoaiTrangThai
		AND tblTrangthai.iMaTrangThai = @id
	ORDER BY tblDonDatHang.dThoigiantao DESC
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsDonnhaphang]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsDonnhaphang]
AS
BEGIN
	SELECT *
	FROM tblDonNhapHang,tblTrangthai,tblNhanVien,tblNhaSanXuat
	WHERE tblDonNhapHang.iMaTrangThai = tblTrangthai.iMaTrangThai AND
		tblNhanVien.iMaNV = tblDonNhapHang.iMaNV AND tblNhaSanXuat.iMaNSX = tblDonNhapHang.iMaNSX
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsDonnhaphang_theoIDTrangthai]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsDonnhaphang_theoIDTrangthai](@id VARCHAR(50))
AS
BEGIN
	SELECT tblDonNhapHang.dThoigiantao,*
	FROM tblDonNhapHang,tblTrangthai,tblNhanVien,tblNhaSanXuat
	WHERE tblDonNhapHang.iMaTrangThai = tblTrangthai.iMaTrangThai AND
		tblNhanVien.iMaNV = tblDonNhapHang.iMaNV AND tblNhaSanXuat.iMaNSX = tblDonNhapHang.iMaNSX 
		AND tblTrangthai.iMaTrangThai = @id
	ORDER BY tblDonNhapHang.dThoigiantao DESC
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsKhachhang]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsKhachhang]
AS
BEGIN
	SELECT * FROM tblKhachHang
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsLoaiMH]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsLoaiMH]
AS
BEGIN
	SELECT *
	FROM tblLoaiMatHang
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsLoaiMH_theoDM]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsLoaiMH_theoDM](@id VARCHAR(10))
AS
BEGIN
	SELECT * FROM tblLoaiMatHang 
	WHERE iMaDM = @id
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsMathang]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsMathang]
AS
BEGIN
	SELECT tblMatHang.sMaMH,sTenMH,sHinhanh,sDonvitinh,sMota,tblMatHang.dThoigiantao,tblMatHang.dThoigiansua,sTenTrangThai,sTenLoaiMH
	FROM tblMatHang,tblTrangThai,tblLoaiTrangThai,tblLoaiMatHang
	WHERE tblMatHang.iMaTrangThai = tblTrangThai.iMaTrangThai AND tblTrangThai.iMaLoaiTrangThai = tblLoaiTrangThai.iMaLoaiTrangThai
		AND tblMatHang.iMaLoaiMH = tblLoaiMatHang.iMaLoaiMH
		--AND tblMatHang.sMaMH IN (SELECT sMaMH FROM tblKho GROUP BY sMaMH)
	GROUP BY tblMatHang.sMaMH,sTenMH,sHinhanh,sDonvitinh,sMota,tblMatHang.dThoigiantao,tblMatHang.dThoigiansua,sTenTrangThai,sTenLoaiMH
	ORDER BY dThoigiantao DESC
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsMathang_CLB]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsMathang_CLB]
AS
BEGIN
	SELECT TOP 12 tblMatHang.sMaMH,sTenMH,sHinhanh,fGianhap,sDonvitinh,sMota,tblMatHang.dThoigiantao,tblMatHang.dThoigiansua,sTenTrangThai,sTenLoaiMH
	FROM tblMatHang,tblTrangThai,tblLoaiTrangThai,tblLoaiMatHang,tblChiTietNhapHang
	WHERE tblMatHang.iMaTrangThai = tblTrangThai.iMaTrangThai AND tblTrangThai.iMaLoaiTrangThai = tblLoaiTrangThai.iMaLoaiTrangThai
		AND tblMatHang.iMaLoaiMH = tblLoaiMatHang.iMaLoaiMH AND tblLoaiMatHang.iMaLoaiMH = '1' AND tblChiTietNhapHang.sMaMH = tblMatHang.sMaMH
		AND tblMatHang.sMaMH IN (SELECT sMaMH FROM tblKho)
	ORDER BY NEWID()
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsMathang_Kho]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsMathang_Kho]
AS
BEGIN
	SELECT tblKho.sMaMH,sHinhanh,sTenMH
	FROM tblKho,tblMatHang
	WHERE tblMatHang.sMaMH = tblKho.sMaMH
	GROUP BY tblKho.sMaMH,sHinhanh,sTenMH
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsMathang_theoLoaiMH]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsMathang_theoLoaiMH](@id VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblMatHang,tblChiTietNhapHang
	WHERE tblMatHang.sMaMH = tblChiTietNhapHang.sMaMH AND iMaLoaiMH = @id
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsMathang_theoNSX]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsMathang_theoNSX](@id VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblMatHang,tblChiTietNhapHang,tblDonNhapHang
	WHERE tblMatHang.sMaMH = tblChiTietNhapHang.sMaMH AND tblDonNhapHang.sMaDonNhapHang = tblChiTietNhapHang.sMaDonNhapHang
	AND iMaNSX = @id
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsMathang_trongCTDH]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsMathang_trongCTDH](@MaDDH VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblChiTietDatHang WHERE sMaDonDatHang = @MaDDH
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsMathang_trongCTNH]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsMathang_trongCTNH](@MaDNH VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblChiTietNhapHang WHERE sMaDonNhapHang = @MaDNH
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsMathang_trongKho]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsMathang_trongKho]
AS
BEGIN
	SELECT tblMatHang.sMaMH,sTenMH
	FROM tblMatHang,tblKho 
	WHERE tblMatHang.sMaMH = tblKho.sMaMH AND tblMatHang.sMaMH IN (SELECT sMaMH FROM tblKho GROUP BY sMaMH)
	GROUP BY tblMatHang.sMaMH,sTenMH
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsNSX]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsNSX]
AS
BEGIN
	SELECT * FROM tblNhaSanXuat
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsPhieuNhapKho_theoIDTrangthai]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsPhieuNhapKho_theoIDTrangthai](@id VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblPhieuNhapKho,tblTrangThai,tblNhanVien
	WHERE tblPhieuNhapKho.iMaTrangThai = tblTrangThai.iMaTrangThai AND tblPhieuNhapKho.iMaNV = tblNhanVien.iMaNV
		 AND tblTrangThai.iMaTrangThai = @id
	ORDER BY dNgaynhapkho DESC
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsPhieuXuatKho]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsPhieuXuatKho](@id VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblPhieuXuatKho,tblTrangThai,tblNhanVien
	WHERE tblPhieuXuatKho.iMaTrangThai = tblTrangThai.iMaTrangThai AND tblPhieuXuatKho.iMaNV = tblNhanVien.iMaNV
		AND sMaDonDatHang IN (SELECT sMaDonDatHang FROM tblDonDatHang WHERE iMaTrangThai = '3')
		 AND tblTrangThai.iMaTrangThai = @id
	ORDER BY dNgayxuat DESC
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsQuyen]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--thu tuc lay danh sach quyen
CREATE PROC [dbo].[get_dsQuyen]
AS
BEGIN
	SELECT *
	FROM tblQuyen
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsSize]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsSize]
AS
BEGIN
	SELECT * FROM tblSize
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsSize_Mathang_Kho]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsSize_Mathang_Kho](@id VARCHAR(50))
AS
BEGIN
	SELECT *
	FROM tblKho,tblMatHang,tblSize
	WHERE tblMatHang.sMaMH = tblKho.sMaMH AND tblSize.iMaSize = tblKho.iMaSize
		AND tblKho.sMaMH = @id--'78E8A4F7-F8A5-462E-B31D-015ED121EAEF'
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsSize_theoIDMH]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsSize_theoIDMH](@id VARCHAR(50))
AS
BEGIN
	SELECT sMaMH,tblSize.iMaSize,sTenSize 
	FROM tblSize,tblKho 
	WHERE tblSize.iMaSize = tblKho.iMaSize AND sMaMH = @id
	GROUP BY sMaMH,tblSize.iMaSize,sTenSize
END
GO
/****** Object:  StoredProcedure [dbo].[get_DSSize_theoMathang]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_DSSize_theoMathang](@id VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblKho,tblSize WHERE tblKho.iMaSize = tblSize.iMaSize AND sMaMH = @id
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsTaikhoan_ND]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsTaikhoan_ND]
AS
BEGIN
	SELECT *
	FROM tblTaiKhoan,tblTrangThai,tblQuyen,tblKhachHang
	WHERE tblTaiKhoan.iMaTrangThai = tblTrangThai.iMaTrangThai AND tblQuyen.iMaQuyen = tblTaiKhoan.iMaQuyen AND tblKhachHang.sTenDangNhap = tblTaiKhoan.sTenDangNhap
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsTaikhoan_NV]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsTaikhoan_NV]
AS
BEGIN
	SELECT *
	FROM tblTaiKhoan,tblTrangThai,tblQuyen,tblNhanVien
	WHERE tblTaiKhoan.iMaTrangThai = tblTrangThai.iMaTrangThai AND tblQuyen.iMaQuyen = tblTaiKhoan.iMaQuyen AND tblNhanVien.sTenDangNhap = tblTaiKhoan.sTenDangNhap
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsTrangthai_DDH]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsTrangthai_DDH]
AS
BEGIN
	SELECT * FROM tblTrangthai,tblLoaiTrangThai WHERE tblTrangthai.iMaLoaiTrangThai = tblLoaiTrangThai.iMaLoaiTrangThai
	AND tblLoaiTrangThai.iMaLoaiTrangThai = '2'
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsTrangthai_DNH]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsTrangthai_DNH]
AS
BEGIN
	SELECT * FROM tblTrangthai,tblLoaiTrangThai WHERE tblTrangthai.iMaLoaiTrangThai = tblLoaiTrangThai.iMaLoaiTrangThai
	AND tblLoaiTrangThai.iMaLoaiTrangThai = '3'
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsTrangthai_Mathang]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsTrangthai_Mathang]
AS
BEGIN
	SELECT * FROM tblTrangThai,tblLoaiTrangThai WHERE tblTrangThai.iMaLoaiTrangThai = tblLoaiTrangThai.iMaLoaiTrangThai
	AND tblLoaiTrangThai.iMaLoaiTrangThai = '6'
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsTrangthai_Taikhoan]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsTrangthai_Taikhoan]
AS
BEGIN
	SELECT *
	FROM tblTrangThai,tblLoaiTrangThai
	WHERE tblTrangThai.iMaLoaiTrangThai = tblLoaiTrangThai.iMaLoaiTrangThai AND tblLoaiTrangThai.iMaLoaiTrangThai = 1
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsTrangthai_TheoID]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsTrangthai_TheoID](@id VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblTrangthai,tblLoaiTrangThai WHERE tblTrangthai.iMaLoaiTrangThai = tblLoaiTrangThai.iMaLoaiTrangThai AND iMaTrangThai = @id
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsTrangthai_theoPNK]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsTrangthai_theoPNK]
AS
BEGIN
	SELECT * FROM tblTrangThai,tblLoaiTrangThai 
	WHERE tblTrangThai.iMaLoaiTrangThai = tblLoaiTrangThai.iMaLoaiTrangThai AND tblLoaiTrangThai.iMaLoaiTrangThai = '4'
END
GO
/****** Object:  StoredProcedure [dbo].[get_Mathang_theoChitietdonhang]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_Mathang_theoChitietdonhang](@id VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblChiTietNhapHang, tblMatHang,tblSize
	WHERE tblChiTietNhapHang.sMaMH = tblMatHang.sMaMH AND tblSize.iMaSize = tblChiTietNhapHang.iMaSize AND sMaDonNhapHang = @id
END
GO
/****** Object:  StoredProcedure [dbo].[get_MH_NSX]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_MH_NSX]
AS
BEGIN
	SELECT iMaNSX,sTenNSX,COUNT(SL) AS [Tong]
	FROM vw_MH_theoNSX
	GROUP BY iMaNSX,sTenNSX
END
GO
/****** Object:  StoredProcedure [dbo].[get_ttCuahang]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_ttCuahang]
AS
BEGIN
	SELECT *
	FROM tblHeThong
END
GO
/****** Object:  StoredProcedure [dbo].[get_TTKhachhang_theoID]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_TTKhachhang_theoID](@id VARCHAR(10))
AS
BEGIN
	SELECT * FROM tblKhachHang WHERE iMaKH = @id
END
GO
/****** Object:  StoredProcedure [dbo].[get_ttKhachhang_theoIDDonhang]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--thu tuc lay thong tin khach hang theo id don hang
CREATE PROC [dbo].[get_ttKhachhang_theoIDDonhang](@id VARCHAR(50))
AS
BEGIN
	SELECT sMaDonDatHang,tblDonDatHang.iMaKH,sTenKH,sSdt,dNgaysinh,sGioitinh,sEmail,sDiachi
	FROM tblDonDatHang,tblKhachHang
	WHERE tblKhachHang.iMaKH = tblDonDatHang.iMaKH AND tblDonDatHang.sMaDonDatHang = @id
	GROUP BY sMaDonDatHang,tblDonDatHang.iMaKH,sTenKH,sSdt,dNgaysinh,sGioitinh,sEmail,sDiachi
END
GO
/****** Object:  StoredProcedure [dbo].[get_ttKhachhang_theoTendangnhap]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_ttKhachhang_theoTendangnhap](@id VARCHAR(50))
AS
BEGIN
	SELECT *
	FROM tblTaiKhoan,tblKhachHang
	WHERE tblTaiKhoan.sTenDangNhap = tblKhachHang.sTenDangNhap
END
GO
/****** Object:  StoredProcedure [dbo].[get_ttNSX_theoIDDonhang]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_ttNSX_theoIDDonhang](@id VARCHAR(50))
AS
BEGIN
	SELECT sMaDonNhapHang,tblNhaSanXuat.iMaNSX,sTenNSX,sSdt,sDiachi
	FROM tblDonNhapHang,tblNhaSanXuat
	WHERE tblNhaSanXuat.iMaNSX = tblDonNhapHang.iMaNSX AND tblDonNhapHang.sMaDonNhapHang = @id
	GROUP BY sMaDonNhapHang,tblNhaSanXuat.iMaNSX,sTenNSX,sSdt,sDiachi
END
GO
/****** Object:  StoredProcedure [dbo].[getMathang_theoID]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[getMathang_theoID](@id VARCHAR(50))
AS
BEGIN
	SELECT *
	FROM tblMatHang
	WHERE sMaMH = @id
END
GO
/****** Object:  StoredProcedure [dbo].[getTaikhoan_theoID]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[getTaikhoan_theoID](@id VARCHAR(50))
AS
BEGIN
	SELECT *
	FROM tblTaiKhoan,tblNhanVien
	WHERE tblTaiKhoan.sTenDangNhap = tblNhanVien.sTenDangNhap AND tblTaiKhoan.sTenDangNhap = @id
END
GO
/****** Object:  StoredProcedure [dbo].[getTaikhoan_theoID_KH]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[getTaikhoan_theoID_KH](@id VARCHAR(50))
AS
BEGIN
	SELECT *
	FROM tblTaiKhoan,tblKhachHang
	WHERE tblTaiKhoan.sTenDangNhap = tblKhachHang.sTenDangNhap AND tblTaiKhoan.sTenDangNhap = @id
END
GO
/****** Object:  StoredProcedure [dbo].[huyDuyet_Donnhaphang]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[huyDuyet_Donnhaphang](@MaDonNhapHang VARCHAR(50))
AS
BEGIN
	BEGIN
		UPDATE tblDonNhapHang
		SET iMaTrangThai = '7',dThoigiansua = GETDATE()
		WHERE sMaDonNhapHang = @MaDonNhapHang
	END
END
GO
/****** Object:  StoredProcedure [dbo].[insert_Chitietdathang_Khachhang]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[insert_Chitietdathang_Khachhang](@MaMH VARCHAR(50), @SLMua INT, @MaSize INT)
AS
BEGIN
	BEGIN
		DECLARE @MaDDH VARCHAR(50)
		SELECT @MaDDH = sMaDonDatHang FROM tblDonDatHang WHERE sMaDonDatHang = (SELECT TOP 1 sMaDonDatHang FROM tblDonDatHang ORDER BY dThoigiantao DESC)
	END

	BEGIN
		INSERT INTO tblChiTietDatHang
		VALUES(@MaDDH,@MaMH,@SLMua,'1',GETDATE(),null,@MaSize)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[insert_Chitietdathang_Khachhang_Ngoaihethong]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[insert_Chitietdathang_Khachhang_Ngoaihethong](@MaDonDatHang VARCHAR(50),@MaMH VARCHAR(50),@SLMua INT,@MaSize INT)
AS
BEGIN
	IF EXISTS(SELECT * FROM tblChiTietDatHang WHERE sMaDonDatHang = @MaDonDatHang AND sMaMH = @MaMH AND iMaSize = @MaSize)
		BEGIN
			UPDATE tblChiTietDatHang
			SET iSLMua += @SLMua
			WHERE sMaDonDatHang = @MaDonDatHang AND sMaMH = @MaMH AND iMaSize = @MaSize
		END
	ELSE
		BEGIN
			INSERT INTO tblChiTietDatHang
			VALUES(@MaDonDatHang,@MaMH,@SLMua,'1',GETDATE(),NULL,@MaSize)
		END
END
GO
/****** Object:  StoredProcedure [dbo].[insert_Dondathang_Khachhang_Ngoaihethong]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[insert_Dondathang_Khachhang_Ngoaihethong](@TenKH NVARCHAR(50),@Sdt VARCHAR(20),@Diachigiaohang NVARCHAR(100),@dNgaygiaohang DATETIME,
@MaDonDatHang VARCHAR(10),@MaNV VARCHAR(50))
AS
BEGIN
	IF((@dNgaygiaohang - GETDATE()) > 2)
		BEGIN 
			BEGIN
				INSERT INTO tblKhachHang
				VALUES(@TenKH,@Sdt,NULL,NULL,NULL,@Diachigiaohang,NULL,GETDATE(),NULL)
			END
			BEGIN
				DECLARE @MaKH INT
				SELECT @MaKH = iMaKH
				FROM tblKhachHang
				WHERE iMaKH = (SELECT TOP 1 iMaKH FROM tblKhachHang ORDER BY dThoigiantao DESC)
			END
			BEGIN
				INSERT INTO tblDonDatHang
				VALUES(@MaDonDatHang,@MaNV,@MaKH,GETDATE(),@dNgaygiaohang,@Diachigiaohang,GETDATE(),NULL,'4')
			END
		END
END
GO
/****** Object:  StoredProcedure [dbo].[insert_Dondathang_Khachhang_Ngoaihethong_ND]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[insert_Dondathang_Khachhang_Ngoaihethong_ND](@TenKH NVARCHAR(50),@Sdt VARCHAR(20),@Diachigiaohang NVARCHAR(100),@dNgaygiaohang DATETIME,
@MaDonDatHang VARCHAR(10))
AS
BEGIN
	IF((@dNgaygiaohang - GETDATE()) > 2)
		BEGIN 
			INSERT INTO tblKhachHang
			VALUES(@TenKH,@Sdt,NULL,NULL,NULL,@Diachigiaohang,NULL,GETDATE(),NULL)

			DECLARE @MaKH INT
			SELECT @MaKH = iMaKH
			FROM tblKhachHang
			WHERE iMaKH = (SELECT TOP 1 iMaKH FROM tblKhachHang ORDER BY dThoigiantao DESC)

			INSERT INTO tblDonDatHang
			VALUES(@MaDonDatHang,'4',@MaKH,GETDATE(),@dNgaygiaohang,@Diachigiaohang,GETDATE(),NULL,'4')
		END
END
GO
/****** Object:  StoredProcedure [dbo].[insert_Dondathang_Khachhang_Tronghethong]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[insert_Dondathang_Khachhang_Tronghethong](@MaDonDatHang VARCHAR(10),@MaKH VARCHAR(10),@TenKH NVARCHAR(100),@Sdt VARCHAR(20),@dNgaygiaohang DATETIME, @Diachigiaohang NVARCHAR(100))
AS
BEGIN
	IF((@dNgaygiaohang - GETDATE()) > 2)
		BEGIN 
			UPDATE tblKhachHang
			SET sTenKH = @TenKH,sSdt = @Sdt,sDiachi = @Diachigiaohang
			WHERE iMaKH = @MaKH

			INSERT INTO tblDonDatHang
			VALUES(@MaDonDatHang,'4',@MaKH,GETDATE(),@dNgaygiaohang,@Diachigiaohang,GETDATE(),NULL,'4')
		END
END
GO
/****** Object:  StoredProcedure [dbo].[insert_ttCuahang]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[insert_ttCuahang](@MaCuaHang VARCHAR(50),@TenCuaHang NVARCHAR(255),@Sdt VARCHAR(50),@Email VARCHAR(50),@Diachi NVARCHAR(255),@Giomocua VARCHAR(10),@Giodongcua VARCHAR(10)
,@Mota NVARCHAR(255),@TenDangNhap VARCHAR(50))
AS
BEGIN
	INSERT INTO tblHeThong
	VALUES(@MaCuaHang,@TenCuaHang,@Sdt,@Email,@Diachi,@Giomocua,@Giodongcua,@Mota,@TenDangNhap)
END
GO
/****** Object:  StoredProcedure [dbo].[load_Trangthai_Phieuxuatkho]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[load_Trangthai_Phieuxuatkho]
AS
BEGIN
	SELECT * FROM tblTrangThai,tblLoaiTrangThai 
	WHERE tblTrangThai.iMaLoaiTrangThai = tblLoaiTrangThai.iMaLoaiTrangThai AND tblLoaiTrangThai.iMaLoaiTrangThai = '5'
END
GO
/****** Object:  StoredProcedure [dbo].[load_Trangthai_Phieuxuatkho_theoID]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--thu tuc lay trang thai phieu xuat kho
CREATE PROC [dbo].[load_Trangthai_Phieuxuatkho_theoID](@id VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblTrangThai,tblLoaiTrangThai 
	WHERE tblTrangThai.iMaLoaiTrangThai = tblLoaiTrangThai.iMaLoaiTrangThai AND tblLoaiTrangThai.iMaLoaiTrangThai = '5'
		AND iMaTrangThai = @id
END
GO
/****** Object:  StoredProcedure [dbo].[pr_Capnhat_DsMathang]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[pr_Capnhat_DsMathang](@MaMH VARCHAR(50),@TenMH NVARCHAR(100),@Hinhanh VARCHAR(50),@Donvitinh NVARCHAR(10),
@Mota NVARCHAR(255),@MaLoaiMH INT,@MaTrangThai INT)
AS
BEGIN
			UPDATE tblMatHang
			SET sTenMH = @TenMH,
				sHinhanh = @Hinhanh,
				sDonvitinh = @Donvitinh,
				sMota = @Mota,
				iMaLoaiMH = @MaLoaiMH,
				dThoigiansua = GETDATE(),
				iMaTrangThai = @MaTrangThai
			WHERE
				sMaMH = @MaMH
END
GO
/****** Object:  StoredProcedure [dbo].[pr_Capnhat_HuyTTDonhang]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[pr_Capnhat_HuyTTDonhang](@MaDonDatHang VARCHAR(50))
AS
BEGIN
	UPDATE tblDonDatHang
	SET iMaTrangThai = '4', dThoigiansua = GETDATE()
	WHERE sMaDonDatHang = @MaDonDatHang
END
GO
/****** Object:  StoredProcedure [dbo].[pr_Capnhat_TTDonhang]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[pr_Capnhat_TTDonhang](@MaDonDatHang VARCHAR(10),@MaPhieuXuatKho VARCHAR(10))
AS
BEGIN
	BEGIN
		UPDATE tblDonDatHang
		SET iMaTrangThai = '3', dThoigiansua = GETDATE()
		WHERE sMaDonDatHang = @MaDonDatHang
	END
	BEGIN
		INSERT INTO tblPhieuXuatKho
		VALUES(@MaPhieuXuatKho,'1',GETDATE(),GETDATE(),NULL,'13','2',@MaDonDatHang)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[pr_Dangnhap_ND]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[pr_Dangnhap_ND](@Tendangnhap VARCHAR(50), @Matkhau VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblTaiKhoan,tblQuyen,tblTrangThai,tblKhachHang
	WHERE tblTaiKhoan.iMaQuyen = tblQuyen.iMaQuyen AND tblTaiKhoan.iMaTrangThai = tblTrangThai.iMaTrangThai 
		AND tblTaiKhoan.sTenDangNhap = tblKhachHang.sTenDangNhap AND tblTaiKhoan.sTenDangNhap = @Tendangnhap AND sMatKhau = @Matkhau 
END
GO
/****** Object:  StoredProcedure [dbo].[pr_Dangnhap_Nguoidung]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--thu tuc dang nhap nhan vien
CREATE PROC [dbo].[pr_Dangnhap_Nguoidung](@Tendangnhap VARCHAR(50), @Matkhau VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblTaiKhoan,tblQuyen,tblTrangThai,tblKhachHang
	WHERE tblTaiKhoan.iMaQuyen = tblQuyen.iMaQuyen AND tblTaiKhoan.iMaTrangThai = tblTrangThai.iMaTrangThai 
		AND tblTaiKhoan.sTenDangNhap = tblKhachHang.sTenDangNhap AND tblTaiKhoan.sTenDangNhap = @Tendangnhap AND sMatKhau = @Matkhau 
END
GO
/****** Object:  StoredProcedure [dbo].[pr_Dangnhap_NV]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[pr_Dangnhap_NV](@Tendangnhap VARCHAR(50), @Matkhau VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblTaiKhoan,tblQuyen,tblTrangThai,tblNhanVien
	WHERE tblTaiKhoan.iMaQuyen = tblQuyen.iMaQuyen AND tblTaiKhoan.iMaTrangThai = tblTrangThai.iMaTrangThai 
		AND tblTaiKhoan.sTenDangNhap = tblNhanVien.sTenDangNhap AND tblTaiKhoan.sTenDangNhap = @Tendangnhap AND sMatKhau = @Matkhau 
END
GO
/****** Object:  StoredProcedure [dbo].[pr_Them_DsMathang]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[pr_Them_DsMathang](@MaMH VARCHAR(10),@TenMH NVARCHAR(100), @Hinhanh VARCHAR(50),@Donvitinh NVARCHAR(10),
@Mota NVARCHAR(255),@MaLoaiMH INT,@MaTrangThai INT)
AS
BEGIN
	INSERT INTO tblMatHang
	VALUES(@MaMH,@TenMH,@Hinhanh,@Donvitinh,@Mota,@MaLoaiMH,GETDATE(),null,@MaTrangThai)
END
GO
/****** Object:  StoredProcedure [dbo].[pr_Tudongtru_MH]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[pr_Tudongtru_MH](@MaDonDatHang VARCHAR(10),@MaMH VARCHAR(10),@SLMua INT, @MaSize INT)
AS
BEGIN
	IF EXISTS(SELECT * FROM tblChiTietDatHang WHERE sMaDonDatHang = @MaDonDatHang AND sMaMH = @MaMH  AND iMaSize = @MaSize)
		BEGIN
			UPDATE tblKho
			SET iSoluong -= @SLMua
			WHERE sMaMH = @MaMH  AND iMaSize = @MaSize

			UPDATE tblPhieuXuatKho
			SET iMaTrangThai = '12',dThoigiansua = GETDATE()
			WHERE sMaDonDatHang = @MaDonDatHang
		END
	ELSE
		BEGIN
			INSERT INTO tblKho
			VALUES(@MaMH,@SLMua,@MaSize)
		END
END
GO
/****** Object:  StoredProcedure [dbo].[sua_Chitietdonhang]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sua_Chitietdonhang](@DonNhapHang VARCHAR(10),@MaMH VARCHAR(10), @Gianhap FLOAT, @Soluongnhap INT, @Mucchietkhau FLOAT,@Masize INT)
AS
BEGIN
	IF EXISTS (SELECT * FROM tblChiTietNhapHang WHERE sMaDonNhapHang = @DonNhapHang AND sMaMH = @MaMH AND iMaSize = @Masize)
		BEGIN
			UPDATE tblChiTietNhapHang
			SET iSoluongnhap += @Soluongnhap
			WHERE sMaDonNhapHang = @DonNhapHang AND sMaMH = @MaMH AND iMaSize = @Masize
		END
	ELSE
		BEGIN
			UPDATE tblChiTietNhapHang
			SET sMaMH = @MaMH, fGianhap = @Gianhap, iSoluongnhap = @Soluongnhap, fMucchietkhau = @Mucchietkhau,dThoigiansua = GETDATE(),iMaSize = @Masize
			WHERE sMaDonNhapHang = @DonNhapHang AND sMaMH = @MaMH AND iMaSize = @Masize
		END
END
GO
/****** Object:  StoredProcedure [dbo].[them_Chitietdonnhaphang]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[them_Chitietdonnhaphang](@DonNhapHang VARCHAR(50),@MaMH VARCHAR(50), @Gianhap FLOAT, @Soluongnhap INT, @Mucchietkhau FLOAT, @Masize INT)
AS
BEGIN
	INSERT INTO tblChiTietNhapHang
	VALUES(@DonNhapHang,@MaMH,@Gianhap,@Soluongnhap,@Masize,@Mucchietkhau,GETDATE(),null)
END
GO
/****** Object:  StoredProcedure [dbo].[them_Donnhaphang]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[them_Donnhaphang](@MaDonDatHang VARCHAR(50),@iMaNV INT, @iMaNSX INT)
AS
BEGIN
	INSERT INTO tblDonNhapHang
	VALUES(@MaDonDatHang,@iMaNV,@iMaNSX,GETDATE(),GETDATE(),NULL,'7')
END
GO
/****** Object:  StoredProcedure [dbo].[timkiem_Mathang]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[timkiem_Mathang](@id NVARCHAR(100))
AS
BEGIN
	SELECT tblMatHang.sMaMH,sTenMH,sHinhanh,fGianhap,sDonvitinh,sMota,tblMatHang.dThoigiantao,tblMatHang.dThoigiansua,sTenTrangThai,sTenLoaiMH
	FROM tblMatHang,tblTrangThai,tblLoaiTrangThai,tblLoaiMatHang,tblChiTietNhapHang
	WHERE tblMatHang.iMaTrangThai = tblTrangThai.iMaTrangThai AND tblTrangThai.iMaLoaiTrangThai = tblLoaiTrangThai.iMaLoaiTrangThai
		AND tblMatHang.iMaLoaiMH = tblLoaiMatHang.iMaLoaiMH AND tblChiTietNhapHang.sMaMH = tblMatHang.sMaMH
		AND tblMatHang.sMaMH IN (SELECT sMaMH FROM tblKho) AND sTenMH LIKE N'%' + @id + '%'
	GROUP BY tblMatHang.sMaMH,sTenMH,sHinhanh,fGianhap,sDonvitinh,sMota,tblMatHang.dThoigiantao,tblMatHang.dThoigiansua,sTenTrangThai,sTenLoaiMH
END
GO
/****** Object:  StoredProcedure [dbo].[xacnhan_Phieunhapkho]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[xacnhan_Phieunhapkho](@MaDonNhapHang VARCHAR(10),
@MaMH VARCHAR(10),@Soluongnhap INT,@MaSize INT)
AS
BEGIN
	IF EXISTS(SELECT * FROM tblChiTietNhapHang WHERE sMaDonNhapHang = @MaDonNhapHang AND sMaMH = @MaMH  AND iMaSize = @MaSize)
		BEGIN
			UPDATE tblKho
			SET iSoluong += @Soluongnhap
			WHERE sMaMH = @MaMH  AND iMaSize = @MaSize

			UPDATE tblPhieuNhapKho
			SET iMaTrangThai = '9',dThoigiansua = GETDATE()
			WHERE sMaDonNhapHang = @MaDonNhapHang
		END
	ELSE
		BEGIN
			INSERT INTO tblKho
			VALUES(@MaMH,@Soluongnhap,@MaSize)
		END
END
GO
/****** Object:  StoredProcedure [dbo].[xoa_Chitietdonnhaphang]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[xoa_Chitietdonnhaphang](@MaDonNhapHang VARCHAR(50), @MaMH VARCHAR(50),@iMaSize VARCHAR(50))
AS
BEGIN
	DELETE FROM tblChiTietNhapHang
	WHERE sMaDonNhapHang = @MaDonNhapHang AND sMaMH = @MaMH AND iMaSize = @iMaSize
END
GO
/****** Object:  StoredProcedure [dbo].[xoa_DDH_theoID]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[xoa_DDH_theoID](@MaDDH VARCHAR(50))
AS
BEGIN
	BEGIN
		DELETE FROM tblDonDatHang 
		WHERE sMaDonDatHang = @MaDDH AND sMaDonDatHang NOT IN (SELECT sMaDonDatHang FROM tblChiTietDatHang)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[xoa_Mathang_CTDH]    Script Date: 4/7/2021 9:44:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[xoa_Mathang_CTDH](@MaDonDatHang VARCHAR(50),@MaMH VARCHAR(50), @MaSize INT)
AS
BEGIN
	DELETE FROM tblChiTietDatHang
	WHERE sMaMH = @MaMH AND iMaSize = @MaSize AND sMaDonDatHang = @MaDonDatHang
END
GO
USE [master]
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET  READ_WRITE 
GO
