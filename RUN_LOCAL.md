<<<<<<< HEAD
# Hướng dẫn Chạy Dịch vụ dưới Local (RUN_LOCAL.md)

> **Registry Image Tag**: `ghcr.io/connectivity-services-ad-pt/team-notify:v0.1.0-team-notify`

Tài liệu này hướng dẫn 5 bước cơ bản để cài đặt, đóng gói Docker và chạy kiểm thử dịch vụ **Notification Service (Team Notify - Pair 04)**.

---

## Bước 1: Chuẩn bị Môi trường
Trước khi bắt đầu, hãy đảm bảo máy tính của bạn đã được cài đặt các công cụ sau:
- **Node.js**: Phiên bản 20.x LTS.
- **Docker Desktop**: Đang chạy bình thường.
- **Git** và **npm**.

Cài đặt các thư viện cần thiết phục vụ cho việc kiểm thử tự động:
```bash
npm install --legacy-peer-deps
=======
# RUN_LOCAL.md – Hướng dẫn chạy Lab 04

Tài liệu này giúp người khác clone repo sạch và chạy lại service trong Docker.

---

## 1. Clone repo

```bash
git clone <repo-url>
cd FIT4110_lab04_docker_packaging
>>>>>>> 6ed72e1b697c7712d522c728ea314dd245012863
```

---

<<<<<<< HEAD
## Bước 2: Tạo các File Cấu hình cần thiết
Hãy tạo file `.env.example` ở thư mục gốc của dự án nếu chưa có:
```ini
PORT=8000
NODE_ENV=production
```

---

## Bước 3: Đóng gói Docker Image
Xây dựng Docker Image cho Notification Service bằng lệnh dưới đây:
```bash
docker build -t fit4110/iot-ingestion:lab04 -t v0.1.0-team-notification -t v0.1.0-team-notify .
=======
## 2. Cài dependencies cho Newman/Prism/Spectral

```bash
npm install
>>>>>>> 6ed72e1b697c7712d522c728ea314dd245012863
```

---

<<<<<<< HEAD
## Bước 4: Khởi chạy Docker Container
Chạy container từ Image vừa được đóng gói (cổng local mapping 8000:8000):
```bash
docker run --rm --name fit4110-iot-lab04 -p 8000:8000 --env-file .env.example fit4110/iot-ingestion:lab04
```

Kiểm tra lại xem container đã phản hồi bình thường chưa tại endpoint `/health`:
=======
## 3. Build Docker image

```bash
docker build -t fit4110/iot-ingestion:lab04 .
```

---

## 4. Run container

```bash
docker run --rm \
  --name fit4110-iot-lab04 \
  -p 8000:8000 \
  --env-file .env.example \
  fit4110/iot-ingestion:lab04
```

Mở terminal khác, kiểm tra:

>>>>>>> 6ed72e1b697c7712d522c728ea314dd245012863
```bash
curl http://localhost:8000/health
```

<<<<<<< HEAD
---

## Bước 5: Chạy Kiểm thử Tự động (Newman)
Khi container đang chạy, chạy các ca kiểm thử tự động từ Postman Collection:

1. Khởi động Mock Server của dịch vụ Core Business (dependencies ở port `4011`):
   ```bash
   npx prism mock contracts/core-business.openapi.yaml --port 4011
   ```
2. Chạy bộ kiểm thử Newman trong terminal thứ hai:
   ```bash
   npm run test:local
   ```
   *(Hoặc sử dụng lệnh tích hợp trong Makefile: `make test-docker`)*
3. Kết quả các báo cáo dạng HTML và XML sẽ tự động được sinh ra trong thư mục `reports/`.

---

## Lệnh nhanh bằng Makefile
Nếu môi trường của bạn hỗ trợ `make`, bạn có thể chạy các lệnh rút gọn sau:
- `make install`: Cài đặt dependencies (`npm install`).
- `make lint`: Kiểm tra chất lượng và định dạng hợp đồng OpenAPI.
- `make mock`: Khởi chạy server mock cục bộ của Notification Service ở cổng 4010.
- `make test-mock`: Chạy Newman kiểm thử hợp đồng mock của Notification Service.
- `make build`: Xây dựng Docker Image cho Notification Service.
- `make run`: Chạy Docker Container của Notification Service.
- `make test-docker`: Chạy Newman kiểm thử trực tiếp trên Container đang chạy.
- `make stop`: Dừng Docker Container đang chạy.

=======
Kết quả mong đợi:

```json
{
  "status": "ok",
  "service": "iot-ingestion",
  "version": "0.4.0"
}
```

---

## 5. Chạy Newman test trên container

```bash
npm run test:local
```

Report sinh tại:

```text
reports/newman-lab04-local.xml
reports/newman-lab04-local.html
```

---

## 6. Dừng container

Nếu không dùng `--rm` hoặc container còn chạy:

```bash
docker stop fit4110-iot-lab04
```

---

## 7. Lệnh nhanh

```bash
make build
make run
make test-docker
make stop
```
>>>>>>> 6ed72e1b697c7712d522c728ea314dd245012863
