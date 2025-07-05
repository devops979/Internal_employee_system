#####################  build stage  #####################
FROM node:20-alpine AS build
WORKDIR /app

# copy manifests ­– lock file included
COPY package*.json ./
RUN npm ci          # ← uses package-lock.json, faster & deterministic

# copy source and build
COPY . .
RUN npm run build   # emits /app/public

#####################  runtime stage  ###################
FROM nginx:1.27-alpine
COPY --from=build /app/public /usr/share/nginx/html
# Replace default Nginx config with custom config
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
