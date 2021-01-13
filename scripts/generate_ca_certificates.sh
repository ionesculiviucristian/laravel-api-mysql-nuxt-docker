#!/bin/bash
mkdir ../ca-certificates

cd ../ca-certificates

######################
# Become a Certificate Authority
######################

# Generate private key
openssl genrsa \
  -des3 \
  -out appCA.key \
  -passout pass:password \
  2048

# Generate root certificate
openssl req \
  -x509 \
  -new \
  -nodes \
  -key appCA.key \
  -passin pass:password \
  -sha256 \
  -days 825 \
  -subj '/C=RO/ST=Brasov/L=Brasov/CN=www.app.com' \
  -out appCA.pem

######################
# Create CA-signed certs
######################

# Generate a private key
openssl genrsa -out app.com.key 2048

# Create a certificate-signing request
openssl req \
  -new \
  -key app.com.key \
  -subj '/C=RO/ST=Brasov/L=Brasov/CN=www.app.com' \
  -out app.com.csr

# Create a config file for the extensions
>app.com.ext cat <<-EOF
authorityKeyIdentifier = keyid, issuer
basicConstraints = CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName = @alt_names
[alt_names]
DNS.1 = app.com
DNS.2 = api.app.com
EOF

# Create the signed certificate
openssl x509 \
  -req \
  -in app.com.csr \
  -CA appCA.pem \
  -CAkey appCA.key \
  -passin pass:password \
  -CAcreateserial \
  -out app.com.crt \
  -days 825 \
  -sha256 \
  -extfile app.com.ext
