#!/bin/bash

# Create a directory for the certificates
mkdir -p /etc/ssl/private
mkdir -p /etc/ssl/certs

# Generate a private key
openssl genpkey -algorithm RSA -out /etc/ssl/private/private.key

# Create a certificate signing request (CSR) with personal information
openssl req -new -key /etc/ssl/private/private.key -out /etc/ssl/certs/certificat.csr -subj "/C=AU/ST=Vienna/L=Vienna/O=42Vienna/OU=42vienna/CN=$NGINX_DOMAIN/emailAddress=amalkhal@gmail.com"

# Generate the self-signed certificate
openssl x509 -req -days 365 -in /etc/ssl/certs/certificat.csr -signkey /etc/ssl/private/private.key -out /etc/ssl/certs/certificate.crt

# Start nginx
nginx -g "daemon off;"