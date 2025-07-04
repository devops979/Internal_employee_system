# ---------- Build stage ----------
FROM python:3.12-slim AS builder
 
# System deps
RUN apt-get update && apt-get install -y --no-install-recommends gcc build-essential \
&& rm -rf /var/lib/apt/lists/*
 
# Non-root user for later copy
RUN addgroup --system app && adduser --system --ingroup app app
WORKDIR /app
USER app
 
# Install Python deps separately for cache
COPY --chown=app:app requirements.txt .
RUN pip install --user --no-cache-dir -r requirements.txt
 
# Copy application source
COPY --chown=app:app . .
 
# ---------- Runtime stage ----------
FROM python:3.12-slim
 
ENV PYTHONUNBUFFERED=1
RUN addgroup --system app && adduser --system --ingroup app app
USER app
WORKDIR /app
 
# Copy site-packages and code from builder
COPY --chown=app:app --from=builder /home/app/.local /home/app/.local
COPY --chown=app:app --from=builder /app /app
ENV PATH="/home/app/.local/bin:${PATH}"
 
EXPOSE 5000
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:5000", "app:app"]
