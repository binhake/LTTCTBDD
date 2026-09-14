# Báo cáo thực hành: Lab F1 – Hồ sơ của tôi (Flutter)

## Thông tin sinh viên
- **Họ và tên:** Nguyễn Trọng Bình
- **MSSV:** 231A010044
- **Lớp / Môn học:** Khoa CNTT – Lập trình trên các thiết bị di động (INT4211)

---

## 1. Mục tiêu bài lab
- Làm quen với cấu trúc dự án Flutter và môi trường lập trình di động.
- Hiểu và phân biệt cách sử dụng `StatelessWidget` và `StatefulWidget`.
- Thực hành xây dựng giao diện người dùng (UI) cơ bản, xử lý tương tác và quản lý trạng thái (`setState`).
- Thực hiện các bài tập nâng cao: chuyển đổi giao diện sáng/tối (ThemeMode) và cấu trúc module hóa code.

---

## 2. Các nội dung và kiến thức đã học được

### 2.1. Phân biệt `StatelessWidget` và `StatefulWidget`
- **`StatelessWidget` (`ProfileCard`):** 
  - Dùng cho các thành phần giao diện chỉ hiển thị dữ liệu tĩnh, không thay đổi theo thời gian.
  - Nhận dữ liệu truyền vào qua constructor (`name`, `studentId`, `className`).
  - Xử lý logic cắt chuỗi để lấy ký tự đầu tiên làm avatar tròn (`CircleAvatar`).
- **`StatefulWidget` (`ProfileScreen` & `MainApp`):**
  - Dùng cho các màn hình có dữ liệu thay đổi theo hành động của người dùng.
  - Sử dụng `setState()` để kích hoạt việc vẽ lại giao diện (re-build) khi có thay đổi trạng thái.

### 2.2. Xử lý tương tác và cập nhật giao diện (Bộ đếm lượt thích)
- Xây dựng cụm nút bấm tương tác:
  - Nút **Thích** (`+`): Tăng số lượt thích.
  - Nút **Giảm** (`-`): Giảm số lượt thích (chặn không cho số âm).
  - Nút **Làm mới** (`↺`): Đặt lại số lượt thích về 0.
- **Thay đổi giao diện theo điều kiện:** Khi số lượt thích $\ge 10$, màu chữ tự động đổi từ màu xanh sang màu đỏ nổi bật (đáp ứng tiêu chí barem chấm điểm của giảng viên).

### 2.3. Bài nâng cao: Chế độ Sáng / Tối (`ThemeMode`)
- Cấu hình chủ đề trong `MaterialApp` với `theme: ThemeData.light()` và `darkTheme: ThemeData.dark()`.
- Tạo biến trạng thái `_themeMode` và nút chuyển đổi (mặt trời / mặt trăng) trên thanh `AppBar` để đổi giao diện sáng/tối linh hoạt.

### 2.4. Bài nâng cao: Cấu trúc code dạng module (Refactoring)
- Tách riêng widget `ProfileCard` sang file độc lập: `lib/widgets/profile_card.dart`.
- Tái sử dụng widget trong `lib/main.dart` thông qua cú pháp `import`.
- Giúp mã nguồn rõ ràng, dễ bảo trì và mở rộng cho các buổi học sau.

---

## 3. Cấu trúc thư mục mã nguồn
```text
lib/
├── main.dart                  # Khởi chạy ứng dụng, quản lý theme và màn hình chính ProfileScreen
└── widgets/
    └── profile_card.dart      # Widget hiển thị thẻ hồ sơ sinh viên (StatelessWidget)
```