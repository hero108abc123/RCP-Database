CREATE DATABASE DaAnRCP
GO
-- TAO DB
--DUNG DB
USE DaAnRCP
GO


--2.BANG CHUC VU
CREATE TABLE CHUCVU
(
	MaCV CHAR(2) PRIMARY KEY,
	TenCV NVARCHAR(100)

	)
GO

--1.BANG NHAN VIEN
CREATE TABLE NHANVIEN
(
	MaNV CHAR(3) PRIMARY KEY,
	HoTen NVARCHAR(500),
	NgaySinh DATE,
	GioiTinh CHAR(3),
	DiaChi TEXT,
	Cccd BIGINT,
	Sdt BIGINT,
	NgayLam DATE,
	Email TEXT,
	MatKhau CHAR(8),
	MaCV CHAR(2),

	FOREIGN KEY (MaCV) REFERENCES CHUCVU(MaCV)

	)

GO


--3.BANG THE THANH VIEN
CREATE TABLE THETHANHVIEN
(
	MaT CHAR(3) PRIMARY KEY,
	Diem INT,
	NgayLap DATE,
	GioLap TIME,
	MatKhau CHAR(8),
	MaNV CHAR(3),

	FOREIGN KEY (MaNV) REFERENCES NHANVIEN(MaNV)

	)
GO
--4.KHACH HANG
CREATE TABLE KHACHHANG
(
	MaKH CHAR(3) PRIMARY KEY,
	TenKH NVARCHAR(500),
	GioiTinh CHAR(3),
	DiaChi TEXT,
	Cccd BIGINT,
	Sdt BIGINT,
	NgaySinh DATE,
	Email TEXT,
	MaT CHAR(3),

	FOREIGN KEY (MaT) REFERENCES THETHANHVIEN(MaT)

	)
GO
--5.GIA VE
CREATE TABLE GIAVE
(
	MaGV INT PRIMARY KEY,
	TenGoiGia NVARCHAR(100),
	Gio NVARCHAR(30),
	Gia INT

	)
GO


--6.GIA VE THEO NGAY
CREATE TABLE GIATHEONGAY
(
	MaGV INT,
	Ngay NVARCHAR(30),

	PRIMARY KEY (MaGV,Ngay),
	FOREIGN KEY (MaGV) REFERENCES GIAVE(MaGV)

	)
GO


--7.DINH DANG PHIM
CREATE TABLE DINHDANGPHIM
(
	MaDD CHAR(4) PRIMARY KEY,
	TenDD NVARCHAR(100),
	PhuThu INT

	)
GO

--8.THE LOAI PHIM
CREATE TABLE THELOAIPHIM
(
	MaTL CHAR(3) PRIMARY KEY,
	TenTL NVARCHAR(100)
	
	)
GO

--9.PHIM
CREATE TABLE PHIM
(
	MaP CHAR(3) PRIMARY KEY,
	TenPhim NVARCHAR(100),
	ThoiLuong TIME,
	DoTuoi INT,
	DaoDien NVARCHAR(100),
	DienVien NVARCHAR(100),
	TomTat NTEXT,
	NgonNgu NVARCHAR(50),
	QuocGia NVARCHAR(50),
	NgayCongChieu DATE,
	NhaSanXuat NVARCHAR(50),
	TrangThai NVARCHAR(50),
	MaTL CHAR(3),

	FOREIGN KEY (MaTL) REFERENCES THELOAIPHIM(MaTL)
	
	)
GO


--10.PHONG CHIEU
CREATE TABLE PHONGCHIEU
(
	MaPhong CHAR(3) PRIMARY KEY,
	SoLuongGheDaChon INT
	)
GO

--11. GHE NGOI
CREATE TABLE GHENGOI
(
	MaG CHAR(5) PRIMARY KEY,
	ViTriDay CHAR(1),
	ViTriCot INT,
	DaChon	INT,
	MaPhong CHAR(3),

	FOREIGN KEY (MaPhong) REFERENCES PHONGCHIEU(MaPhong)

	)
GO

--12.SUAT CHIEU
CREATE TABLE SUATCHIEU
( 
	MaSC CHAR(3) PRIMARY KEY,
	NgayChieu  DATE,
	GioBD TIME,
	GioKT TIME,
	MaPhong CHAR(3),
	MaP CHAR(3),
	MaDD CHAR(4),

	CONSTRAINT KN FOREIGN KEY (MaPhong) REFERENCES PHONGCHIEU(MaPhong),
	CONSTRAINT KN1 FOREIGN KEY (MaP) REFERENCES PHIM(MaP),
	CONSTRAINT KN2 FOREIGN KEY (MaDD) REFERENCES DINHDANGPHIM(MaDD)

	)
GO

--13.VE XEM PHIM
CREATE TABLE VEXEMPHIM
(
	MaV CHAR(3) PRIMARY KEY,
	DiaChiRap NVARCHAR(100),
	LoaiVe CHAR(10),
	MaNV CHAR(3),
	NgayLap DATE,
	GioLap TIME,
	MaKH CHAR(3),
	NgayDat DATE,
	MaSC CHAR(3),
	MaGV INT,
	MaG  CHAR(5),

	CONSTRAINT KN3 FOREIGN KEY (MaNV) REFERENCES NHANVIEN(MaNV),
	CONSTRAINT KN4 FOREIGN KEY (MaKH) REFERENCES KHACHHANG(MaKH),
	CONSTRAINT KN5 FOREIGN KEY (MaSC) REFERENCES SUATCHIEU(MaSC),
	CONSTRAINT KN6 FOREIGN KEY (MaGV) REFERENCES GIAVE(MaGV),
	CONSTRAINT KN7 FOREIGN KEY (MaG) REFERENCES GHENGOI(MaG)

	)
GO

--NHẬP DỮ LIỆU
INSERT INTO CHUCVU
VALUES ('QL', N'Quản lý')
INSERT INTO CHUCVU
VALUES ('BV', N'Nhân viên bán vé')

INSERT INTO DINHDANGPHIM
VALUES ('3D01', N'Phim 3D(thứ 2-3-4-5)', 30000)
INSERT INTO DINHDANGPHIM
VALUES ('3D02', N'Phim 3D(thứ 6-7-CN-Ngày Lễ)', 50000)
INSERT INTO DINHDANGPHIM
VALUES ('2D', N'Phim 2D', 0)

INSERT INTO GIAVE
VALUES (1, N'Người lớn/G-Star', N'Trước 17h', 55000)
INSERT INTO GIAVE
VALUES (2, N'Người lớn/G-Star', 'Sau 17h', 60000)
INSERT INTO GIAVE
VALUES (3, N'Người lớn/G-Star', N'Trước 17h', 70000)
INSERT INTO GIAVE
VALUES (4, N'Người lớn/G-Star', 'Sau 17h', 75000)
INSERT INTO GIAVE
VALUES (5, 'U22', N'Trước 17h', 55000)
INSERT INTO GIAVE
VALUES (6, 'U22', N'Sau 17h', 60000)
INSERT INTO GIAVE
VALUES (7, 'U22', N'Cả ngày', 50000)
INSERT INTO GIAVE
VALUES (8, N'Trẻ em/ Người cao tuổi', N'Cả ngày', 50000)
INSERT INTO GIAVE
VALUES (9, N'Trẻ em/ Người cao tuổi', N'Cả ngày', 60000)
INSERT INTO GIAVE
VALUES (10, 'Happy Day', N'Cả ngày', 50000)
INSERT INTO GIAVE
VALUES (11, N'Ngày tri ân', N'Cả ngày', 50000)
INSERT INTO GIAVE
VALUES (12, 'G-star', 'Sau 22h', 50000)

INSERT INTO GIATHEONGAY
VALUES (1, N'Thứ 2, 4, 5')
INSERT INTO GIATHEONGAY
VALUES (2, N'Thứ 2, 4, 5')
INSERT INTO GIATHEONGAY
VALUES (3, N'Thứ 6, 7, CN, Ngày Lễ')
INSERT INTO GIATHEONGAY
VALUES (4, N'Thứ 6, 7, CN, Ngày Lễ')
INSERT INTO GIATHEONGAY
VALUES (5, N'Thứ 6, 7, CN, Ngày Lễ')
INSERT INTO GIATHEONGAY
VALUES (6, N'Thứ 6, 7, CN, Ngày Lễ')
INSERT INTO GIATHEONGAY
VALUES (7, N'Thứ 2, 4, 5')
INSERT INTO GIATHEONGAY
VALUES (8, N'Thứ 2, 4, 5')
INSERT INTO GIATHEONGAY
VALUES (9, N'Thứ 6, 7, CN, Ngày Lễ')
INSERT INTO GIATHEONGAY
VALUES (10, N'Thứ 3')
INSERT INTO GIATHEONGAY
VALUES (11, N'Ngày Lễ')
INSERT INTO GIATHEONGAY
VALUES (12, N'Cả Tuần')

INSERT INTO THELOAIPHIM (MaTL, TenTL)
VALUES
	('TL1', N'Hành động'),
	('TL2', N'Kinh dị'),
	('TL3', N'Hài'),
	('TL4', N'Tình cảm'),
	('TL5', N'Phiêu lưu');

INSERT INTO SUATCHIEU(MaSC, NgayChieu, GioBD, GioKT, MaPhong, MaP, MaDD)
VALUES
    ('SC1', '2023-05-18', '08:30:00', '10:30:00', 'PC1', 'P1','2D'),
    ('SC2', '2023-05-18', '11:00:00', '13:00:00', 'PC2', 'P2', '3D01'),
    ('SC3', '2023-05-18', '14:30:00', '16:30:00', 'PC3', 'P3', '2D'),
    ('SC4', '2023-05-18', '17:00:00', '19:00:00', 'PC4', 'P4', '3D01'),
    ('SC5', '2023-05-19', '10:00:00', '12:00:00', 'PC5', 'P5', '2D');

INSERT INTO VEXEMPHIM(MaV, DiaChiRap, LoaiVe, MaNV, NgayLap, GioLap, MaKH, NgayDat, MaSC, MaGV, MaG)
VALUES
    ('V1', '123 ABC Street', 'ONL', 'NV2', '2023-05-18', '08:00:00', 'KH1', '2023-05-17', 'SC1', 1, 'P1-A1'),
    ('V2', '123 ABC Street', 'OFFLINE', 'NV4', '2023-05-18', '09:30:00', 'KH2', '2023-05-17', 'SC1', 2, 'P1-B2'),
    ('V3', '123 ABC Street', 'ONL', 'NV4', '2023-05-18', '12:00:00', 'KH3', '2023-05-17', 'SC1', 3, 'P1-C3'),
    ('V4', '123 ABC Street', 'OFFLINE', 'NV5', '2023-05-18', '14:00:00', 'KH4', '2023-05-17', 'SC1' ,4,'P1-D4');

INSERT INTO GHENGOI (MaG, ViTriDay, ViTriCot,DaChon,MaPhong)
VALUES 
	('P1-A1', 'A', 1, 1, 'PC1'),
	('P1-A2', 'A', 2, 0, 'PC1'),
	('P1-A3', 'A', 3, 0, 'PC1'),
	('P1-A4', 'A', 4, 0, 'PC1'),
	('P1-A5', 'A', 5, 0, 'PC1'),
	('P1-B1', 'B', 1, 0, 'PC1'),
	('P1-B2', 'B', 2, 1, 'PC1'),
	('P1-B3', 'B', 3, 0, 'PC1'),
	('P1-B4', 'B', 4, 0, 'PC1'),
	('P1-B5', 'B', 5, 0, 'PC1'),
	('P1-C1', 'C', 1, 0, 'PC1'),
	('P1-C2', 'C', 2, 0, 'PC1'),
	('P1-C3', 'C', 3, 1, 'PC1'),
	('P1-C4', 'C', 4, 0, 'PC1'),
	('P1-C5', 'C', 5, 0, 'PC1'),
	('P1-D1', 'D', 1, 0, 'PC1'),
	('P1-D2', 'D', 2, 0, 'PC1'),
	('P1-D3', 'D', 3, 0, 'PC1'),
	('P1-D4', 'D', 4, 1, 'PC1'),
	('P1-D5', 'D', 5, 0, 'PC1'),
	('P2-A1', 'A', 1, 0, 'PC2'),
	('P2-A2', 'A', 2, 0, 'PC2'),
	('P2-A3', 'A', 3, 0, 'PC2'),
	('P2-A4', 'A', 4, 0, 'PC2'),
	('P2-A5', 'A', 5, 0, 'PC2'),
	('P2-B1', 'B', 1, 0, 'PC2'),
	('P2-B2', 'B', 2, 0, 'PC2'),
	('P2-B3', 'B', 3, 0, 'PC2'),
	('P2-B4', 'B', 4, 0, 'PC2'),
	('P2-B5', 'B', 5, 0, 'PC2'),
	('P2-C1', 'C', 1, 0, 'PC2'),
	('P2-C2', 'C', 2, 0, 'PC2'),
	('P2-C3', 'C', 3, 0, 'PC2'),
	('P2-C4', 'C', 4, 0, 'PC2'),
	('P2-C5', 'C', 5, 0, 'PC2'),
	('P2-D1', 'D', 1, 0, 'PC2'),
	('P2-D2', 'D', 2, 0, 'PC2'),
	('P2-D3', 'D', 3, 0, 'PC2'),
	('P2-D4', 'D', 4, 0, 'PC2'),
	('P2-D5', 'D', 5, 0, 'PC2'),
	('P3-A1', 'A', 1, 0, 'PC3'),
	('P3-A2', 'A', 2, 0, 'PC3'),
	('P3-A3', 'A', 3, 0, 'PC3'),
	('P3-A4', 'A', 4, 0, 'PC3'),
	('P3-A5', 'A', 5, 0, 'PC3'),
	('P3-B1', 'B', 1, 0, 'PC3'),
	('P3-B2', 'B', 2, 0, 'PC3'),
	('P3-B3', 'B', 3, 0, 'PC3'),
	('P3-B4', 'B', 4, 0, 'PC3'),
	('P3-B5', 'B', 5, 0, 'PC3'),
	('P3-C1', 'C', 1, 0, 'PC3'),
	('P3-C2', 'C', 2, 0, 'PC3'),
	('P3-C3', 'C', 3, 0, 'PC3'),
	('P3-C4', 'C', 4, 0, 'PC3'),
	('P3-C5', 'C', 5, 0, 'PC3'),
	('P3-D1', 'D', 1, 0, 'PC3'),
	('P3-D2', 'D', 2, 0, 'PC3'),
	('P3-D3', 'D', 3, 0, 'PC3'),
	('P3-D4', 'D', 4, 0, 'PC3'),
	('P3-D5', 'D', 5, 0, 'PC3'),
	('P4-A1', 'A', 1, 0, 'PC4'),
	('P4-A2', 'A', 2, 0, 'PC4'),
	('P4-A3', 'A', 3, 0, 'PC4'),
	('P4-A4', 'A', 4, 0, 'PC4'),
	('P4-A5', 'A', 5, 0, 'PC4'),
	('P4-B1', 'B', 1, 0, 'PC4'),
	('P4-B2', 'B', 2, 0, 'PC4'),
	('P4-B3', 'B', 3, 0, 'PC4'),
	('P4-B4', 'B', 4, 0, 'PC4'),
	('P4-B5', 'B', 5, 0, 'PC4'),
	('P4-C1', 'C', 1, 0, 'PC4'),
	('P4-C2', 'C', 2, 0, 'PC4'),
	('P4-C3', 'C', 3, 0, 'PC4'),
	('P4-C4', 'C', 4, 0, 'PC4'),
	('P4-C5', 'C', 5, 0, 'PC4'),
	('P4-D1', 'D', 1, 0, 'PC4'),
	('P4-D2', 'D', 2, 0, 'PC4'),
	('P4-D3', 'D', 3, 0, 'PC4'),
	('P4-D4', 'D', 4, 0, 'PC4'),
	('P4-D5', 'D', 5, 0, 'PC4'),
	('P5-A1', 'A', 1, 0, 'PC5'),
	('P5-A2', 'A', 2, 0, 'PC5'),
	('P5-A3', 'A', 3, 0, 'PC5'),
	('P5-A4', 'A', 4, 0, 'PC5'),
	('P5-A5', 'A', 5, 0, 'PC5'),
	('P5-B1', 'B', 1, 0, 'PC5'),
	('P5-B2', 'B', 2, 0, 'PC5'),
	('P5-B3', 'B', 3, 0, 'PC5'),
	('P5-B4', 'B', 4, 0, 'PC5'),
	('P5-B5', 'B', 5, 0, 'PC5'),
	('P5-C1', 'C', 1, 0, 'PC5'),
	('P5-C2', 'C', 2, 0, 'PC5'),
	('P5-C3', 'C', 3, 0, 'PC5'),
	('P5-C4', 'C', 4, 0, 'PC5'),
	('P5-C5', 'C', 5, 0, 'PC5'),
	('P5-D1', 'D', 1, 0, 'PC5'),
	('P5-D2', 'D', 2, 0, 'PC5'),
	('P5-D3', 'D', 3, 0, 'PC5'),
	('P5-D4', 'D', 4, 0, 'PC5'),
	('P5-D5', 'D', 5, 0, 'PC5');
	
INSERT INTO PHONGCHIEU(MaPhong, SoLuongGheDaChon)
VALUES
    ('PC1', 4),
    ('PC2', 0),
    ('PC3', 0),
    ('PC4', 0),
    ('PC5', 0);


INSERT INTO PHIM (MaP, TenPhim, ThoiLuong, DoTuoi, DaoDien, DienVien, TomTat, NgonNgu, QuocGia, NgayCongChieu, NhaSanXuat, TrangThai, MaTL)
VALUES
    ('P1', N'Avengers: Endgame', '03:01:00', 13, N'Anthony Russo, Joe Russo', N'Robert Downey Jr., Chris Evans, Mark Ruffalo', N'Cuộc chiến giữa Avengers và Thanos', N'Tiếng Anh', N'Mỹ', '2019-04-26', N'Marvel Studios', N'Đã công chiếu', 'TL1'),
    ('P2', N'Joker', '02:02:00', 16, N'Todd Phillips', N'Joaquin Phoenix, Robert De Niro', N'Cuộc đời của Joker trước khi trở thành tên ác nhân khét tiếng', N'Tiếng Anh', N'Mỹ', '2019-10-04', N'DC Films', N'Đã công chiếu', 'TL2'),
    ('P3', N'Titanic', '03:14:00', 13, N'James Cameron', N'Leonardo DiCaprio, Kate Winslet', N'Chuyện tình tay ba giữa Jack, Rose và chiếc tàu Titanic', N'Tiếng Anh', N'Mỹ', '1997-12-19', N'Paramount Pictures', N'Đã công chiếu', 'TL3'),
    ('P4', N'Parasite', '02:12:00', 16, N'Bong Joon-ho', N'Song Kang-ho, Lee Sun-kyun', N'Cuộc sống của hai gia đình đối lập: một gia đình giàu có và một gia đình nghèo', N'Tiếng Hàn', N'Hàn Quốc', '2019-05-30', N'CJ Entertainment', N'Đã công chiếu', 'TL4'),
    ('P5', N'The Shawshank Redemption', '02:22:00', 16, N'Frank Darabont', N'Tim Robbins, Morgan Freeman', N'Cuộc đời của nhân vật Andy Dufresne trong nhà tù Shawshank', N'Tiếng Anh', N'Mỹ', '1994-09-23', N'Castle Rock Entertainment', N'Đã công chiếu', 'TL5');

INSERT INTO KHACHHANG(MaKH, TenKH, GioiTinh, DiaChi, Cccd, Sdt, NgaySinh, Email, MaT)
VALUES
    ('KH1', N'Nguyen Van L', 'Nam', N'Cau Giay - Ha Noi', 123456789123, 0984054321, '1990-10-15', 'nguyenl@gmail.com', 'TV1'),
    ('KH2', N'Tran Thi M', 'Nu', N'Thanh Xuan - Ha Noi', 001230890123, 0984456789, '1992-05-20', 'tranm@gmail.com', 'TV2'),
    ('KH3', N'Hoang Van N', 'Nam', N'Hoang Mai - Ha Noi',0012318901234, 0984654321, '1995-08-25', 'hoangn@gmail.com', 'TV3'),
    ('KH4', N'Le Thi O', 'Nu', N'Dong Da - Ha Noi', 012345123412, 0984456789, '1993-04-01', 'leo@gmail.com', 'TV4'),
    ('KH5', N'Pham Van P', 'Nam', N'Tay Ho - Ha Noi', 001234561232, 0987654321, '1994-12-05', 'phamp@gmail.com', 'TV5');

INSERT INTO NHANVIEN(MaNV, HoTen, NgaySinh, GioiTinh, DiaChi, Cccd, Sdt, NgayLam, Email, MatKhau, MaCV)
VALUES
    ('NV1', N'Do Huyen Tram', '1993-05-12', 'Nu', N'Long Bien - Ha Noi', 123456862454, 0984094927, '2019-10-04', N'huyentram@gmail.com', 'huyntr@m', 'QL'),
    ('NV2', N'Nguyen Van A', '1990-02-15', 'Nam', N'Hoan Kiem - Ha Noi', 123456987541, 0984054321, '2020-01-20', N'vana@gmail.com', 'vanan@m', 'BV'),
    ('NV3', N'Le Thi B', '1995-08-27', 'Nu', N'Dong Da - Ha Noi', 123456779562, 0984052471, '2021-03-10', N'bethi@gmail.com', 'bethi@m', 'QL'),
    ('NV4', N'Tran Van C', '1988-12-03', 'Nam', N'Ba Dinh - Ha Noi',123456769541, 0984885678, '2018-07-01', N'cvan@gmail.com', 'cvan@m', 'BV'),
    ('NV5', N'Pham Thi D', '1997-04-18', 'Nu', N'Tay Ho - Ha Noi', 123456743214, 0984082789, '2022-09-05', N'dpham@gmail.com', 'dpham@m', 'BV');

INSERT INTO THETHANHVIEN(MaT, Diem, NgayLap, GioLap, MatKhau, MaNV)
VALUES
    ('TV1', 80, '2022-01-10', '08:30:00', 'ngynl@m', 'NV3'),
    ('TV2', 70, '2022-02-15', '14:45:00', 'tranm@m', 'NV1'),
    ('TV3', 90, '2022-03-20', '10:15:00', 'hoagn@m', 'NV3'),
    ('TV4', 60, '2022-04-25', '16:30:00', 'leo@m', 'NV3'),
    ('TV5', 85, '2022-05-30', '09:00:00', 'phamp@m', 'NV1');

--KIỂM TRA DỮ LIỆU
--1
SELECT * FROM CHUCVU
--2
SELECT * FROM NHANVIEN
--3
SELECT * FROM THETHANHVIEN
--4
SELECT * FROM KHACHHANG
--5
SELECT * FROM GIAVE
--6
SELECT * FROM GIATHEONGAY
--7
SELECT * FROM DINHDANGPHIM
--8
SELECT * FROM THELOAIPHIM
--9
SELECT * FROM PHIM
--10
SELECT * FROM PHONGCHIEU
--11
SELECT * FROM GHENGOI
--12
SELECT * FROM SUATCHIEU
--13
SELECT * FROM VEXEMPHIM


-- TRUY VẤN 
--1 HIÊN THỊ NHÂN VIÊN
SELECT * FROM NHANVIEN

--2 HIỂN THỊ  DANH SÁCH CÁC KHÁCH HÀNG TRONG HỆ THỐNG
SELECT * FROM KHACHHANG

--3 HIỂN THỊ  THÔNG TIN VÉ ĐÃ MUA
SELECT * FROM VEXEMPHIM

--4 HIỂN THỊ CÁC SUẤT CHIẾU 
SELECT * FROM SUATCHIEU

--5 THÔNG TIN THẺ THÀNH VIÊN
SELECT * 
FROM THETHANHVIEN

--6 THÔNG TIN PHIM
SELECT *
FROM PHIM
--7 THỐNG TIN GHẾ NGỒI 
SELECT *
FROM GHENGOI
--8 THÔNG TIN PHÒNG CHIẾU
SELECT * 
FROM PHONGCHIEU

--9 HIỂN THỊ THÔNG TIN KHÁCH HÀNG ĐÃ ĐẶT VÉ
SELECT VEXEMPHIM.MaKH, TenKH, GioiTinh, DiaChi, Sdt, Cccd, NgaySinh, Email, NgayDat, LoaiVe, MaSC
FROM VEXEMPHIM LEFT JOIN KHACHHANG ON VEXEMPHIM.MaKH = KHACHHANG.MaKH 

--10 THÔNG TIN SUẤT CHIẾU KHÁCH ĐÃ ĐẶT
SELECT MaSC, NgayChieu, GioBD, GioKT, MaPhong, MaDD, TenPhim, ThoiLuong
FROM SUATCHIEU LEFT JOIN PHIM ON SUATCHIEU.MaP = PHIM.MaP

SELECT MaV, DiaChiRap, LoaiVe, MaKH, NgayDat, NgayChieu, GioBD, MaPhong, MaDD, TenPhim, ThoiLuong
FROM VEXEMPHIM LEFT JOIN (SELECT MaSC, NgayChieu, GioBD, GioKT, MaPhong, MaDD, TenPhim, ThoiLuong
FROM SUATCHIEU LEFT JOIN PHIM ON SUATCHIEU.MaP = PHIM.MaP) AS SC ON VEXEMPHIM.MaSC = SC.MaSC

--11 THÔNG TIN NHÂN VIÊN LÂP VÉ
SELECT MaV, LoaiVe, MaV, NgayLap, GioLap, HoTen
FROM VEXEMPHIM LEFT JOIN NHANVIEN ON VEXEMPHIM.MaNV = NHANVIEN.MaNV

--12 THÔNG TIN VÉ XEM PHIM

SELECT MaV, DiaChiRap, LoaiVe, MaNV, NgayLap, GioLap, MaKH, NgayDat, MaSC, MaG, Gia, HoTen
FROM (SELECT MaV, DiaChiRap, LoaiVe, VEXEMPHIM.MaNV, NgayLap, GioLap, MaKH, NgayDat, MaSC, MaG, MaGV, HoTen
FROM VEXEMPHIM LEFT JOIN NHANVIEN ON VEXEMPHIM.MaNV = NHANVIEN.MaNV) AS V LEFT JOIN GIAVE ON V.MaGV = GIAVE.MaGV

SELECT SC.MaSC,NgayChieu, GioBD, MaPhong, MaDD, TenPhim, ThoiLuong
FROM VEXEMPHIM LEFT JOIN (SELECT MaSC, NgayChieu, GioBD, GioKT, MaPhong, MaDD, TenPhim, ThoiLuong
FROM SUATCHIEU LEFT JOIN PHIM ON SUATCHIEU.MaP = PHIM.MaP) AS SC ON VEXEMPHIM.MaSC = SC.MaSC

SELECT  MaSC, NgayChieu, GioBD, MaPhong, TenPhim, SC1.MaDD, PhuThu , DoTuoi
FROM (SELECT MaSC, NgayChieu, GioBD, GioKT, MaPhong, MaDD, TenPhim, DoTuoi, ThoiLuong
FROM SUATCHIEU LEFT JOIN PHIM ON SUATCHIEU.MaP = PHIM.MaP) AS SC1 LEFT JOIN DINHDANGPHIM ON SC1.MaDD = DINHDANGPHIM.MaDD

SELECT MaV, DiaChiRap, LoaiVe, MaDD,TenPhim, DoTuoi, NgayChieu , GioBD, MaPhong, MaG, (Gia + PhuThu) AS GiaVe, MaNV, HoTen, NgayLap, GioLap
FROM (SELECT MaV, DiaChiRap, LoaiVe, MaNV, NgayLap, GioLap, MaKH, NgayDat, MaSC, MaG, Gia, HoTen
FROM (SELECT MaV, DiaChiRap, LoaiVe, VEXEMPHIM.MaNV, NgayLap, GioLap, MaKH, NgayDat, MaSC, MaG, MaGV, HoTen
FROM VEXEMPHIM LEFT JOIN NHANVIEN ON VEXEMPHIM.MaNV = NHANVIEN.MaNV) AS V LEFT JOIN GIAVE ON V.MaGV = GIAVE.MaGV) AS GG LEFT JOIN (
SELECT  MaSC, NgayChieu, GioBD, MaPhong, TenPhim, SC1.MaDD, PhuThu, DoTuoi
FROM (SELECT MaSC, NgayChieu, GioBD, GioKT, MaPhong, MaDD, TenPhim, DoTuoi, ThoiLuong
FROM SUATCHIEU LEFT JOIN PHIM ON SUATCHIEU.MaP = PHIM.MaP) AS SC1 LEFT JOIN DINHDANGPHIM ON SC1.MaDD = DINHDANGPHIM.MaDD) AS SC2 ON GG.MaSC = SC2.MaSC

--13 THÔNG TIN CHỖ NGỒI CHƯA CHỌN THEO PHÒNG
SELECT MaPhong, ViTriDay, ViTriCot , DaChon
FROM GHENGOI
WHERE DaChon = 0 AND MaPhong = 'PC1'

--14 THÔNG TIN BẢNG GIÁ
SELECT Ngay, TenGoiGia, Gio, Gia
FROM GIAVE LEFT JOIN GIATHEONGAY ON GIAVE.MaGV = GIATHEONGAY.MaGV

--15 THÔNG TIN KHÁCH HÀNG THÀNH VIÊN
SELECT *
FROM THETHANHVIEN LEFT JOIN KHACHHANG ON THETHANHVIEN.MaT = KHACHHANG.MaT

--16 XẾP HẠNG THÀNH VIÊN
SELECT KHACHHANG.MaT, Diem, TenKH
FROM THETHANHVIEN LEFT JOIN KHACHHANG ON THETHANHVIEN.MaT = KHACHHANG.MaT
ORDER BY Diem DESC

--17 THÔNG KẾ SÓ VÉ BÁN ĐƯỢC
SELECT COUNT(MaV) AS SoLuongVeBanDuoc
FROM VEXEMPHIM

--18 THỐNG KÊ TỔNG DOANH THU
SELECT SUM((Gia + PhuThu)) AS TongDoanhThu
FROM (SELECT MaV, DiaChiRap, LoaiVe, MaNV, NgayLap, GioLap, MaKH, NgayDat, MaSC, MaG, Gia, HoTen
FROM (SELECT MaV, DiaChiRap, LoaiVe, VEXEMPHIM.MaNV, NgayLap, GioLap, MaKH, NgayDat, MaSC, MaG, MaGV, HoTen
FROM VEXEMPHIM LEFT JOIN NHANVIEN ON VEXEMPHIM.MaNV = NHANVIEN.MaNV) AS V LEFT JOIN GIAVE ON V.MaGV = GIAVE.MaGV) AS GG LEFT JOIN (
SELECT  MaSC, NgayChieu, GioBD, MaPhong, TenPhim, SC1.MaDD, PhuThu, DoTuoi
FROM (SELECT MaSC, NgayChieu, GioBD, GioKT, MaPhong, MaDD, TenPhim, DoTuoi, ThoiLuong
FROM SUATCHIEU LEFT JOIN PHIM ON SUATCHIEU.MaP = PHIM.MaP) AS SC1 LEFT JOIN DINHDANGPHIM ON SC1.MaDD = DINHDANGPHIM.MaDD) AS SC2 ON GG.MaSC = SC2.MaSC

--19 THÊM DỮ LIỆU PHIM
INSERT INTO PHIM (MaP, TenPhim, ThoiLuong, DoTuoi, DaoDien, DienVien, TomTat, NgonNgu, QuocGia, NgayCongChieu, NhaSanXuat, TrangThai, MaTL)
VALUES('P6', N'The Shawshank Redemption', '02:22:00', 16, N'Frank Darabont', N'Tim Robbins, Morgan Freeman', N'Cuộc đời của nhân vật Andy Dufresne trong nhà tù Shawshank', N'Tiếng Anh', N'Mỹ', '1994-09-23', N'Castle Rock Entertainment', N'Đã công chiếu', 'TL5');
--20 XÓA DỮ LIỆU PHIM
DELETE FROM PHIM
WHERE MaP = 'P1'

