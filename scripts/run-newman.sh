#!/bin/bash

# Create reports directory
mkdir -p reports

echo "=== Running Postman tests against Prism Mock Server ==="
npx newman run postman/collections/FIT4110_lab03_notification.postman_collection.json \
  -e postman/environments/FIT4110_lab03_mock.postman_environment.json \
  -r cli,html,junit \
  --reporter-html-export reports/newman-mock-report.html \
  --reporter-junit-export reports/newman-mock-report.xml

echo "=== Running Postman tests against Local Express Server ==="
npx newman run postman/collections/FIT4110_lab03_notification.postman_collection.json \
  -e postman/environments/FIT4110_lab03_local.postman_environment.json \
  -r cli,html,junit \
  --reporter-html-export reports/newman-local-report.html \
  --reporter-junit-export reports/newman-local-report.xml

echo "=== Newman runs completed ==="
