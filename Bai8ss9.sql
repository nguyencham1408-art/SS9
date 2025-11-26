-- NHIỆM VỤ 1
-- Tìm các cặp khách hàng khác nhau nhưng sống cùng 1 thành phố (loại bỏ cặp trùng lặp và tự kết nối)
SELECT
    CONCAT(c1.first_name, ' ', c1.last_name) AS Ten_Khach_Hang_1,
    CONCAT(c2.first_name, ' ', c2.last_name) AS Ten_Khach_Hang_2,
    c1.email AS Email_Khach_Hang_1,
    city.city AS Ten_Thanh_Pho
FROM customer c1
JOIN address a1 ON c1.address_id = a1.address_id
JOIN customer c2 ON c2.address_id IS NOT NULL        -- đảm bảo c2 có địa chỉ
JOIN address a2 ON c2.address_id = a2.address_id
JOIN city ON a1.city_id = city.city_id
    AND a2.city_id = city.city_id                     -- cùng chung city_id
WHERE
    c1.customer_id < c2.customer_id                    -- loại bỏ cặp trùng lặp và tự kết nối
ORDER BY city.city, Ten_Khach_Hang_1, Ten_Khach_Hang_2;

/*
================================================================================
PHẦN PHÂN TÍCH VÀ LẬP LUẬN (Trả lời theo yêu cầu)
================================================================================

1) Hiệu quả sơ bộ của chiến dịch "Cùng xem phim, thêm bạn hiền"
- Đánh giá tiềm năng:
  + Nếu truy vấn trên trả về **nhiều cặp** trong cùng một thành phố (tỉ lệ đáng kể so với tổng khách hàng),
    thì chiến dịch này có **tiềm năng lớn** — vì có nhiều nhóm khách hàng gần nhau dễ khuyến khích giới thiệu.
  + Nếu số cặp **rất ít**, tác động trực tiếp sẽ hạn chế và cần cân nhắc phương án bổ trợ (ví dụ: mở rộng sang cùng quận/phường hoặc dựa trên lịch sử tương tác).
- Lưu ý: số lượng cặp chỉ cho biết *khả năng* (proximity) — không bảo đảm mối quan hệ xã hội thật sự. Cần kết hợp dữ liệu hành vi để tăng độ chính xác.

2) Rủi ro & cân nhắc về quyền riêng tư khi gửi email nói về "người hàng xóm"
- Các lo ngại chính:
  + Khách hàng có thể cảm thấy xâm phạm nếu thông điệp ngụ ý họ đang bị theo dõi vị trí hoặc lộ thông tin địa lý (ví dụ: "hàng xóm của bạn ở X").
  + Gửi mail ám chỉ địa điểm có thể vi phạm chính sách bảo mật/đồng ý (consent) nếu khách hàng chưa đồng ý nhận dạng theo vị trí.
- Cách tiếp cận vừa hiệu quả vừa tôn trọng:
  + Không đề cập chi tiết địa chỉ trong email. Dùng ngôn ngữ trung tính/khuyến khích chung: "Có nhiều khách hàng tại khu vực của bạn đang tham gia chương trình..."
  + Chỉ gửi nếu khách hàng đã opt-in cho các email marketing / location-based offers.
  + Cung cấp lựa chọn rõ ràng để tắt nhận thông báo theo khu vực.
  + A/B test: so sánh mẫu nhắn nhẹ (an toàn) với mẫu nêu rõ lợi ích cộng đồng (khuyến khích giới thiệu) để xem phản hồi.

3) Cải tiến phương pháp (tăng độ tin cậy rằng hai người thực sự quen biết nhau)
- Ý tưởng (không code):
  + Thu hẹp từ "cùng thành phố" xuống "cùng quận/phường" hoặc "cùng postcode" nếu dữ liệu địa chỉ chi tiết có sẵn.
  + Kết hợp với **lịch sử thuê**: hai khách từng thuê cùng 1 bộ phim trong khoảng thời gian gần nhau → tăng xác suất họ có mối liên hệ hoặc chung sở thích.
  + Kết hợp **thể loại ưa thích**: nếu cùng thích thể loại hiếm/ niche thì khả năng quen biết/giới thiệu cao hơn.
  + Kết hợp **thời điểm giao dịch**: cùng thuê/truy cập vào các khung giờ/tuần tương đồng (ví dụ: tối cuối tuần).
  + Dùng dữ liệu gián tiếp: cùng số điện thoại đầu vùng (area code), cùng IP login (với chính sách bảo mật rõ ràng), hoặc phân tích social graph (nếu có liên kết mạng xã hội đã được khách hàng đồng ý).
- Ví dụ kịch bản cải tiến:
  + Lọc cặp khách cùng city **VÀ** đã thuê ít nhất 1 title giống nhau trong 6 tháng qua → gửi ưu đãi "mời bạn bè cùng xem" có cá nhân hóa theo title đã thuê.

================================================================================
*/
