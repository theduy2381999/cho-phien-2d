# Chợ Phiên 2D

Game 2D chạy trên trình duyệt: người chơi điều khiển nhân vật đi dạo giữa 8 gian hàng của một khu chợ quê, xem sản phẩm, nhắn tin và gặp người chơi khác.

**Chơi thử:** https://cho-phien-2d.netlify.app

## Tính năng

- **Chợ có 8 gian hàng** (Áo Quần, Giày Dép, Phụ Kiện, Mỹ Phẩm, Đồ Ăn, Nước Uống, Trái Cây, Bánh Kẹo), mỗi gian một kiểu mái, tường và đồ trưng bày riêng; chủ tiệm chào khách và rao hàng.
- **Popup sản phẩm** gồm danh sách món và trang chi tiết (mô tả, tùy chọn, nút mua Shopee/TikTok để gắn link sau).
- **Tạo nhân vật:** tên, màu tên, trạng thái, thú cưng, màu da, tóc, áo, quần, mũ.
- **Ngày và đêm theo giờ Việt Nam**, chợ đêm có ánh sáng, khuya một số gian đóng cửa.
- **4 theme:** Tết, Trung thu, Noel, Mùa mưa (chỉ đổi khi người chơi chọn).
- **Âm thanh** tổng hợp bằng Web Audio: hiệu ứng, tiếng môi trường, nhạc nền theo theme.
- **Điều khiển** bằng bàn phím (WASD, mũi tên), chạm/click vào bản đồ, hoặc joystick ảo trên điện thoại.
- **Nhiều người chơi** thấy nhau di chuyển và nhắn tin.

## Chạy trên máy

Game là một file duy nhất, không cần cài gì:

```bash
# mở trực tiếp
xdg-open index.html

# hoặc chạy bằng server tĩnh bất kỳ
python3 -m http.server 8080
```

## Điều khiển

| Việc | Máy tính | Điện thoại |
|---|---|---|
| Di chuyển | WASD / phím mũi tên / click bản đồ | Joystick hoặc chạm bản đồ |
| Vào gian | `E` hoặc click vào gian | Nút vàng "Vào gian" |
| Nhân vật | `C` | Nút "Nhân vật" |
| Cảnh chợ (ngày đêm, theme, âm thanh) | `T` | Nút giờ ở góc phải |
| Nhắn tin | `Enter` | Nút 💬 |

## Nhiều người chơi

Game dùng một **broker MQTT công cộng** làm bộ chuyển tiếp, nên không cần server riêng. Mở link kèm `?room=ten-nhom` để chơi riêng với một nhóm:

```
https://cho-phien-2d.netlify.app/?room=team-a
```

> Broker công cộng không có cam kết về độ ổn định và **không riêng tư**: ai biết tên chủ đề đều đọc và đăng được. Chỉ phù hợp để thử nghiệm. Khi chạy thật nên chuyển sang server WebSocket riêng (phần mạng nằm trong khối `Nhiều người chơi` của `index.html`).

## Deploy

Site chạy trên Netlify (`cho-phien-2d`). Với Netlify CLI đã đăng nhập:

```bash
./deploy.sh "ghi chú cho lần deploy"
```

Script chép `index.html` vào `dist/` rồi đẩy lên production.

## Cấu trúc

```
index.html     toàn bộ game (HTML, CSS, JS, asset nhúng base64)
deploy.sh      deploy lên Netlify
assets/        asset gốc của Kenney (đã giải nén, dùng làm nguồn)
```

Dữ liệu sản phẩm nằm ở mảng `PRODUCTS` trong `index.html`. Mỗi món có sẵn trường `img` (link ảnh) và `links.shopee`, `links.tiktok` để điền sau.

## Ghi công

Hình ảnh nhân vật và nền chợ dùng bộ asset miễn phí của [Kenney](https://kenney.nl) theo giấy phép CC0:
[Tiny Town](https://kenney.nl/assets/tiny-town) và [Roguelike Characters](https://kenney.nl/assets/roguelike-characters).
