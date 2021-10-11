USE WebsiteBanHang_DATN_VER2;
-------------------------------------------- Quan ly mat hang--------------------------------------------------------
--thu tuc lay danh sach mat hang VER2
ALTER PROC get_dsMathang
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

SELECT * FROM [dbo].[tblKho]
SELECT * FROM [dbo].[tblMatHang]

--thu tuc lay ngau nhien danh sach 9 mat hang ao cau lac bo VER2
ALTER PROC get_dsMathang_CLB
AS
BEGIN
	SELECT TOP 12 tblMatHang.sMaMH,sTenMH,sHinhanh,fGianhap,sDonvitinh,sMota,tblMatHang.dThoigiantao,tblMatHang.dThoigiansua,sTenTrangThai,sTenLoaiMH
	FROM tblMatHang,tblTrangThai,tblLoaiTrangThai,tblLoaiMatHang,tblChiTietNhapHang
	WHERE tblMatHang.iMaTrangThai = tblTrangThai.iMaTrangThai AND tblTrangThai.iMaLoaiTrangThai = tblLoaiTrangThai.iMaLoaiTrangThai
		AND tblMatHang.iMaLoaiMH = tblLoaiMatHang.iMaLoaiMH AND tblLoaiMatHang.iMaLoaiMH = '1' AND tblChiTietNhapHang.sMaMH = tblMatHang.sMaMH
		AND tblMatHang.sMaMH IN (SELECT sMaMH FROM tblKho)
	ORDER BY NEWID()
END

SELECT sMaMH,COUNT(sMaMH) FROM tblKho GROUP BY sMaMH

--thu tuc lay danh sach mat hang theo id VER2
CREATE PROC getMathang_theoID(@id VARCHAR(50))
AS
BEGIN
	SELECT *
	FROM tblMatHang
	WHERE sMaMH = @id
END

--thu tuc lay danh sach danh muc VER2
CREATE PROC get_dsDanhmuc
AS
BEGIN
	SELECT *
	FROM tblDanhMuc
END

SELECT * FROM tblLoaiMatHang
SELECT * FROM tblMatHang

--thu tuc lay danh sach loai mat hang theo danh muc VER2
ALTER PROC get_dsLoaiMH_theoDM(@id VARCHAR(10))
AS
BEGIN
	SELECT * FROM tblLoaiMatHang 
	WHERE iMaDM = @id
END

--GET DANH SACH MAT HANG THEO LOAI MAT HANG
ALTER PROC get_dsMathang_theoLoaiMH(@id VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblMatHang,tblChiTietNhapHang
	WHERE tblMatHang.sMaMH = tblChiTietNhapHang.sMaMH AND iMaLoaiMH = @id
END

--GET DANH SACH MAT HANG THEO NSX
CREATE PROC get_dsMathang_theoNSX(@id VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblMatHang,tblChiTietNhapHang,tblDonNhapHang
	WHERE tblMatHang.sMaMH = tblChiTietNhapHang.sMaMH AND tblDonNhapHang.sMaDonNhapHang = tblChiTietNhapHang.sMaDonNhapHang
	AND iMaNSX = @id
END

--lay so luong mat hang theo nha san xuat
CREATE PROC get_MH_theoNSX(@id VARCHAR(50))
AS
BEGIN
	SELECT tblNhaSanXuat.iMaNSX,sTenNSX,sMaMH,COUNT(sMaMH) AS  [Soluong]
	FROM tblChiTietNhapHang,tblNhaSanXuat,tblDonNhapHang WHERE tblDonNhapHang.sMaDonNhapHang = tblChiTietNhapHang.sMaDonNhapHang 
	AND tblNhaSanXuat.iMaNSX = tblDonNhapHang.iMaNSX AND sMaMH IN (SELECT sMaMH FROM tblKho) AND tblNhaSanXuat.iMaNSX = '6'
	GROUP BY tblNhaSanXuat.iMaNSX,sTenNSX,sMaMH

--BANG TAM XEM DS NSX
	ALTER VIEW vw_MH_theoNSX
	AS
		SELECT tblNhaSanXuat.iMaNSX,sTenNSX,sMaMH,COUNT(sMaMH) AS [SL]
		FROM tblNhaSanXuat,tblChiTietNhapHang,tblDonNhapHang
		WHERE tblDonNhapHang.sMaDonNhapHang = tblChiTietNhapHang.sMaDonNhapHang 
		AND tblNhaSanXuat.iMaNSX = tblDonNhapHang.iMaNSX 
		GROUP BY tblNhaSanXuat.iMaNSX,sTenNSX,sMaMH

--THU TUC HIEN NSX, SO LUONG MH THEO NSX
ALTER PROC get_MH_NSX
AS
BEGIN
	SELECT iMaNSX,sTenNSX,COUNT(SL) AS [Tong]
	FROM vw_MH_theoNSX
	GROUP BY iMaNSX,sTenNSX
END

--thu tuc lay danh sach loai mat hang VER2
CREATE PROC get_dsLoaiMH
AS
BEGIN
	SELECT *
	FROM tblLoaiMatHang
END

--thu tuc cap nhat mat hang VER2
ALTER PROC pr_Capnhat_DsMathang(@MaMH VARCHAR(50),@TenMH NVARCHAR(100),@Hinhanh VARCHAR(50),@Donvitinh NVARCHAR(10),
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

--thu tuc cap nhat trang thai hien thi mat hang VER2
CREATE PROC capnhat_Trangthai_Mathang(@MaMH VARCHAR(50),@MaTrangThai INT)
AS
BEGIN
	UPDATE tblMatHang
	SET iMaTrangThai = @MaTrangThai
	WHERE sMaMH = @MaMH
END

--thu tuc lay trang thai mat hang VER2
CREATE PROC get_dsTrangthai_Mathang
AS
BEGIN
	SELECT * FROM tblTrangThai,tblLoaiTrangThai WHERE tblTrangThai.iMaLoaiTrangThai = tblLoaiTrangThai.iMaLoaiTrangThai
	AND tblLoaiTrangThai.iMaLoaiTrangThai = '6'
END

--thu tuc dem so mat hang trong bang mat hang
CREATE PROC count_Mathang
AS
BEGIN
	SELECT COUNT(sMaMH) FROM tblMatHang
END

--thu tuc them mat hang VER2
ALTER PROC pr_Them_DsMathang(@MaMH VARCHAR(10),@TenMH NVARCHAR(100), @Hinhanh VARCHAR(50),@Donvitinh NVARCHAR(10),
@Mota NVARCHAR(255),@MaLoaiMH INT,@MaTrangThai INT)
AS
BEGIN
	INSERT INTO tblMatHang
	VALUES(@MaMH,@TenMH,@Hinhanh,@Donvitinh,@Mota,@MaLoaiMH,GETDATE(),null,@MaTrangThai)
END

SELECT * FROM tblMatHang
-------------------------------------------- End Quan ly mat hang------------------------------------------------------

-------------------------------------------- Quan ly tai khoan--------------------------------------------------------
--thu tuc dang ki tai khoan
CREATE PROC them_Taikhoan_Admin(@sTenNV NVARCHAR(50),@sGioitinh NVARCHAR(5),@dNgaysinh DATETIME,@sSdt VARCHAR(20),
@sQuequan NVARCHAR(20),@sEmail VARCHAR(50),@sTenDangNhap VARCHAR(50),@sMatKhau VARCHAR(50),@iMaTrangThai INT,@iMaQuyen INT,@iMaNV INT)
AS
BEGIN
	INSERT INTO tblNhanVien
	VALUES(N'@sTenNV',N'@sGioitinh','@dNgaysinh','@sSdt',N'@sQuequan','@sEmail', GETDATE())

	INSERT INTO tblTaiKhoan
	VALUES('@sTenDangNhap','@sMatKhau',NULL,'@iMaTrangThai','@iMaQuyen',GETDATE(),NULL,'@iMaNV')

	INSERT INTO tblTaiKhoan
	VALUES('@sTenDangNhap','@sMatKhau',NULL,'@iMaTrangThai','@iMaQuyen',GETDATE(),NULL,'@iMaNV')
END

--thu tuc dang nhap ok
CREATE PROC pr_Dangnhap(@Tendangnhap VARCHAR(50), @Matkhau VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblTaiKhoan,tblQuyen,tblTrangThai,tblNhanVien
	WHERE tblTaiKhoan.iMaQuyen = tblQuyen.iMaQuyen AND tblTaiKhoan.iMaTrangThai = tblTrangThai.iMaTrangThai 
		AND tblTaiKhoan.iMaNV = tblNhanVien.iMaNV AND sTenDangNhap = @Tendangnhap AND sMatKhau = @Matkhau 
END

--thu tuc dang nhap nhan vien VER2
CREATE PROC pr_Dangnhap_NV(@Tendangnhap VARCHAR(50), @Matkhau VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblTaiKhoan,tblQuyen,tblTrangThai,tblNhanVien
	WHERE tblTaiKhoan.iMaQuyen = tblQuyen.iMaQuyen AND tblTaiKhoan.iMaTrangThai = tblTrangThai.iMaTrangThai 
		AND tblTaiKhoan.sTenDangNhap = tblNhanVien.sTenDangNhap AND tblTaiKhoan.sTenDangNhap = @Tendangnhap AND sMatKhau = @Matkhau 
END

--thu tuc dang nhap ok VER2
CREATE PROC pr_Dangnhap_ND(@Tendangnhap VARCHAR(50), @Matkhau VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblTaiKhoan,tblQuyen,tblTrangThai,tblKhachHang
	WHERE tblTaiKhoan.iMaQuyen = tblQuyen.iMaQuyen AND tblTaiKhoan.iMaTrangThai = tblTrangThai.iMaTrangThai 
		AND tblTaiKhoan.sTenDangNhap = tblKhachHang.sTenDangNhap AND tblTaiKhoan.sTenDangNhap = @Tendangnhap AND sMatKhau = @Matkhau 
END

--thu tuc dang nhap nhan vien
CREATE PROC pr_Dangnhap_Nguoidung(@Tendangnhap VARCHAR(50), @Matkhau VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblTaiKhoan,tblQuyen,tblTrangThai,tblKhachHang
	WHERE tblTaiKhoan.iMaQuyen = tblQuyen.iMaQuyen AND tblTaiKhoan.iMaTrangThai = tblTrangThai.iMaTrangThai 
		AND tblTaiKhoan.sTenDangNhap = tblKhachHang.sTenDangNhap AND tblTaiKhoan.sTenDangNhap = @Tendangnhap AND sMatKhau = @Matkhau 
END

--thu tuc dang nhap ok
ALTER PROC pr_Dangnhap_Taikhoan(@Tendangnhap VARCHAR(50), @Matkhau VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblTaiKhoan,tblQuyen,tblTrangThai,tblNhanVien
	WHERE tblTaiKhoan.iMaQuyen = tblQuyen.iMaQuyen AND tblTaiKhoan.iMaTrangThai = tblTrangThai.iMaTrangThai 
		AND tblTaiKhoan.iMaNV = tblNhanVien.iMaNV AND sTenDangNhap = @Tendangnhap AND sMatKhau != @Matkhau 
END

--thu tuc dang nhap ok
ALTER PROC pr_Dangnhap_Matkhau(@Tendangnhap VARCHAR(50), @Matkhau VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblTaiKhoan,tblQuyen,tblTrangThai,tblNhanVien
	WHERE tblTaiKhoan.iMaQuyen = tblQuyen.iMaQuyen AND tblTaiKhoan.iMaTrangThai = tblTrangThai.iMaTrangThai 
		AND tblTaiKhoan.iMaNV = tblNhanVien.iMaNV AND sTenDangNhap != @Tendangnhap AND sMatKhau = @Matkhau 
END

--thu tuc lay danh sach tai khoan nhan vien VER2
CREATE PROC get_dsTaikhoan_NV
AS
BEGIN
	SELECT *
	FROM tblTaiKhoan,tblTrangThai,tblQuyen,tblNhanVien
	WHERE tblTaiKhoan.iMaTrangThai = tblTrangThai.iMaTrangThai AND tblQuyen.iMaQuyen = tblTaiKhoan.iMaQuyen AND tblNhanVien.sTenDangNhap = tblTaiKhoan.sTenDangNhap
END

--thu tuc lay danh sach tai khoan nguoi dung VER2
CREATE PROC get_dsTaikhoan_ND
AS
BEGIN
	SELECT *
	FROM tblTaiKhoan,tblTrangThai,tblQuyen,tblKhachHang
	WHERE tblTaiKhoan.iMaTrangThai = tblTrangThai.iMaTrangThai AND tblQuyen.iMaQuyen = tblTaiKhoan.iMaQuyen AND tblKhachHang.sTenDangNhap = tblTaiKhoan.sTenDangNhap
END

--thu tuc lay danh sach tai khoan theo id
ALTER PROC getTaikhoan_theoID(@id VARCHAR(50))
AS
BEGIN
	SELECT *
	FROM tblTaiKhoan,tblNhanVien
	WHERE tblTaiKhoan.sTenDangNhap = tblNhanVien.sTenDangNhap AND tblTaiKhoan.sTenDangNhap = @id
END

--thu tuc lay danh sach tai khoan theo id khach hang
CREATE PROC getTaikhoan_theoID_KH(@id VARCHAR(50))
AS
BEGIN
	SELECT *
	FROM tblTaiKhoan,tblKhachHang
	WHERE tblTaiKhoan.sTenDangNhap = tblKhachHang.sTenDangNhap AND tblTaiKhoan.sTenDangNhap = @id
END

--thu tuc update tai khoan
ALTER PROC update_dsTaikhoan(@Tendangnhap VARCHAR(50),@Matkhau VARCHAR(50),@MaTrangThai INT, @MaQuyen INT,@MaNV INT, @TenNV NVARCHAR(50),
@Gioitinh NVARCHAR(10),@Ngaysinh DATETIME,@Sdt VARCHAR(20),@Quequan NVARCHAR(20),@Email VARCHAR(50),@Ngayvaolam DATETIME)
AS
BEGIN
	BEGIN
		UPDATE tblTaiKhoan
		SET sMatKhau = @Matkhau, iMaTrangThai = @MaTrangThai, iMaQuyen = @MaQuyen, dThoigiansua = GETDATE()
		WHERE sTenDangNhap = @Tendangnhap
	END
	BEGIN
		UPDATE tblNhanVien
		SET sTenNV = @TenNV, sGioitinh = @Gioitinh, dNgaysinh = @Ngaysinh, sSdt = @Sdt, sQuequan = @Quequan, sEmail = @Email,
		dNgayvaolam = @Ngayvaolam
		WHERE iMaNV = @MaNV
	END
END

ALTER TABLE tblNhanVien
ALTER COLUMN sGioitinh VARCHAR(10)

--thu tuc lay danh sach trang thai
CREATE PROC get_dsTrangthai_Taikhoan
AS
BEGIN
	SELECT *
	FROM tblTrangThai,tblLoaiTrangThai
	WHERE tblTrangThai.iMaLoaiTrangThai = tblLoaiTrangThai.iMaLoaiTrangThai AND tblLoaiTrangThai.iMaLoaiTrangThai = 1
END

--thu tuc lay danh sach quyen
CREATE PROC get_dsQuyen
AS
BEGIN
	SELECT *
	FROM tblQuyen
END

ALTER TABLE tblTaiKhoan
ADD sMaNV VARCHAR(20) NOT NULL;

SELECT * FROM tblTaiKhoan

--thu tuc dang ki tai khoan khach hang
CREATE PROC dangki_TKKhachhang(@TenKH NVARCHAR(100),@Sdt VARCHAR(20),@Diachigiaohang NVARCHAR(100),@Tendangnhap VARCHAR(50),@Matkhau VARCHAR(50))
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

select * from [dbo].[tblKhachHang]
select * from [dbo].[tblTaiKhoan]
-------------------------------------------- End Quan ly tai khoan------------------------------------------------------

-----------------------------------------Quan ly cua hang------------------------------------------------------
--thu tuc lay thong tin cua hang
CREATE PROC get_ttCuahang
AS
BEGIN
	SELECT *
	FROM tblHeThong
END

--thu tuc them thong tin cua hang
CREATE PROC insert_ttCuahang(@MaCuaHang VARCHAR(50),@TenCuaHang NVARCHAR(255),@Sdt VARCHAR(50),@Email VARCHAR(50),@Diachi NVARCHAR(255),@Giomocua VARCHAR(10),@Giodongcua VARCHAR(10)
,@Mota NVARCHAR(255),@TenDangNhap VARCHAR(50))
AS
BEGIN
	INSERT INTO tblHeThong
	VALUES(@MaCuaHang,@TenCuaHang,@Sdt,@Email,@Diachi,@Giomocua,@Giodongcua,@Mota,@TenDangNhap)
END
----------------------------------------- End Quan ly cua hang------------------------------------------------------

-----------------------------------------Quan ly trang thai------------------------------------------------------
--thu tuc lay ds trang thai don dat hang ok
CREATE PROC get_dsTrangthai_DDH
AS
BEGIN
	SELECT * FROM tblTrangthai,tblLoaiTrangThai WHERE tblTrangthai.iMaLoaiTrangThai = tblLoaiTrangThai.iMaLoaiTrangThai
	AND tblLoaiTrangThai.iMaLoaiTrangThai = '2'
END

--thu tuc lay ds trang thai don nhap hang ok
CREATE PROC get_dsTrangthai_DNH
AS
BEGIN
	SELECT * FROM tblTrangthai,tblLoaiTrangThai WHERE tblTrangthai.iMaLoaiTrangThai = tblLoaiTrangThai.iMaLoaiTrangThai
	AND tblLoaiTrangThai.iMaLoaiTrangThai = '3'
END

--thu tuc lay ds trang thai chua duyet ok
CREATE PROC get_dsTrangthai_TheoID(@id VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblTrangthai,tblLoaiTrangThai WHERE tblTrangthai.iMaLoaiTrangThai = tblLoaiTrangThai.iMaLoaiTrangThai AND iMaTrangThai = @id
END
----------------------------------------- End Quan ly trang thai------------------------------------------------------

-----------------------------------------Quan ly don hang------------------------------------------------------
--thu tuc lay ds don hang theo trang thai OK
ALTER PROC get_dsDonhang_theoIDTrangthai(@id VARCHAR(50))
AS
BEGIN
	SELECT tblDonDatHang.dThoigiantao,tblDonDatHang.dThoigiansua,* 
	FROM tblDonDatHang,tblTrangthai,tblNhanVien,tblLoaiTrangThai
	WHERE tblDonDatHang.iMaTrangThai = tblTrangthai.iMaTrangThai AND 
		tblNhanVien.iMaNV = tblDonDatHang.iMaNV AND tblLoaiTrangThai.iMaLoaiTrangThai = tblTrangThai.iMaLoaiTrangThai
		AND tblTrangthai.iMaTrangThai = @id
	ORDER BY tblDonDatHang.dThoigiantao DESC
END


--thu tuc hien size theo ma mat hang trong kho
CREATE PROC get_dsSize_theoIDMH(@id VARCHAR(50))
AS
BEGIN
	SELECT sMaMH,tblSize.iMaSize,sTenSize 
	FROM tblSize,tblKho 
	WHERE tblSize.iMaSize = tblKho.iMaSize AND sMaMH = @id
	GROUP BY sMaMH,tblSize.iMaSize,sTenSize
END

--thu tuc get ds mat hang co trong kho
CREATE PROC get_dsMathang_trongKho
AS
BEGIN
	SELECT tblMatHang.sMaMH,sTenMH
	FROM tblMatHang,tblKho 
	WHERE tblMatHang.sMaMH = tblKho.sMaMH AND tblMatHang.sMaMH IN (SELECT sMaMH FROM tblKho GROUP BY sMaMH)
	GROUP BY tblMatHang.sMaMH,sTenMH
END

select * from [dbo].[tblDonDatHang] order by dThoigiantao desc

--thu tuc lay ds don hang OK
CREATE PROC get_dsDonhang
AS
BEGIN
	SELECT tblDonDatHang.dThoigiantao,tblDonDatHang.dThoigiansua,sTenNV,sTenKH,* 
	FROM tblDonDatHang,tblTrangthai,tblNhanVien,tblKhachHang
	WHERE tblDonDatHang.iMaTrangThai = tblTrangthai.iMaTrangThai AND
		tblNhanVien.iMaNV = tblDonDatHang.iMaNV AND tblDonDatHang.iMaKH = tblKhachHang.iMaKH
	ORDER BY tblDonDatHang.dThoigiantao DESC
END

SELECT * FROM [dbo].[tblDonDatHang]

--thu tuc lay chi tiet don hang 
ALTER PROC get_chitietDonhang(@id VARCHAR(50))
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

SELECT * FROM [dbo].[tblChiTietDatHang]

--view lay chi tiet don hang 
ALTER VIEW vw_chitietDonhang
AS
	SELECT sMaDonDatHang,fGianhap,iSLMua,(fGianhap*iSLMua) AS [fThanhtien]
	FROM tblChiTietNhapHang,tblChiTietDatHang,tblMatHang
	WHERE tblChiTietNhapHang.sMaMH = tblMatHang.sMaMH AND tblChiTietDatHang.sMaMH = tblMatHang.sMaMH
	GROUP BY sMaDonDatHang,fGianhap,iSLMua

SELECT * FROM vw_chitietDonhang

--thu tuc xoa mat hang trong chi tiet mat hang
CREATE PROC xoa_Mathang_CTDH(@MaDonDatHang VARCHAR(50),@MaMH VARCHAR(50), @MaSize INT)
AS
BEGIN
	DELETE FROM tblChiTietDatHang
	WHERE sMaMH = @MaMH AND iMaSize = @MaSize AND sMaDonDatHang = @MaDonDatHang
END

--thu tuc lay ma mat hang, ma size trong CTDH
CREATE PROC get_dsMathang_trongCTDH(@MaDDH VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblChiTietDatHang WHERE sMaDonDatHang = @MaDDH
END

--thu tuc lay tong tien don hang 
ALTER PROC get_Donhang_Tongtien(@id VARCHAR(50))
AS
BEGIN
	SELECT sMaDonDatHang, SUM(fThanhtien) AS [fTongtien]
	FROM vw_chitietDonhang
	--WHERE sMaDonDatHang = @id
	GROUP BY sMaDonDatHang
END

SELECT * FROM [dbo].[tblDonDatHang]
SELECT * FROM [dbo].[tblChiTietDatHang]
SELECT * FROM [dbo].[tblChiTietNhapHang]
	
--thu tuc lay thong tin khach hang theo id don hang
CREATE PROC get_ttKhachhang_theoIDDonhang(@id VARCHAR(50))
AS
BEGIN
	SELECT sMaDonDatHang,tblDonDatHang.iMaKH,sTenKH,sSdt,dNgaysinh,sGioitinh,sEmail,sDiachi
	FROM tblDonDatHang,tblKhachHang
	WHERE tblKhachHang.iMaKH = tblDonDatHang.iMaKH AND tblDonDatHang.sMaDonDatHang = @id
	GROUP BY sMaDonDatHang,tblDonDatHang.iMaKH,sTenKH,sSdt,dNgaysinh,sGioitinh,sEmail,sDiachi
END

--thu tuc lay thong tin khach hang theo ten dang nhap
CREATE PROC get_ttKhachhang_theoTendangnhap(@id VARCHAR(50))
AS
BEGIN
	SELECT *
	FROM tblTaiKhoan,tblKhachHang
	WHERE tblTaiKhoan.sTenDangNhap = tblKhachHang.sTenDangNhap
END

--thu tuc duyet don hang
ALTER PROC pr_Capnhat_TTDonhang(@MaDonDatHang VARCHAR(10),@MaPhieuXuatKho VARCHAR(10))
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

SELECT * FROM tblDonDatHang

--thu tuc tu dong tru di so luong mat hang khi duyet phieu xuat kho
ALTER PROC pr_Tudongtru_MH(@MaDonDatHang VARCHAR(10),@MaMH VARCHAR(10),@SLMua INT, @MaSize INT)
AS
BEGIN
	IF EXISTS(SELECT * FROM tblChiTietDatHang WHERE sMaDonDatHang = @MaDonDatHang AND sMaMH = @MaMH  AND iMaSize = @MaSize)
		BEGIN
			UPDATE tblKho
			SET iSoluong -= @SLMua
			WHERE sMaMH = @MaMH  AND iMaSize = @MaSize

			UPDATE tblPhieuXuatKho
			SET iMaTrangThai = '12'
			WHERE sMaDonDatHang = @MaDonDatHang
		END
	ELSE
		BEGIN
			INSERT INTO tblKho
			VALUES(@MaMH,@SLMua,@MaSize)
		END
END

SELECT * FROM tblKho ORDER BY sMaMH DESC
SELECT * FROM tblPhieuXuatKho ORDER BY dNgayxuat DESC
SELECT * FROM [dbo].[tblDonDatHang] ORDER BY dNgaydathang DESC


--thu tuc bo duyet don hang
CREATE PROC pr_Capnhat_HuyTTDonhang(@MaDonDatHang VARCHAR(50))
AS
BEGIN
	UPDATE tblDonDatHang
	SET iMaTrangThai = '4', dThoigiansua = GETDATE()
	WHERE sMaDonDatHang = @MaDonDatHang
END

--thu tuc lay size do vao dropdownlist
CREATE PROC get_dsSize
AS
BEGIN
	SELECT * FROM tblSize
END

--thu tuc them don dat hang voi dieu kien khach hang nam ngoai he thong
ALTER PROC insert_Dondathang_Khachhang_Ngoaihethong(@TenKH NVARCHAR(50),@Sdt VARCHAR(20),@Diachigiaohang NVARCHAR(100),@dNgaygiaohang DATETIME,
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

--thu tuc them don dat hang voi dieu kien khach hang nam ngoai he thong khi chua dang nhap
ALTER PROC insert_Dondathang_Khachhang_Ngoaihethong_ND(@TenKH NVARCHAR(50),@Sdt VARCHAR(20),@Diachigiaohang NVARCHAR(100),@dNgaygiaohang DATETIME,
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

--thu tuc them mat hang vao don dat hang voi khach hang nam ngoai he thong
ALTER PROC insert_Chitietdathang_Khachhang_Ngoaihethong(@MaDonDatHang VARCHAR(50),@MaMH VARCHAR(50),@SLMua INT,@MaSize INT)
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


--thu tuc them mat hang vao don dat hang voi khach hang nam ngoai he thong
CREATE PROC insert_Chitietdathang_Khachhang_Ngoaihethong_ND(@MaDonDatHang VARCHAR(50),@MaMH VARCHAR(50),@SLMua INT,@MaSize INT)
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

--THU TUC TIM KIEM MAT HANG
ALTER PROC timkiem_Mathang(@id NVARCHAR(100))
AS
BEGIN
	SELECT tblMatHang.sMaMH,sTenMH,sHinhanh,fGianhap,sDonvitinh,sMota,tblMatHang.dThoigiantao,tblMatHang.dThoigiansua,sTenTrangThai,sTenLoaiMH
	FROM tblMatHang,tblTrangThai,tblLoaiTrangThai,tblLoaiMatHang,tblChiTietNhapHang
	WHERE tblMatHang.iMaTrangThai = tblTrangThai.iMaTrangThai AND tblTrangThai.iMaLoaiTrangThai = tblLoaiTrangThai.iMaLoaiTrangThai
		AND tblMatHang.iMaLoaiMH = tblLoaiMatHang.iMaLoaiMH AND tblChiTietNhapHang.sMaMH = tblMatHang.sMaMH
		AND tblMatHang.sMaMH IN (SELECT sMaMH FROM tblKho) AND sTenMH LIKE N'%' + @id + '%'
	GROUP BY tblMatHang.sMaMH,sTenMH,sHinhanh,fGianhap,sDonvitinh,sMota,tblMatHang.dThoigiantao,tblMatHang.dThoigiansua,sTenTrangThai,sTenLoaiMH
END

--thu tuc lay ds danh muc
CREATE PROC get_dsloaiMH_theoIDDanhmuc


SELECT * FROM vw_chitietDonhang

SELECT * FROM tblNhanVien ORDER BY dNgayvaolam DESC
SELECT * FROM [dbo].[tblDonDatHang] ORDER BY dThoigiantao DESC
SELECT * FROM [dbo].[tblChiTietDatHang] ORDER BY dThoigiantao DESC
SELECT * FROM [dbo].[tblKhachHang] ORDER BY dThoigiantao DESC

delete from tblDonDatHang where sMaDonDatHang = 'DDS-DDH-6'

--thu tuc them don dat hang khi khach hang dat hang
ALTER PROC insert_Dondathang_Khachhang(@MaKH VARCHAR(10))
AS
BEGIN
	BEGIN
		DECLARE @Diachigiaohang NVARCHAR(100)
		SELECT @Diachigiaohang = sQuequan FROM tblNhanVien WHERE iMaNV = @MaKH
	END
	BEGIN
		INSERT INTO tblDonDatHang
		VALUES(NEWID(),'3',@MaKH,GETDATE(),DAY(GETDATE()) + 3,@Diachigiaohang,GETDATE(),null,'4','0')
	END
END

--thu tuc cap nhat thong tin khach hang khi da dang nhap
ALTER PROC insert_Dondathang_Khachhang_Tronghethong(@MaDonDatHang VARCHAR(10),@MaKH VARCHAR(10),@TenKH NVARCHAR(100),@Sdt VARCHAR(20),@dNgaygiaohang DATETIME, @Diachigiaohang NVARCHAR(100))
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

--thu tuc lay thong tin khach hang theo ma khach hang
ALTER PROC get_TTKhachhang_theoID(@id VARCHAR(10))
AS
BEGIN
	SELECT * FROM tblKhachHang WHERE iMaKH = @id
END


--thu tuc them chi tiet don dat hang khi khach hang dat hang
CREATE PROC insert_Chitietdathang_Khachhang(@MaMH VARCHAR(50), @SLMua INT, @MaSize INT)
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

select * from [dbo].[tblDonDatHang] order by dThoigiantao desc
select * from [dbo].[tblChiTietDatHang] order by dThoigiantao desc
select * from [dbo].[tblKhachHang] order by dThoigiantao desc
select * from tblMatHang

DELETE FROM tblDonDatHang WHERE sMaDonDatHang = 'DDS-DDH-5'
DELETE FROM tblKhachHang WHERE iMaKH = '8'

--thu tuc lay thong tin khach hang
CREATE PROC get_dsKhachhang
AS
BEGIN
	SELECT * FROM tblKhachHang
END


--thu tuc xoa don dat hang theo id
CREATE PROC xoa_DDH_theoID(@MaDDH VARCHAR(50))
AS
BEGIN
	BEGIN
		DELETE FROM tblDonDatHang 
		WHERE sMaDonDatHang = @MaDDH AND sMaDonDatHang NOT IN (SELECT sMaDonDatHang FROM tblChiTietDatHang)
	END
END
----------------------------------------- End Quan ly don hang------------------------------------------------------

-----------------------------------------Quan ly don nhap hang------------------------------------------------------
--thu tuc lay ds don hang theo trang thai
ALTER PROC get_dsDonnhaphang_theoIDTrangthai(@id VARCHAR(50))
AS
BEGIN
	SELECT tblDonNhapHang.dThoigiantao,*
	FROM tblDonNhapHang,tblTrangthai,tblNhanVien,tblNhaSanXuat
	WHERE tblDonNhapHang.iMaTrangThai = tblTrangthai.iMaTrangThai AND
		tblNhanVien.iMaNV = tblDonNhapHang.iMaNV AND tblNhaSanXuat.iMaNSX = tblDonNhapHang.iMaNSX 
		--AND tblTrangthai.iMaTrangThai = @id
	ORDER BY tblDonNhapHang.dThoigiantao DESC
END

--thu tuc dem so don nhap hang
CREATE PROC count_DNH
AS
BEGIN
	SELECT COUNT(sMaDonNhapHang) FROM tblDonNhapHang
END

--thu tuc them don nhap hang
CREATE PROC them_Donnhaphang(@MaDonDatHang VARCHAR(50),@iMaNV INT, @iMaNSX INT)
AS
BEGIN
	INSERT INTO tblDonNhapHang
	VALUES(@MaDonDatHang,@iMaNV,@iMaNSX,GETDATE(),GETDATE(),NULL,'7')
END

SELECT * FROM tblDonNhapHang

--thu tuc lay ds don nhap hang 
CREATE PROC get_dsDonnhaphang
AS
BEGIN
	SELECT *
	FROM tblDonNhapHang,tblTrangthai,tblNhanVien,tblNhaSanXuat
	WHERE tblDonNhapHang.iMaTrangThai = tblTrangthai.iMaTrangThai AND
		tblNhanVien.iMaNV = tblDonNhapHang.iMaNV AND tblNhaSanXuat.iMaNSX = tblDonNhapHang.iMaNSX
END

--thu tuc lay ma mat hang, ma size trong CTNH
ALTER PROC get_dsMathang_trongCTNH(@MaDNH VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblChiTietNhapHang WHERE sMaDonNhapHang = @MaDNH
END

DELETE FROM tblDanhMuc

--thu tuc lay chi tiet don nhap hang 
ALTER PROC get_chitietDonnhaphang(@id VARCHAR(50))
AS
BEGIN
	SELECT *, (fGianhap*iSoluongnhap) AS [fThanhtien],((fGianhap*iSoluongnhap) - (fGianhap*iSoluongnhap*(fMucchietkhau/100))) AS [fThanhtien_Sauchietkhau]
	FROM tblDonNhapHang,tblNhaSanXuat,tblNhanVien,tblChiTietNhapHang,tblMatHang,tblSize
	WHERE tblNhanVien.iMaNV = tblDonNhapHang.iMaNV AND tblDonNhapHang.sMaDonNhapHang = tblChiTietNhapHang.sMaDonNhapHang 
		AND tblChiTietNhapHang.sMaMH = tblMatHang.sMaMH AND tblNhaSanXuat.iMaNSX = tblDonNhapHang.iMaNSX AND tblChiTietNhapHang.iMaSize = tblSize.iMaSize
		AND tblDonNhapHang.sMaDonNhapHang = @id
	ORDER BY dNgaynhap DESC
END

SELECT * FROM tblChiTietNhapHang


--thu tuc lay size
ALTER PROC get_dsSize
AS
BEGIN
	SELECT * FROM tblSize
END

--view lay chi tiet don nhap hang 
CREATE VIEW vw_chitietDonnhaphang
AS
	SELECT tblDonNhapHang.sMaDonNhapHang,fGianhap,iSoluongnhap,fMucchietkhau,(fGianhap*iSoluongnhap) AS [fThanhtien],((fGianhap*iSoluongnhap) - (fGianhap*iSoluongnhap*(fMucchietkhau/100))) AS [fThanhtien_Sauchietkhau]
	FROM tblDonNhapHang,tblNhaSanXuat,tblNhanVien,tblChiTietNhapHang,tblMatHang
	WHERE tblNhanVien.iMaNV = tblDonNhapHang.iMaNV AND tblDonNhapHang.sMaDonNhapHang = tblChiTietNhapHang.sMaDonNhapHang 
		AND tblChiTietNhapHang.sMaMH = tblMatHang.sMaMH AND tblNhaSanXuat.iMaNSX = tblDonNhapHang.iMaNSX

--thu tuc lay tong tien don nhap hang 
CREATE PROC get_Donnhaphang_Tongtien(@id VARCHAR(50))
AS
BEGIN
	SELECT sMaDonNhapHang, SUM(fThanhtien_Sauchietkhau) AS [fTongtien_Donnhaphang]
	FROM vw_chitietDonnhaphang
	WHERE sMaDonNhapHang = @id
	GROUP BY sMaDonNhapHang
END
	
--thu tuc lay thong tin khach hang theo id don hang
CREATE PROC get_ttNSX_theoIDDonhang(@id VARCHAR(50))
AS
BEGIN
	SELECT sMaDonNhapHang,tblNhaSanXuat.iMaNSX,sTenNSX,sSdt,sDiachi
	FROM tblDonNhapHang,tblNhaSanXuat
	WHERE tblNhaSanXuat.iMaNSX = tblDonNhapHang.iMaNSX AND tblDonNhapHang.sMaDonNhapHang = @id
	GROUP BY sMaDonNhapHang,tblNhaSanXuat.iMaNSX,sTenNSX,sSdt,sDiachi
END

--thu tuc them chi tiet don nhap hang
CREATE PROC them_Chitietdonnhaphang(@DonNhapHang VARCHAR(50),@MaMH VARCHAR(50), @Gianhap FLOAT, @Soluongnhap INT, @Mucchietkhau FLOAT, @Masize INT)
AS
BEGIN
	INSERT INTO tblChiTietNhapHang
	VALUES(@DonNhapHang,@MaMH,@Gianhap,@Soluongnhap,@Masize,@Mucchietkhau,GETDATE(),null)
END

SELECT * FROM tblDonNhapHang
SELECT * FROM tblChiTietNhapHang

--thu tuc sua chi tiet don hang
ALTER PROC sua_Chitietdonhang(@DonNhapHang VARCHAR(10),@MaMH VARCHAR(10), @Gianhap FLOAT, @Soluongnhap INT, @Mucchietkhau FLOAT,@Masize INT)
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

--xoa chi tiet nhap hang
CREATE PROC xoa_Chitietdonnhaphang(@MaDonNhapHang VARCHAR(50), @MaMH VARCHAR(50),@iMaSize VARCHAR(50))
AS
BEGIN
	DELETE FROM tblChiTietNhapHang
	WHERE sMaDonNhapHang = @MaDonNhapHang AND sMaMH = @MaMH AND iMaSize = @iMaSize
END

--lay danh sach thong tin mat hang theo chi tiet nhap hang 
ALTER PROC get_Mathang_theoChitietdonhang(@id VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblChiTietNhapHang, tblMatHang,tblSize
	WHERE tblChiTietNhapHang.sMaMH = tblMatHang.sMaMH AND tblSize.iMaSize = tblChiTietNhapHang.iMaSize AND sMaDonNhapHang = @id
END

--lay duyet don nhap hang
ALTER PROC duyet_Donnhaphang(@MaDonNhapHang VARCHAR(50),@PhieuNhapKho VARCHAR(50),@MaNV INT)
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

--huy duyet don nhap hang
ALTER PROC huyDuyet_Donnhaphang(@MaDonNhapHang VARCHAR(50))
AS
BEGIN
	BEGIN
		UPDATE tblDonNhapHang
		SET iMaTrangThai = '7',dThoigiansua = GETDATE()
		WHERE sMaDonNhapHang = @MaDonNhapHang
	END
END

--thu tuc get ds NSX
CREATE PROC get_dsNSX
AS
BEGIN
	SELECT * FROM tblNhaSanXuat
END

SELECT * FROM [dbo].[tblDonNhapHang]
SELECT * FROM tblChiTietNhapHang
SELECT * FROM tblSize

CREATE VIEW vw_UpdateKho
AS
	SELECT sMaDonNhapHang,iMaKho,tblMatHang.sMaMH,sTenMH,iSoluongnhap,iSoluong FROM tblChiTietNhapHang,tblKho,tblMatHang
	WHERE tblChiTietNhapHang.sMaMH = tblMatHang.sMaMH AND tblKho.sMaMH = tblMatHang.sMaMH
----------------------------------------- End Quan ly don nhap hang------------------------------------------------------

----------------------------------------- Chi tiet mat hang------------------------------------------------------
--thu tuc xem chi tiet mat hang theo id
ALTER PROC dsMathang_theoID(@id VARCHAR(50))
AS
BEGIN
	SELECT *
	FROM tblMatHang,tblLoaiMatHang,tblChiTietNhapHang 
	WHERE tblMatHang.iMaLoaiMH = tblLoaiMatHang.iMaLoaiMH AND tblChiTietNhapHang.sMaMH = tblMatHang.sMaMH AND tblMatHang.sMaMH = @id
END

--thu tuc xem chi tiet mat hang moi nhat
ALTER PROC dsMathang_MoiNhat
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


--thu tuc xem anh mat hang theo id
CREATE PROC dsAnhMathang_theoID(@id VARCHAR(50))
AS
BEGIN
	SELECT sHinhanh
	FROM tblMatHang,tblLoaiMatHang,tblChiTietNhapHang 
	WHERE tblMatHang.iMaLoaiMH = tblLoaiMatHang.iMaLoaiMH AND tblChiTietNhapHang.sMaMH = tblMatHang.sMaMH AND tblMatHang.sMaMH = @id
	GROUP BY sHinhanh
END


--trigger tu dong cap nhap so luong mat hang trong kho thi duyet phieu nhap kho

SELECT iMaKho,sMaMH,iSoluong,iMaSize FROM tblKho GROUP BY iMaKho,sMaMH,iSoluong,iMaSize
SELECT sMaMH,COUNT(iMaSize) FROM tblKho GROUP BY sMaMH

--thu tuc hien size co trong kho theo id mat hang
ALTER PROC get_DSSize_theoMathang(@id VARCHAR(50))
AS
BEGIN
	SELECT tblSize.iMaSize,sTenSize,* FROM tblKho,tblSize WHERE tblKho.iMaSize = tblSize.iMaSize AND sMaMH = 'DDS-MH-32'--@id
END

DELETE FROM tblKho
WHERE sMaMH = 'DDS-MH-32' AND iMaKho = '107'

--thu tuc lay 5 loai mat hang bat ki
CREATE PROC dsLoaimathang_random
AS
BEGIN
	SELECT TOP 4 * FROM tblLoaiMatHang
	ORDER BY NEWID()
END

--thu tuc lay 4 mat hang theo id loai mat hang da random
CREATE PROC dsMathang_theoIDLoaiMH_random(@id VARCHAR(50))
AS
BEGIN
	SELECT TOP 4 * FROM tblLoaiMatHang,tblMatHang
	WHERE tblMatHang.iMaLoaiMH = tblLoaiMatHang.iMaLoaiMH AND tblLoaiMatHang.iMaLoaiMH = @id
	ORDER BY NEWID()
END

--thu tuc lay 9 mat hang ao bong da tre em
ALTER PROC dsMathang_Aobongdatreem_random
AS
BEGIN
	SELECT TOP 3 * FROM tblLoaiMatHang,tblMatHang,tblChiTietNhapHang
	WHERE tblMatHang.iMaLoaiMH = tblLoaiMatHang.iMaLoaiMH AND tblChiTietNhapHang.sMaMH = tblMatHang.sMaMH
	AND tblLoaiMatHang.iMaLoaiMH = '3'
		AND tblMatHang.sMaMH IN (SELECT sMaMH FROM tblKho)
	ORDER BY NEWID()
END
----------------------------------------- End Chi tiet mat hang------------------------------------------------------


----------------------------------------- Quan ly phieu nhap kho------------------------------------------------------
--thu tuc dem so luong phieu nhap kho
CREATE PROC count_PNK
AS
BEGIN
	SELECT COUNT(sMaPhieuNhapKho) FROM tblPhieuNhapKho
END

--thu tuc lay trang thai phieu nhap kho
CREATE PROC get_dsTrangthai_theoPNK
AS
BEGIN
	SELECT * FROM tblTrangThai,tblLoaiTrangThai 
	WHERE tblTrangThai.iMaLoaiTrangThai = tblLoaiTrangThai.iMaLoaiTrangThai AND tblLoaiTrangThai.iMaLoaiTrangThai = '4'
END

--thu tuc lay danh sach phieu nhap kho theo id
CREATE PROC get_dsPhieuNhapKho_theoIDTrangthai(@id VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblPhieuNhapKho,tblTrangThai,tblNhanVien
	WHERE tblPhieuNhapKho.iMaTrangThai = tblTrangThai.iMaTrangThai AND tblPhieuNhapKho.iMaNV = tblNhanVien.iMaNV
		 AND tblTrangThai.iMaTrangThai = @id
	ORDER BY dNgaynhapkho DESC
END

--thu tuc lay ALL danh sach phieu nhap kho 
CREATE PROC get_dsALLPhieuNhapKho
AS
BEGIN
	SELECT * FROM tblPhieuNhapKho,tblTrangThai,tblNhanVien
	WHERE tblPhieuNhapKho.iMaTrangThai = tblTrangThai.iMaTrangThai AND tblPhieuNhapKho.iMaNV = tblNhanVien.iMaNV
	ORDER BY dNgaynhapkho DESC
END

--THU TUC XAC NHAN PHIEU NHAP KHO
ALTER PROC xacnhan_Phieunhapkho(@MaDonNhapHang VARCHAR(10),
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

SELECT * FROM [dbo].[tblKho]
SELECT * FROM [dbo].[tblChiTietNhapHang] ORDER BY dThoigiantao DESC
SELECT * FROM [dbo].[tblDonNhapHang] ORDER BY dThoigiantao DESC

--thu tuc tu dong tru di so luong mat hang khi duyet phieu xuat kho
ALTER PROC pr_Tudongtru_MH(@MaDonDatHang VARCHAR(10),@MaMH VARCHAR(10),@SLMua INT, @MaSize INT)
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


----------------------------------------- End Quan ly phieu nhap kho------------------------------------------------------

----------------------------------------- Quan ly phieu xuat kho------------------------------------------------------
--thu tuc lay danh sach phieu xuat kho
CREATE PROC get_dsPhieuXuatKho(@id VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblPhieuXuatKho,tblTrangThai,tblNhanVien
	WHERE tblPhieuXuatKho.iMaTrangThai = tblTrangThai.iMaTrangThai AND tblPhieuXuatKho.iMaNV = tblNhanVien.iMaNV
		AND sMaDonDatHang IN (SELECT sMaDonDatHang FROM tblDonDatHang WHERE iMaTrangThai = '3')
		 AND tblTrangThai.iMaTrangThai = @id
	ORDER BY dNgayxuat DESC
END

--thu tuc lay ALL danh sach phieu xuat kho
CREATE PROC get_dsALL_PhieuXuatKho
AS
BEGIN
	SELECT * FROM tblPhieuXuatKho,tblTrangThai,tblNhanVien
	WHERE tblPhieuXuatKho.iMaTrangThai = tblTrangThai.iMaTrangThai AND tblPhieuXuatKho.iMaNV = tblNhanVien.iMaNV
		--AND tblNhanVien.iMaNV = '1'
	ORDER BY dNgayxuat DESC
END

SELECT * FROM [dbo].[tblDonDatHang] ORDER BY dThoigiansua DESC
SELECT * FROM [dbo].[tblPhieuXuatKho] ORDER BY dThoigiantao DESC

--thu tuc lay trang thai phieu xuat kho
CREATE PROC load_Trangthai_Phieuxuatkho_theoID(@id VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblTrangThai,tblLoaiTrangThai 
	WHERE tblTrangThai.iMaLoaiTrangThai = tblLoaiTrangThai.iMaLoaiTrangThai AND tblLoaiTrangThai.iMaLoaiTrangThai = '5'
		AND iMaTrangThai = @id
END

--thu tuc lay trang thai phieu xuat kho
CREATE PROC load_Trangthai_Phieuxuatkho
AS
BEGIN
	SELECT * FROM tblTrangThai,tblLoaiTrangThai 
	WHERE tblTrangThai.iMaLoaiTrangThai = tblLoaiTrangThai.iMaLoaiTrangThai AND tblLoaiTrangThai.iMaLoaiTrangThai = '5'
END

--thu tuc dem so luong phieu xuat kho
CREATE PROC count_PXK
AS
BEGIN
	SELECT COUNT(sMaPhieuXuatKho) FROM tblPhieuXuatKho
END
----------------------------------------- End Quan ly phieu xuat kho------------------------------------------------------

----------------------------------------- Quan ly kho------------------------------------------------------
--thu tuc hien ds mat hang trong kho
CREATE PROC get_dsMathang_Kho
AS
BEGIN
	SELECT tblKho.sMaMH,sHinhanh,sTenMH
	FROM tblKho,tblMatHang
	WHERE tblMatHang.sMaMH = tblKho.sMaMH
	GROUP BY tblKho.sMaMH,sHinhanh,sTenMH
END

--thu tuc hien size mat hang theo id mat hang
CREATE PROC get_dsSize_Mathang_Kho(@id VARCHAR(50))
AS
BEGIN
	SELECT *
	FROM tblKho,tblMatHang,tblSize
	WHERE tblMatHang.sMaMH = tblKho.sMaMH AND tblSize.iMaSize = tblKho.iMaSize
		AND tblKho.sMaMH = @id--'78E8A4F7-F8A5-462E-B31D-015ED121EAEF'
END
----------------------------------------- End Quan ly kho------------------------------------------------------
