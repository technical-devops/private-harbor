HarborCertificateDir="/app/harbor/certs"
HarborCertPeriod=3650
DomainName="192.168.70.68"

if [ -d ${HarborCertificateDir} ]; then
    sudo openssl req \
         -new \
         -subj "/CN=${DomainName}" \
         -key ${HarborCertificateDir}/${DomainName}.key \
         -out ${HarborCertificateDir}/${DomainName}.csr

     if [ -f  ${HarborCertificateDir}//${DomainName}.csr ]; then
        echo ">>>> Genernal a Certifitate signing request Success : ${HarborCertificateDir}/${DomainName}.csr"
     else
        echo ">>>> Genernal a Certifitate signing request Failed : ${HarborCertificateDir}/${DomainName}.csr"
        exit 1
     fi
     sleep 1

     if [ -f ${HarborCertificateDir}/${DomainName}.csr ]; then
         sudo openssl x509 -req \
              -days ${HarborCertPeriod} \
              -CA ${HarborCertificateDir}/ca.crt \
              -CAkey ${HarborCertificateDir}/ca.key \
              -CAcreateserial \
              -extensions v3_req_server \
              -in ${HarborCertificateDir}/${DomainName}.csr \
              -out ${HarborCertificateDir}/${DomainName}.crt \
              -extfile ${HarborCertificateDir}/common-openssl.conf
     fi

     if [ -f  ${HarborCertificateDir}//${DomainName}.crt ]; then
        echo ">>>> Replace the yourdomain.com in the CRS and CRT file names Success : ${HarborCertificateDir}/${DomainName}.crt"
     else
        echo ">>>> Replace the yourdomain.com in the CRS and CRT file names Failed : ${HarborCertificateDir}/${DomainName}.crt"
        exit 1
     fi
fi

# Convert crt to cert and copy
# Convert yourdomain.com.crt to yourdomain.com.cert, for use by Docker.
if [ -f ${HarborCertificateDir}/${DomainName}.crt ]; then
    sudo  openssl  x509  -inform  PEM  -in  ${HarborCertificateDir}/${DomainName}.crt  -out  ${HarborCertificateDir}/${DomainName}.cert

    if [ ! -d /etc/docker/certs.d/${DomainName}/ ]; then
	sudo mkdir -p /etc/docker/certs.d/${DomainName}/
    fi

    if [ -f  ${HarborCertificateDir}/${DomainName}.cert ]; then
        sudo cp ${HarborCertificateDir}/${DomainName}.key  /etc/docker/certs.d/${DomainName}/
        sudo cp ${HarborCertificateDir}/${DomainName}.cert /etc/docker/certs.d/${DomainName}/
        sudo cp ${HarborCertificateDir}/ca.crt             /etc/docker/certs.d/${DomainName}/
    fi
    
    echo "-----------------------------------------------"
    ls -al /etc/docker/certs.d/${DomainName}/
    echo "-----------------------------------------------"
fi 
