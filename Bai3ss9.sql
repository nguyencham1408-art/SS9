CREATE DATABASE Bai3ss9;
USE Bai3ss9;

CREATE TABLE NhanVien (
id_nhan_vien INT PRIMARY KEY,
ho_ten NVARCHAR(100),
chuc_vu NVARCHAR(100),
id_quan_ly INT
);

INSERT INTO NhanVien (id_nhan_vien, ho_ten, chuc_vu, id_quan_ly) VALUES
(1, N'Nguyễn Thị Mai', N'Giám đốc dự án', NULL),
(2, N'Trần Văn Hùng', N'Trưởng nhóm Kỹ thuật', 1),
(3, N'Lê Bảo Anh', N'Lập trình viên Senior', 2),
(4, N'Phạm Minh Tuấn', N'Lập trình viên Junior', 2),
(5, N'Vũ Thu Trang', N'Trưởng nhóm Kiểm thử', 1);

SELECT 
nv.ho_ten AS TenNhanVien,
nv.chuc_vu AS ChucVuNhanVien,
ql.ho_ten AS TenQuanLy
FROM NhanVien nv
LEFT JOIN NhanVien ql
ON nv.id_quan_ly = ql.id_nhan_vien;

SELECT 
nv.ho_ten AS TenNhanVien,
nv.chuc_vu AS ChucVuNhanVien,
ql.ho_ten AS TenQuanLy
FROM NhanVien nv
LEFT JOIN NhanVien ql
ON nv.id_quan_ly = ql.id_nhan_vien
WHERE ql.ho_ten = N'Trần Văn Hùng';

SELECT 
nv.ho_ten AS TenNhanVien,
nv.chuc_vu AS ChucVuNhanVien,
ql.ho_ten AS TenQuanLy,
ql.chuc_vu AS ChucVuQuanLy
FROM NhanVien nv
LEFT JOIN NhanVien ql
ON nv.id_quan_ly = ql.id_nhan_vien;
