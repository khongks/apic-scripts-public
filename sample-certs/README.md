## Create self-signed private key and public certificate.
openssl req -newkey rsa:2048 -nodes -keyout key.pem -x509 -days 365 -out certificate.pem

## Review the created certificate
openssl x509 -text -noout -in certificate.pem

## Combine your key and certificate in a PKCS#12 (P12) bundle
openssl pkcs12 -inkey key.pem -in certificate.pem -export -out certificate.p12

## Validate your P2 file
openssl pkcs12 -in certificate.p12 -noout -info
