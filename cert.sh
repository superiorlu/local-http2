#!/usr/bin/env bash

# gen root ca
openssl genrsa -out certs/rootCA.key 2048
openssl req -x509 -new -nodes -key certs/rootCA.key -sha256 -days 1024 -out certs/rootCA.pem -config certs/conf/server.csr.cnf

# gen self signed
openssl req -new -sha256 -nodes -out certs/server.csr -newkey rsa:2048 -keyout certs/server.key -config certs/conf/server.csr.cnf
openssl x509 -req -in certs/server.csr -CA certs/rootCA.pem -CAkey certs/rootCA.key -CAcreateserial -out certs/server.crt -days 600 -sha256 -extfile certs/conf/v3.ext