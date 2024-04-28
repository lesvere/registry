# local deploy registry with ssl on lima.

## create machine
```shell
limactl start --name worker --cpus 1 --memory 1 --network lima:kubernetes template://debian
```
`network depends on your local setting: ~/.lima/_config/networks.yaml`

## source lima vm env
```shell
export export LIMA_INSTANCE=registry
```

## clone code
```shell
git clone git@github.com:lesvere/registry.git
cd registry
```

### 4.generate ssl
```shell
cat <<EOF | sudo tee openresty/certificates/openssl.cnf
[ req ]
default_bits        = 2048
default_keyfile     = privkey.pem
distinguished_name  = req_distinguished_name
req_extensions      = req_ext
x509_extensions     = v3_req
prompt              = no

[ req_distinguished_name ]
countryName         = US
stateOrProvinceName = CA
localityName        = San
organizationName    = Registry.local
organizationalUnitName = Registry.local
commonName          = registry.local

[ req_ext ]
subjectAltName      = @alt_names

[ v3_req ]
subjectAltName      = @alt_names

[ alt_names ]
DNS.1   = registry.local
EOF
```
```shell
openssl genrsa -out certificate.key 1024
openssl req -new -key certificate.key -out certificate.csr
openssl x509 -req -in certificate.csr -out certificate.crt -signkey certificate.key -days 3650
```

## limactl shell registry
```shell
ln /{PROJECT DIR}/certificates/registry.local/certificate.crt /opt/registry/certs/private.crt；

cat <<EOF | sudo tee /etc/containerd/config.toml
[plugins."io.containerd.grpc.v1.cri".registry.configs."registry.local:443".tls]
  ca_file = "/etc/ssl/certs/registry.local.crt"
EOF
```

## start service
```shell
lima nerdctl compose up -d 
```
`exit from vm, dir in project`