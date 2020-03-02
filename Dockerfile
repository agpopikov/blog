FROM alpine:3.10 as build

ENV HUGO_VER=0.58.3
ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VER}/hugo_${HUGO_VER}_Linux-64bit.tar.gz /tmp/hugo.tar.gz
RUN cd /tmp && tar -zxf hugo.tar.gz && ls -lah && cp hugo /bin/hugo
ADD site /tmp/site
RUN (cd /tmp/site && hugo && ls -lah /tmp/site/public)

FROM abiosoft/caddy:latest

COPY Caddyfile /etc/Caddyfile
COPY --from=build /tmp/site/public /srv/www/site
RUN ls -lah /srv/www/site/
