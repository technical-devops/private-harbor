HARBOR_CERTS_DIR="/app/harbor/certs"
HARNOR_UI_CONIP="192.168.70.68"

if [ ! -d ${HARBOR_CERTS_DIR} ]; then
    sudo mkdir -p ${HARBOR_CERTS_DIR}
fi

cat << EOF | sudo tee ${HARBOR_CERTS_DIR}/common-openssl.conf
[ req ]
distinguished_name = req_distinguished_name
[req_distinguished_name]

[ v3_ca ]
basicConstraints = critical, CA:TRUE
keyUsage = critical, digitalSignature, keyEncipherment, keyCertSign

[ v3_req_client ]
basicConstraints = CA:FALSE
keyUsage = critical, digitalSignature, keyEncipherment
extendedKeyUsage = clientAuth

[ v3_req_server ]
basicConstraints = CA:FALSE
keyUsage = critical, digitalSignature, keyEncipherment
extendedKeyUsage = serverAuth
subjectAltName = @alt_names_registry

[ alt_names_registry ]
DNS.1 = localhost
DNS.2 = ${HOSTNAME}
IP.1 = 127.0.0.1
IP.2 = ${HARNOR_UI_CONIP}
EOF
