#!/bin/sh

if [ "${PD_HTTPS}" = "true" ]; then
    # Keep desired configuration
    mv /etc/nginx/nginx_https.conf /etc/nginx/nginx.conf
    rm /etc/nginx/nginx_https.conf

    if [ "${PD_DOMAIN}" = "none" ]; then
        echo "Start application with self-signed certificates"

        # Generate self-signed certificate
        openssl req -x509 -newkey rsa:4096 -keyout /etc/ssl/private/key.pem -out /etc/ssl/certs/cert.pem -days 365 -nodes -sha256 -subj '/CN=none'

        # Start Nginx
        nginx -g "daemon off;"
    else
        echo "Start application with CA signed certificates"

        # TODO Generate certificate using cerbot and add automatic renewal
        echo "Not implemented"
    fi
elif [ "${PD_HTTPS}" = "false" ]; then
    # Keep desired configuration
    mv /etc/nginx/nginx_http.conf /etc/nginx/nginx.conf
    rm /etc/nginx/nginx_https.conf

    # Start Nginx
    nginx -g "daemon off;"
else
    echo "The environment variable PD_HTTPS must be true or false"
fi
