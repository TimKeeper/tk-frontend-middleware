FROM swr.cn-north-4.myhuaweicloud.com/lstack-common/node:18.20.4-alpine3.19 AS builder

WORKDIR /app
RUN npm install -g pnpm --registry=https://registry.npmmirror.com
COPY . /app
RUN pnpm install --frozen-lockfile
RUN pnpm build

FROM swr.cn-north-4.myhuaweicloud.com/lstack-common/nginx:stable-alpine AS server

COPY --from=builder /app/packages/docs/ui-site/dist/site/ /var/www/html/
COPY --from=builder /app/nginx.conf /etc/nginx/
EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]


