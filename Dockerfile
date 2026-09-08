# موقع ثابت: لا خطوة بناء، فالصورة خادم وملفات لا أكثر.
FROM caddy:2-alpine

COPY Caddyfile /etc/caddy/Caddyfile
COPY . /srv

# ملفات الإعداد ليست جزءاً من الموقع، ولا يصح أن تُقدَّم على الويب
RUN rm -f /srv/Caddyfile /srv/Dockerfile /srv/.dockerignore \
 && caddy validate --config /etc/caddy/Caddyfile
