<<<<<<< HEAD
# Pair 04 Team Tasks & Roles - Lab 03

This document logs the responsibilities, schedule, and team alignment for **Lab 03**.

## 1. Team Information
* **Pair 04**: Core Business ↔ Notification Service integration.
* **Provider (Notification)**: Nguyễn Văn A (Nhóm A7/B7)
* **Consumer (Core Business)**: Trần Thị B (Nhóm A6/B6)

---

## 2. Tasks & Allocation

| Task ID | Task Description | Assignee | Status |
|:---|:---|:---|:---:|
| **T1** | OpenAPI 3.1.0 Contract polishing and lint checking | Nguyễn Văn A | Completed |
| **T2** | Express.js local server setup and validation coding | Nguyễn Văn A | Completed |
| **T3** | Postman collection structure and assertion script authoring | Trần Thị B | Completed |
| **T4** | Creating environment config JSON files (mock & local) | Trần Thị B | Completed |
| **T5** | Formatting error schemas to standard RFC 9457 Problem Details | Both | Completed |
| **T6** | Writing test matrix, reliability checklist, and handshake docs | Both | Completed |
| **T7** | Shell/PowerShell test automation scripts | Nguyễn Văn A | Completed |
| **T8** | GitHub Actions CI workflows integration | Nguyễn Văn A | Completed |

---

## 3. Workflow Progression

1. **Step 1: Contract Sign-Off**:
   - Polished [contracts/notification.openapi.yaml](file:///d:/notification-service/contracts/notification.openapi.yaml) to ensure 100% compliance with local Spectral rules.
2. **Step 2: Mock Configuration**:
   - Spin up Prism on port 4010 to mock responses dynamically.
3. **Step 3: Server Implementation**:
   - Built a local server that validates incoming requests, handles duplicates/idempotency, dates, and returns formatted errors.
4. **Step 4: Automated Newman runs**:
   - Combined local and mock Newman runs into automated test runner scripts.
=======
# TEAM_TASKS.md – Việc cần làm theo nhóm

Mỗi nhóm bắt đầu từ repo mẫu này và thay phần IoT bằng service của mình.

---

## Việc chung cho mọi nhóm

- [ ] Copy contract từ Lab 03 vào thư mục `contracts/`.
- [ ] Đảm bảo service có `GET /health`.
- [ ] Viết hoặc cập nhật `Dockerfile`.
- [ ] Viết `.dockerignore`.
- [ ] Viết `.env.example`.
- [ ] Viết `RUN_LOCAL.md`.
- [ ] Build image.
- [ ] Run container.
- [ ] Chạy Postman Collection từ Lab 03 trên container.
- [ ] Xuất Newman report.
- [ ] Chụp bằng chứng `/health` hoặc log container.
- [ ] Ghi tag image đã push.

---

## Gợi ý theo service

| Service | Điểm cần chú ý |
|---|---|
| IoT Ingestion | API nhận telemetry, auth token, `/health`, test boundary nhiệt độ |
| Camera Stream | Dùng `opencv-python-headless`, chuẩn bị 1 ảnh mẫu, chưa cần RTSP thật |
| Access Gate | Nếu chưa có DB trong Lab 04, dùng in-memory hoặc DB ngoài; Compose để Buổi 5 |
| AI Vision | Có thể dùng mock model hoặc YOLOv8n nhỏ; kiểm soát dung lượng image |
| Analytics | Nhận event JSON giả; TimescaleDB để Buổi 5 |
| Core Business | Policy evaluation chạy bằng config/env |
| Notification | Channel mock là đủ; không commit Telegram/email token thật |
>>>>>>> 6ed72e1b697c7712d522c728ea314dd245012863
