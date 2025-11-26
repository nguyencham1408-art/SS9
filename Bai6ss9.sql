CREATE DATABASE Bai6ss9;
USE Bai6ss9;

CREATE TABLE KhachHang (
id_kh INT PRIMARY KEY,
ho_ten NVARCHAR(100),
kenh_dang_ky NVARCHAR(50),
id_nguoi_gioi_thieu INT
);

INSERT INTO KhachHang (id_kh, ho_ten, kenh_dang_ky, id_nguoi_gioi_thieu) VALUES
(1, N'An', 'Facebook Ads', NULL),
(2, N'Bình', N'Chi nhánh', NULL),
(3, N'Cường', N'Bạn bè giới thiệu', 1),
(4, N'Dũng', 'Google Ads', NULL),
(5, N'Giang', N'Bạn bè giới thiệu', 2),
(6, N'Hương', N'Bạn bè giới thiệu', 1);

 SELECT
 kh1.ho_ten AS NguoiDuocGioiThieu,
kh2.ho_ten AS NguoiGioiThieu,
kh2.kenh_dang_ky AS KenhCuaNguoiGioiThieu
FROM KhachHang kh1
LEFT JOIN KhachHang kh2
ON kh1.id_nguoi_gioi_thieu = kh2.id_kh;

SELECT
kh1.ho_ten AS NguoiDuocGioiThieu,
kh2.ho_ten AS NguoiGioiThieu,
kh2.kenh_dang_ky AS KenhCuaNguoiGioiThieu
FROM KhachHang kh1
JOIN KhachHang kh2
ON kh1.id_nguoi_gioi_thieu = kh2.id_kh
WHERE kh2.kenh_dang_ky = N'Facebook Ads';

SELECT
kh1.ho_ten AS NguoiDuocGioiThieu,
kh2.ho_ten AS NguoiGioiThieu,
kh2.kenh_dang_ky AS KenhCuaNguoiGioiThieu
FROM KhachHang kh1
JOIN KhachHang kh2
ON kh1.id_nguoi_gioi_thieu = kh2.id_kh
WHERE kh2.kenh_dang_ky = N'Chi nhánh';


