FROM nginx:1.19-alpine

RUN mkdir -p /var/www/frontend/

RUN apk add --no-cache certbot openssl

COPY conf.d/* /etc/nginx/conf.d/
COPY nginx_http.conf /etc/nginx/nginx_http.conf
COPY nginx_https.conf /etc/nginx/nginx_https.conf

ADD run.sh .
RUN chmod +x run.sh
CMD ./run.sh
