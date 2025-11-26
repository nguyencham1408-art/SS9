CREATE DATABASE Bai1ss9;
USE Bai1ss9;

CREATE TABLE Sach (
id_sach INT PRIMARY KEY,
ten_sach NVARCHAR(255),
tac_gia NVARCHAR(100),
gia_ban DECIMAL(10, 2)
);

CREATE TABLE ChiTietDonHang (
id_chi_tiet INT PRIMARY KEY,
id_don_hang INT,
id_sach INT,
so_luong INT
);

INSERT INTO Sach (id_sach, ten_sach, tac_gia, gia_ban) VALUES
(101, N'Đắc Nhân Tâm', N'Dale Carnegie', 120000),
(102, N'Nhà Giả Kim', N'Paulo Coelho', 95000),
(103, N'Muôn Kiếp Nhân Sinh', N'Nguyên Phong', 150000),
(104, N'Tư Duy Nhanh và Chậm', N'Daniel Kahneman', 250000);

INSERT INTO ChiTietDonHang (id_chi_tiet, id_don_hang, id_sach, so_luong) VALUES
(1, 501, 102, 1),
(2, 501, 103, 2),
(3, 502, 101, 1),
(4, 503, 102, 3);

SELECT 
ctdh.id_don_hang,
s.ten_sach,
ctdh.so_luong,
s.gia_ban
FROM ChiTietDonHang ctdh
INNER JOIN Sach s
ON ctdh.id_sach = s.id_sach;

SELECT 
ctdh.id_don_hang,
s.ten_sach,
ctdh.so_luong,
s.gia_ban,
(ctdh.so_luong * s.gia_ban) AS doanh_thu_dong
FROM ChiTietDonHang ctdh
INNER JOIN Sach s
ON ctdh.id_sach = s.id_sach;

SELECT 
ctdh.id_don_hang,
s.ten_sach,
ctdh.so_luong,
s.gia_ban,
(ctdh.so_luong * s.gia_ban) AS doanh_thu_dong
FROM ChiTietDonHang ctdh
INNER JOIN Sach s
ON ctdh.id_sach = s.id_sach
ORDER BY doanh_thu_dong DESC;


 