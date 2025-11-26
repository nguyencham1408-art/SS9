CREATE DATABASE Bai2ss9;
USE Bai2ss9;

CREATE TABLE KhachHang (
id_khach_hang INT PRIMARY KEY,
ho_ten NVARCHAR(100),
email VARCHAR(100)
);

CREATE TABLE GiaoDich (
id_giao_dich INT PRIMARY KEY,
id_khach_hang INT,
ngay_giao_dich DATE,
so_tien DECIMAL(10, 2)
);

INSERT INTO KhachHang (id_khach_hang, ho_ten, email) VALUES
(1, N'Nguyễn Văn An', 'an.nguyen@email.com'),
(2, N'Trần Thị Bình', 'binh.tran@email.com'),
(3, N'Lê Minh Cường', 'cuong.le@email.com'),
(4, N'Phạm Thị Dung', 'dung.pham@email.com');

 INSERT INTO GiaoDich (id_giao_dich, id_khach_hang, ngay_giao_dich, so_tien) VALUES
(1001, 1, '2023-10-25', 150000),
(1002, 3, '2023-10-26', 95000),
(1003, 1, '2023-10-28', 210000);

SELECT 
kh.ho_ten,
kh.email,
gd.id_giao_dich,
gd.so_tien
FROM KhachHang kh
LEFT JOIN GiaoDich gd
ON kh.id_khach_hang = gd.id_khach_hang;

SELECT 
kh.ho_ten,
kh.email,
gd.id_giao_dich,
gd.so_tien
FROM KhachHang kh
LEFT JOIN GiaoDich gd
ON kh.id_khach_hang = gd.id_khach_hang
WHERE gd.id_giao_dich IS NOT NULL
ORDER BY gd.so_tien DESC;

SELECT 
kh.ho_ten,
kh.email
FROM KhachHang kh
LEFT JOIN GiaoDich gd
ON kh.id_khach_hang = gd.id_khach_hang
WHERE gd.id_giao_dich IS NULL;

