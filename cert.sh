#!/usr/bin/env bash

# gen root ca
openssl genrsa -aes256 -out certs/root/rootCA.key 4096
openssl req -x509 -new -nodes -key certs/root/rootCA.key -sha256 -days 1024 -out certs/root/rootCA.pem

# gen self signed
openssl req -new -sha256 -nodes -out certs/server.csr -newkey rsa:2048 -keyout certs/server.key -config certs/conf/server.csr.cnf
openssl x509 -req -in certs/server.csr -CA certs/root/rootCA.pem -CAkey certs/root/rootCA.key -CAcreateserial -out certs/server.crt -days 600 -sha256 -extfile certs/conf/v3.ext