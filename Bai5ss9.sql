CREATE DATABASE Bai5ss9;
USE Bai5ss9;

CREATE TABLE NhaCungCap (
id_ncc INT PRIMARY KEY,
ten_ncc NVARCHAR(100)
);

CREATE TABLE SanPham (
id_sp INT PRIMARY KEY,
ten_sp NVARCHAR(100),
id_ncc INT
);

CREATE TABLE ChiTietDonHang (
id_don_hang INT,
id_sp INT,
so_luong INT,
PRIMARY KEY (id_don_hang, id_sp)
);

INSERT INTO NhaCungCap (id_ncc, ten_ncc) VALUES 
(1, N'Vinamilk'), 
(2, N'Orion'), 
(3, N'Acecook');

INSERT INTO SanPham (id_sp, ten_sp, id_ncc) VALUES 
(101, N'Sữa tươi tiệt trùng', 1), 
(102, N'Sữa chua Probi', 1), 
(201, N'Bánh Chocopie', 2), 
(301, N'Mì Hảo Hảo', 3);

INSERT INTO ChiTietDonHang (id_don_hang, id_sp, so_luong) VALUES 
(1001, 101, 5), 
(1001, 301, 10), 
(1002, 201, 3), 
(1003, 102, 12), 
(1003, 101, 4);

SELECT 
ctdh.id_don_hang,
sp.ten_sp,
ncc.ten_ncc,
ctdh.so_luong
FROM ChiTietDonHang ctdh
JOIN SanPham sp ON ctdh.id_sp = sp.id_sp
JOIN NhaCungCap ncc ON sp.id_ncc = ncc.id_ncc;

SELECT 
ctdh.id_don_hang,
sp.ten_sp,
ncc.ten_ncc,
ctdh.so_luong
FROM ChiTietDonHang ctdh
JOIN SanPham sp ON ctdh.id_sp = sp.id_sp
JOIN NhaCungCap ncc ON sp.id_ncc = ncc.id_ncc
WHERE ncc.ten_ncc = N'Vinamilk';

SELECT 
ctdh.id_don_hang,
sp.ten_sp,
ncc.ten_ncc,
ctdh.so_luong
FROM ChiTietDonHang ctdh
JOIN SanPham sp ON ctdh.id_sp = sp.id_sp
JOIN NhaCungCap ncc ON sp.id_ncc = ncc.id_ncc
WHERE ncc.ten_ncc = N'Vinamilk'
ORDER BY ctdh.so_luong DESC;


 