<<<<<<< HEAD
[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/yHA6qwI5)
# FIT4110 — Lab 02 OpenAPI 3.1 Contract-First

Repo này dùng cho **Lab 02 — Thực hành đàm phán và viết OpenAPI 3.1** của học phần **Dịch vụ kết nối và công nghệ nền tảng (FIT4110)**.

Lab 02 nối tiếp trực tiếp Lab 01 trong repo `FIT4110_setup`:

- Lab 01: sinh viên thiết lập môi trường và nộp `service-boundary.md`.
- Lab 02: sinh viên chuyển Service Boundary thành **hợp đồng API** bằng `openapi.yaml`.
- Hai nhóm ở hai vai **Consumer** và **Provider** phải đàm phán trước khi code.
- Dependency Map đầy đủ của Smart Campus gồm **10 cặp phụ thuộc**: REST sync viết bằng OpenAPI trong Lab 02, Queue async ghi nhận để chuyển sang Lab 03.

> Nguyên tắc trọng tâm: **contract-first** — không viết code trước khi chốt hợp đồng API.

---

## 1. Sinh viên cần làm gì trong Lab 02?

Mỗi cặp đàm phán cần hoàn thành các artefact sau:

```text
openapi.yaml
negotiation-log.md
docs/analysis-provider.md
docs/analysis-consumer.md
evidence/buoi-02/spectral-report.txt
evidence/buoi-02/mock-screenshots/req-01-*.png ... req-05-*.png
VERSIONING.md
```

Bài làm đạt yêu cầu khi:

- `openapi.yaml` dùng **OpenAPI 3.1.0**.
- Có tối thiểu 4 path phù hợp user story của cặp.
- Có schema đặt trong `components/schemas`, dùng `$ref` thay vì inline schema dài.
- Có ít nhất một ví dụ `oneOf` + `discriminator`.
- Có ít nhất một trường dùng union type với `null`, ví dụ `type: [string, "null"]`.
- Response lỗi 4xx/5xx dùng `Problem Details`.
- File pass `spectral lint` với `campus-spectral.yaml`.
- Mock server chạy được bằng Prism và có 5 request mẫu làm bằng chứng.
- `negotiation-log.md` có tối thiểu 6 issue, rationale rõ, có sign-off 2 bên.

---

## 2. Cấu trúc repo

```text
FIT4110_lab02_openapi/
  README.md
  openapi.yaml
  campus-spectral.yaml
  negotiation-log.md
  package.json
  docs/
    lab02-guide.md
    pairing-matrix.md
    openapi-authoring-guide.md
    swagger-online-workflow.md
    event-contract-template.md
    analysis-provider.md
    analysis-consumer.md
  user-stories/
    README.md
    pair-01-camera-ai-vision.md
    pair-02-core-ai-vision.md
    pair-03-core-access-gate.md
    pair-04-core-notification-async.md
    pair-05-iot-core-async.md
    pair-06-iot-analytics-async.md
    pair-07-camera-analytics-async.md
    pair-08-core-analytics-async.md
    pair-09-access-analytics-async.md
    pair-10-access-core-policy.md
  evidence/
    buoi-02/
      README.md
      checklist.md
      known-issues.md
      mock-screenshots/
        .gitkeep
  scripts/
    install_lab02_cli.sh
    install_lab02_cli.ps1
    lint_openapi.sh
    lint_openapi.ps1
    mock_openapi.sh
    mock_openapi.ps1
    collect_session02_evidence.sh
    collect_session02_evidence.ps1
  .github/workflows/check-lab02.yml
=======
# FIT4110_lab04_docker_packaging

**Học phần:** FIT4110 – Dịch vụ kết nối và Công nghệ nền tảng  
**Buổi 4:** Đóng gói service với Docker & tư duy công nghệ nền tảng  
**Case study:** Smart Campus Operations Platform  
**Repo nền:** `FIT4110_lab03_postman_mock_testing`

> Lab 03 đã có OpenAPI contract, Postman Collection, Mock Server và Newman report.  
> Lab 04 dùng lại logic đó để kiểm tra một điều mới: **service có chạy ổn khi được đóng gói thành Docker container không?**

---

## 1. Ý tưởng nối tiếp từ Lab 03 sang Lab 04

Ở Lab 03, luồng làm việc là:

```text
OpenAPI Contract → Mock Server → Postman Test → Newman Report → CI Evidence
```

Ở Lab 04, luồng đó được mở rộng thành:

```text
OpenAPI Contract
→ Service thật
→ Dockerfile
→ Docker Image
→ Docker Container
→ Postman/Newman chạy lại trên container
→ Evidence
```

Lab 04 hiện đã đồng bộ lại với contract IoT của Lab 03 theo payload:

```json
{
  "device_id": "ESP32-LAB-A01",
  "metric": "temperature",
  "value": 31.5,
  "unit": "celsius",
  "timestamp": "2026-05-13T08:30:00+07:00"
}
```

Boundary dùng trong bài:

```text
temperature: -40 đến 80
```

Thông điệp chính của buổi học:

> Một API pass Postman trên máy cá nhân chưa đủ.  
> Service cần được đóng gói thành container để người khác có thể chạy lại nhất quán.

---

## 2. Mục tiêu sau buổi lab

Sau khi hoàn thành Lab 04, mỗi nhóm cần làm được:

- Viết được `Dockerfile` cho service của nhóm.
- Dùng `.dockerignore` để giảm context build.
- Tách cấu hình runtime qua `.env.example`.
- Không commit secret thật vào repo.
- Chạy app bằng user non-root trong container.
- Có `HEALTHCHECK` gọi `GET /health`.
- Build được Docker image.
- Run được container từ image.
- Chạy lại Postman Collection của Lab 03 trên container.
- Kiểm tra được functional, auth, negative, boundary và schema lỗi `ProblemDetails`.
- Xuất Newman report làm bằng chứng.
- Viết được `RUN_LOCAL.md` hướng dẫn người khác chạy lại trong 3–5 bước.

---

## 3. Cấu trúc repo

```text
FIT4110_lab04_docker_packaging/
├── README.md
├── RUN_LOCAL.md
├── Dockerfile
├── .dockerignore
├── .env.example
├── .gitignore
├── Makefile
├── package.json
├── requirements.txt
├── src/
│   └── iot_app/
│       ├── __init__.py
│       └── main.py
├── contracts/
│   └── iot-ingestion.openapi.yaml
├── postman/
│   ├── collections/
│   │   └── FIT4110_lab04_iot_docker.postman_collection.json
│   └── environments/
│       ├── FIT4110_lab04_mock.postman_environment.json
│       └── FIT4110_lab04_local.postman_environment.json
├── mock-data/
├── scripts/
├── docs/
├── checklists/
├── templates/
├── reports/
└── .github/
    └── workflows/
        └── docker-newman.yml
>>>>>>> 6ed72e1b697c7712d522c728ea314dd245012863
```

---

<<<<<<< HEAD
## 3. Cài đặt công cụ

Yêu cầu tối thiểu:

- Git
- Node.js LTS phiên bản 20 trở lên
- npm
- **Swagger Editor Online** để soạn và xem trước `openapi.yaml`
- VS Code hoặc editor YAML/OpenAPI tương đương nếu muốn sửa offline
- `curl` để gọi thử Prism mock server; 

### macOS/Linux

```bash
chmod +x scripts/*.sh
./scripts/install_lab02_cli.sh
```

### Windows PowerShell

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\scripts\install_lab02_cli.ps1
```

Có thể cài qua npm script:

```bash
npm run install:cli
```

---

## 4. Quy trình thực hành gợi ý

### Bước 1. Xác định cặp đàm phán

Xem bảng trong:

```text
docs/pairing-matrix.md
```

Mở đúng user story trong thư mục:

```text
user-stories/
```

Ví dụ REST sync:

```text
user-stories/pair-01-camera-ai-vision.md
```

Ví dụ Queue async:

```text
user-stories/pair-08-core-analytics-async.md
```

Queue async được đưa vào Dependency Map để không bỏ sót kiến trúc, nhưng Lab 02 chưa yêu cầu Postman và chưa yêu cầu đặc tả AsyncAPI đầy đủ.

---

### Bước 2. Mỗi bên phân tích độc lập

Provider điền:

```text
docs/analysis-provider.md
```

Consumer điền:

```text
docs/analysis-consumer.md
```

Không trao đổi quá sớm. Mục tiêu là mỗi bên phải có góc nhìn riêng để đưa vào bàn đàm phán.

---

### Bước 3. Viết bản thảo `openapi.yaml` bằng Swagger Editor Online

Trong Lab 02, sinh viên ưu tiên dùng **Swagger Editor Online** tại:

```text
https://editor.swagger.io
```

Quy trình gợi ý:

1. Mở `openapi.yaml` trong repo.
2. Copy toàn bộ nội dung YAML.
3. Dán vào khung bên trái của Swagger Editor Online.
4. Quan sát phần preview bên phải để phát hiện lỗi cú pháp, thiếu schema, thiếu response hoặc mô tả chưa rõ.
5. Sau khi chỉnh xong, copy YAML từ Swagger Editor về lại file `openapi.yaml` trong repo.
6. Commit file đã sửa lên GitHub.

> Swagger Editor Online giúp xem nhanh tài liệu API và lỗi cú pháp. Tuy nhiên, tiêu chí chấm chính vẫn là `spectral lint` với `campus-spectral.yaml`, vì Swagger Editor không kiểm tra đầy đủ rule riêng của lớp.

Có thể bắt đầu từ file mẫu trong repo:

```text
openapi.yaml
```

Sau khi sửa, kiểm tra bằng:

```bash
npm run lint
```

hoặc:

```bash
./scripts/lint_openapi.sh
```

Windows:

```powershell
.\scripts\lint_openapi.ps1
```

---

### Bước 4. Đàm phán và ghi biên bản

Hai nhóm cùng mở:

```text
negotiation-log.md
```

Mỗi issue cần có:

- Bối cảnh
- Vấn đề
- Đề xuất
- Quyết định
- Rationale
- Tác động đến service

Commit bản đã ký:

```bash
git add openapi.yaml negotiation-log.md docs/analysis-provider.md docs/analysis-consumer.md
 git commit -m "chore(contract): <ten-cap> v1.0 signed-off"
```

---

### Bước 5. Chạy Spectral và lưu báo cáo

```bash
npm run lint:report
```

hoặc:

```bash
./scripts/collect_session02_evidence.sh
```

Kết quả cần có:

```text
evidence/buoi-02/spectral-report.txt
```

---

### Bước 6. Chạy Prism mock server và test bằng curl

```bash
npm run mock
```

hoặc:

```bash
./scripts/mock_openapi.sh
```

Server mặc định chạy ở:

```text
http://localhost:4010
```

Lab 02 **không yêu cầu dùng Postman**. Sinh viên test 5 request mẫu bằng `curl` trong Terminal/PowerShell hoặc chạy script mẫu:

```bash
./scripts/test_mock_with_curl.sh
```

Windows:

```powershell
.\scripts\test_mock_with_curl.ps1
```

Khi chụp minh chứng, ảnh cần có lệnh `curl`, status code và response body. Lưu ảnh vào:

```text
evidence/buoi-02/mock-screenshots/
```

---

## 5. Lệnh kiểm tra nhanh

```bash
node --version
npm --version
spectral --version
prism --version
spectral lint openapi.yaml --ruleset campus-spectral.yaml
prism mock openapi.yaml --port 4010
```

Ví dụ gọi mock bằng `curl`:

```bash
curl -i http://localhost:4010/health
curl -i http://localhost:4010/alerts/recent -H "Authorization: Bearer test-token"
=======
## 4. Chuẩn bị môi trường

Cần cài trước:

- Git
- Docker Desktop hoặc Docker Engine
- Node.js 20.x LTS
- npm
- Postman Desktop hoặc Postman Web

Cài dependencies phục vụ Prism, Spectral, Newman:

```bash
npm install
```

Kiểm tra:

```bash
docker --version
docker info
node --version
npx newman --version
npx prism --version
>>>>>>> 6ed72e1b697c7712d522c728ea314dd245012863
```

---

<<<<<<< HEAD
## 6. Nộp bài

```bash
git status
git add openapi.yaml negotiation-log.md VERSIONING.md docs evidence/buoi-02
git commit -m "submit: lab02 openapi contract evidence"
git push
=======
## 5. Chạy service local không dùng Docker

Cài Python dependencies:

```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

Chạy API:

```bash
uvicorn iot_app.main:app --app-dir src --host 0.0.0.0 --port 8000
```

Kiểm tra:

```bash
curl http://localhost:8000/health
>>>>>>> 6ed72e1b697c7712d522c728ea314dd245012863
```

---

<<<<<<< HEAD
## 7. Không được commit

Không commit các file sau:

```text
*.doc
*.docx
*.ppt
*.pptx
.env
node_modules/
file dữ liệu lớn
file model lớn
```

Repo đã có GitHub Actions để chặn file Word và kiểm tra cấu trúc Lab 02.

---

## 8. Tinh thần của Lab 02

> Không nộp “API em nghĩ là đúng”, mà nộp **hợp đồng API đã được đàm phán, kiểm tra và có bằng chứng chạy được**.
=======
## 6. Build và chạy bằng Docker

Build image:

```bash
docker build -t fit4110/iot-ingestion:lab04 .
```

Run container:

```bash
docker run --rm \
  --name fit4110-iot-lab04 \
  -p 8000:8000 \
  --env-file .env.example \
  fit4110/iot-ingestion:lab04
```

Kiểm tra health:

```bash
curl http://localhost:8000/health
```

---

## 7. Chạy lại Postman Collection trên container

Chạy Newman với local environment:

```bash
npm run test:local
```

Hoặc dùng script:

```bash
bash scripts/run-newman.sh local
```

Report được sinh trong:

```text
reports/
```

---

## 8. Các lệnh nhanh bằng Makefile

```bash
make install
make lint
make mock
make test-mock
make build
make run
make test-docker
make stop
```

---

## 9. Bài làm của từng nhóm

Mỗi nhóm dùng repo này làm mẫu, sau đó thay phần IoT bằng service của mình.

| Nhóm | Cần thay đổi |
|---|---|
| `team-iot` | Có thể dùng mẫu này trực tiếp, mở rộng thêm endpoint từ Lab 03 |
| `team-camera` | Thay `src/` bằng Camera Stream service, thêm OpenCV headless |
| `team-gate` | Thay bằng Access Gate service, lưu ý biến môi trường DB |
| `team-vision` | Thay bằng AI Vision service, chuẩn bị model YOLOv8n hoặc mock model |
| `team-analytics` | Thay bằng Analytics service, chưa bắt buộc TimescaleDB trong Lab 04 |
| `team-core` | Thay bằng Core Business policy engine |
| `team-notify` | Thay bằng Notification service, không commit token thật |

---

## 10. Điều kiện hoàn thành Lab 04

Một nhóm được xem là hoàn thành khi:

- `Dockerfile` build được image.
- Image chạy được container.
- Container có `GET /health` trả `200`.
- Service chạy bằng non-root user.
- Có `.dockerignore`.
- Có `.env.example`.
- Có `RUN_LOCAL.md`.
- Chạy lại Postman/Newman pass trên container.
- Có test cho functional, auth, negative, boundary.
- Error response trả đúng dạng `ProblemDetails`.
- Có report trong `reports/`.
- Có bằng chứng image tag đúng quy ước.

Tag gợi ý:

```text
v0.1.0-<team>
```

Ví dụ:

```bash
docker tag fit4110/iot-ingestion:lab04 ghcr.io/<owner>/team-iot:v0.1.0-team-iot
```

---

## 11. Artefact cần nộp

```text
Dockerfile
.dockerignore
.env.example
RUN_LOCAL.md
contracts/<team>.openapi.yaml
postman/collections/<team>.postman_collection.json
postman/environments/<team>_local.postman_environment.json
reports/newman-lab04-local.xml
reports/newman-lab04-local.html
ảnh chụp /health hoặc log container
tag image đã push lên registry
```

---

## 12. Rubric gợi ý

| Tiêu chí | Điểm |
|---|---:|
| Dockerfile đúng, build được | 2.0 |
| Container chạy được và `/health` pass | 2.0 |
| Non-root, `.dockerignore`, `.env.example` tốt | 2.0 |
| Newman/Postman test pass trên container | 2.0 |
| RUN_LOCAL.md rõ ràng, người khác chạy lại được | 1.0 |
| Evidence đầy đủ: log/report/image tag | 1.0 |
| **Tổng** | **10.0** |

---

## 13. Tinh thần của buổi học

Sau Buổi 3, nhóm đã chứng minh:

```text
API đúng contract khi kiểm thử bằng Postman/Newman.
```

Sau Buổi 4, nhóm cần chứng minh thêm:

```text
API đó có thể được đóng gói, chạy lại và kiểm thử trong container.
```

Đây là bước đệm trực tiếp cho Buổi 5:

```text
Docker container đơn lẻ → Docker Compose nhiều service → Plug-a-thon.
```
>>>>>>> 6ed72e1b697c7712d522c728ea314dd245012863
