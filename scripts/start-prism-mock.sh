<<<<<<< HEAD
#!/bin/bash
npx prism mock contracts/notification.openapi.yaml --port 4010
=======
#!/usr/bin/env bash
set -euo pipefail

npx prism mock contracts/iot-ingestion.openapi.yaml --host 0.0.0.0 --port 4010
>>>>>>> 6ed72e1b697c7712d522c728ea314dd245012863
