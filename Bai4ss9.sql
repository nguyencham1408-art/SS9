CREATE DATABASE Bai4ss9;
USE Bai4ss9;

CREATE TABLE SanPham (
id_san_pham VARCHAR(10) PRIMARY KEY,
ten_san_pham NVARCHAR(255),
danh_muc NVARCHAR(100)
);

CREATE TABLE KhoHang (
id_kho INT PRIMARY KEY,
id_san_pham VARCHAR(10),
so_luong_ton INT
);

INSERT INTO SanPham (id_san_pham, ten_san_pham, danh_muc) VALUES
('SP001', N'Điện thoại iPhone 15', N'Điện tử'),
('SP002', N'Laptop Dell XPS', N'Điện tử'),
('SP003', N'Nồi chiên không dầu Philips', N'Gia dụng');

 INSERT INTO KhoHang (id_kho, id_san_pham, so_luong_ton) VALUES
(1, 'SP001', 50),
(2, 'SP003', 120),
(3, 'SP004', 30),
(4, 'SP005', 15);

SELECT
kh.id_kho,
kh.id_san_pham,
kh.so_luong_ton,
sp.ten_san_pham
FROM SanPham sp
RIGHT JOIN KhoHang kh
ON sp.id_san_pham = kh.id_san_pham;
    
SELECT
kh.id_kho,
kh.id_san_pham,
kh.so_luong_ton,
sp.ten_san_pham
FROM SanPham sp
RIGHT JOIN KhoHang kh
ON sp.id_san_pham = kh.id_san_pham
WHERE sp.ten_san_pham IS NOT NULL;

SELECT
kh.id_kho,
kh.id_san_pham,
kh.so_luong_ton,
sp.ten_san_pham
FROM SanPham sp
RIGHT JOIN KhoHang kh
ON sp.id_san_pham = kh.id_san_pham
WHERE sp.ten_san_pham IS NULL;

