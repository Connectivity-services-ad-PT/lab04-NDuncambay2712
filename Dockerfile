<<<<<<< HEAD
FROM node:20-alpine

# Set working directory
WORKDIR /usr/src/app

# Install curl for healthcheck
RUN apk add --no-cache curl

# Copy dependency definition files
COPY package*.json ./

# Install production dependencies
RUN npm install --legacy-peer-deps --only=production

# Copy application source code
COPY server.js ./
COPY campus-spectral.yaml ./
COPY contracts/ ./contracts/

# Set ownership of the application directory to the non-root 'node' user
RUN chown -R node:node /usr/src/app

# Use the non-root 'node' user
USER node

# Expose port
EXPOSE 8000

# Configure Healthcheck
HEALTHCHECK --interval=15s --timeout=5s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:8000/health || exit 1

# Start the application
CMD ["node", "server.js"]
=======
# syntax=docker/dockerfile:1.7

FROM python:3.11-slim AS builder

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /build

RUN python -m venv /opt/venv

COPY requirements.txt .

RUN /opt/venv/bin/pip install --no-cache-dir --upgrade pip \
    && /opt/venv/bin/pip install --no-cache-dir -r requirements.txt


FROM python:3.11-slim AS runtime

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PATH="/opt/venv/bin:$PATH"
ENV APP_HOST=0.0.0.0
ENV APP_PORT=8000
ENV AUTH_TOKEN=local-dev-token

WORKDIR /app

RUN addgroup --system appgroup \
    && adduser --system --ingroup appgroup --home /app appuser

COPY --from=builder /opt/venv /opt/venv
COPY src/ ./src/

RUN chown -R appuser:appgroup /app

USER appuser

EXPOSE 8000

HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD python -c "import urllib.request; urllib.request.urlopen('http://127.0.0.1:8000/health', timeout=3).read()" || exit 1

CMD ["sh", "-c", "uvicorn iot_app.main:app --app-dir src --host ${APP_HOST} --port ${APP_PORT}"]
>>>>>>> 6ed72e1b697c7712d522c728ea314dd245012863
