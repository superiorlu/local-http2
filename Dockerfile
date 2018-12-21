FROM nginx:alpine

RUN mkdir -pv /etc/nginx/certs
RUN apk add py-urllib3 openssl curl --no-cache \
  && rm -rf /var/cache/apk/*

COPY conf.d/* /etc/nginx/conf.d/
COPY certs/server.crt certs/server.key /etc/nginx/certs/

EXPOSE 443
EXPOSE 80
