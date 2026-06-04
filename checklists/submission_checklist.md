<<<<<<< HEAD
# Submission Checklist - Lab 03

Before submitting Lab 03, the team must check off the following deliverables:

## 1. Contracts & Specs
- [x] OpenAPI contract is placed in `contracts/notification.openapi.yaml`.
- [x] Version declared is exactly `openapi: 3.1.0`.
- [x] No `nullable: true` properties are used (union types with `null` used instead).
- [x] Passes Spectral lint check with 0 errors.

## 2. Postman Test Suite
- [x] Collection exists at `postman/collections/FIT4110_lab03_notification.postman_collection.json`.
- [x] Collection is structured into exactly 6 folders (`01_Functional` to `06_Local_only_NonFunctional`).
- [x] Environment files exist at `postman/environments/FIT4110_lab03_mock.postman_environment.json` and `FIT4110_lab03_local.postman_environment.json`.
- [x] No URLs or security tokens are hardcoded (baseUrl/token environment variables used instead).
- [x] Test assertions check for RFC 9457 `Problem Details` format on error codes (400, 401, 403, 404, 409, 422).
- [x] SLA assertions checking response times < 200ms only run against local environment.

## 3. Local Implementation (Express Server)
- [x] Local Express server exists at `server.js` and runs on port 3000.
- [x] Enforces Bearer authentication check.
- [x] Validates inputs (UUID structures, required fields) and returns 400.
- [x] Performs duplicate check on `eventId` returning 409 (idempotency).
- [x] Rejects future `occurredAt` dates with 422.
- [x] Implements Base64 cursor-based pagination.

## 4. Reports & Scripts
- [x] Newman runs generate HTML and XML reports in `reports/` folder.
- [x] Linter generates `reports/spectral-lint.log`.
- [x] Makefile provides targets: `install`, `lint`, `mock`, `server`, `test`, `clean`.
- [x] Action runners run successfully in GitHub actions via `.github/workflows/newman.yml`.
=======
# Submission Checklist – Lab 04

Nộp các minh chứng sau:

- [ ] `Dockerfile`
- [ ] `.dockerignore`
- [ ] `.env.example`
- [ ] `RUN_LOCAL.md`
- [ ] Contract OpenAPI đã dùng
- [ ] Postman Collection đã chạy trên container
- [ ] Postman Environment local/docker
- [ ] Newman report XML/HTML
- [ ] Log hoặc ảnh `docker build`
- [ ] Log hoặc ảnh `docker run`
- [ ] Log hoặc ảnh `GET /health`
- [ ] Link hoặc tên image tag đã push
>>>>>>> 6ed72e1b697c7712d522c728ea314dd245012863
