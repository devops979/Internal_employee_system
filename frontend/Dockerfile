# ---------- Build stage ----------
FROM node:20-alpine AS builder
 
# Set working dir, add non-root user
WORKDIR /app
RUN addgroup -S app && adduser -S app -G app
USER app
 
# Copy package.json/yarn.lock (or package-lock.json) first for cache
COPY --chown=app:app package*.json ./
RUN npm install
 
# Copy source and build
COPY --chown=app:app . .
RUN npm run build          # produces /app/public/bundle.js (via Webpack) or /app/build
 
# ---------- Runtime stage ----------
FROM nginx:1.27-alpine AS runtime
 
# Non-root user (NGINX runs as 101 in alpine), but we’ll still change ownership
RUN addgroup -S app && adduser -S app -G app
USER app
 
# Copy compiled static assets into nginx html dir
COPY --from=builder /app/public /usr/share/nginx/html
 
# Expose port 3000 to align with K8s manifest
EXPOSE 3000
# Overwrite default nginx config to listen on 3000
RUN \
  sed -i 's/80 default_server;/3000 default_server;/g' /etc/nginx/conf.d/default.conf && \
  sed -i 's/80;/3000;/g' /etc/nginx/conf.d/default.conf
 
CMD ["nginx", "-g", "daemon off;"]
