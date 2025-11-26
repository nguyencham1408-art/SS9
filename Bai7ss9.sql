-- NHIỆM VỤ 1
-- 5 Thể loại Phim Phổ biến nhất (theo số lượt thuê)
SELECT
    c.name AS Ten_The_Loai,
    COUNT(r.rental_id) AS So_Luot_Thue
FROM category c
INNER JOIN film_category fc ON c.category_id = fc.category_id
INNER JOIN film f ON fc.film_id = f.film_id
INNER JOIN inventory i ON f.film_id = i.film_id
INNER JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY c.name
ORDER BY So_Luot_Thue DESC
LIMIT 5;


-- NHIỆM VỤ 2
-- Danh sách các Phim "Tồn Kho Chết" (chưa từng được nhập về kho -> không có inventory)
SELECT
    f.title AS Ten_Phim_Chua_Nhap
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
WHERE i.inventory_id IS NULL;


/*
===============================================================
PHÂN TÍCH VÀ ĐỀ XUẤT (DỰA TRÊN KẾT QUẢ NHIỆM VỤ 1 & 2)
===============================================================

1) Nhận định về Danh mục (dựa trên Nhiệm vụ 1 - top 5 thể loại nhiều lượt thuê nhất)
- Hướng chiến lược: Nên ưu tiên nhập và làm marketing cho các thể loại nằm trong top 5,
  vì dữ liệu cho thấy chúng tạo ra nhiều lượt thuê nhất — tức doanh thu/khách thuê cao.
- Lý do: Tập trung vào thể loại bán chạy giúp tối ưu hoá tỉ lệ hoàn vốn lưu kho, giảm chi phí tồn kho không sinh lời,
  và tăng khả năng quay vòng vốn (turnover). Ngoài ra, có thể tăng các chương trình khuyến mãi/ngôn chiến
  cho các tựa phim mới trong cùng thể loại để tận dụng xu hướng tiêu dùng hiện tại.

2) Hành động với "Tồn Kho Chết" (dựa trên Nhiệm vụ 2)
- Bước tiếp theo trước khi quyết định thanh lý:
  a) Xác minh dữ liệu: Kiểm tra nguyên nhân vì sao film này không có inventory (lỗi nhập dữ liệu, chuyển kho, ngừng cung cấp...).
  b) Kiểm tra metadata: Kiểm tra ngày phát hành, ngôn ngữ, độ phổ biến lịch sử — có thể là phim quá cũ hoặc niche.
  c) Thử nghiệm nhẹ: Nếu chi phí cho phép, thử đưa một vài tựa này vào chương trình khuyến mãi/giảm giá để đo phản hồi.
- Nếu sau các bước trên vẫn không có nhu cầu:
  → Đề xuất: Loại bỏ dần (delist) hoặc bán thanh lý (clearance) để giải phóng không gian lưu kho và giảm chi phí lưu kho.
- Lưu ý: Không khuyên xóa ngay khỏi danh mục dữ liệu hệ thống cho đến khi đã xác minh để tránh mất lịch sử bán hàng.

3) Mở rộng Vấn đề — Các giả thuyết kinh doanh khác cho việc một phim "chưa từng được nhập kho"
- Giả thuyết 1: Đây có thể là phim mới vừa được thêm vào hệ thống danh mục (film table) nhưng vẫn chưa được đặt mua/nhập vào kho (inventory) do chậm trễ chuỗi cung ứng.
- Giả thuyết 2: Đây có thể là phim bị gắn nhãn sai (ví dụ film được nhập nhưng film_id khác, hoặc lỗi mapping giữa film_id và inventory).
- Giả thuyết 3: Film này được phân phối chỉ qua kênh digital (streaming) hoặc đối tác (không qua kho nội bộ), nên không xuất hiện trong bảng inventory.
- Hành động đề xuất để kiểm chứng giả thuyết:
  • Chạy audit so sánh giữa film metadata và các đơn đặt hàng/ncc để xem có tồn tại lịch sử mua.
  • Kiểm tra logs nhập kho và hệ thống ERP để phát hiện lỗi mapping hoặc đơn hàng bị huỷ.
  • Liên hệ bộ phận mua hàng / đối tác phân phối để xác thực trạng thái của từng tựa.

===============================================================
*/

