# spec/ssl
If you like, you can build an entire mock puppet CA in this directory and puppet
will use it as part of its run.

You can choose to commit the files to git so that you only have to generate them
once. If you do so, be sure to never use these files for anything other then
logical testing as uploading to git would of-course compromise the secrecy of 
the key.

This can be useful for testing out trusted facts, etc.

Puppet CAs are now managed using the puppetserver package which may not be
installable in your development environment. In this case, you can use `openssl`
to create the CA and sign the certificates.

## Creating puppet certificates using OpenSSL

* All commands should be run from `spec/ssl`
* Any trusted attributes need to be set at the correct OID manually while
  preparing CSR

### Creating a CA
```shell
openssl req -new -x509 -keyout ca/ca_key.pem -out ca/ca_crt.pem -days 3650 -nodes
```
* Create a CA with 10 year validity

### Creating a node
```shell
openssl genrsa -out private_keys/fake.fake.pem 1024
openssl req -new -key private_keys/fake.fake.pem -out fake.fake.csr

openssl x509 -days 3650 -req -in fake.fake.csr -CA ca/ca_crt.pem -CAkey ca/ca_key.pem -set_serial 1 -out certs/fake.fake.pem
rm fake.fake.csr
```

* Creates a node `fake.fake`
* 10 year validity