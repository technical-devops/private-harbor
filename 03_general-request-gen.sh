HarborCertificateDir="/app/harbor/certs"
HarborCertPeriod=3650
DomainName="192.168.70.68"

if [ -d ${HarborCertificateDir} ]; then
    sudo openssl req \
         -x509 \
         -new \
         -nodes \
         -key ${HarborCertificateDir}/ca.key \
         -days ${HarborCertPeriod} \
         -out ${HarborCertificateDir}/ca.crt \
         -subj "/CN=${DomainName}" \
         -extensions v3_ca \
         -config ${HarborCertificateDir}/common-openssl.conf

    if [ -f  ${HarborCertificateDir}/ca.crt ]; then
        echo ">>>> Request Generation Success : ${HarborCertificateDir}/ca.crt"
    else
        echo ">>>> Request Generation Failed : ${HarborCertificateDir}/ca.crt"
        exit 1
    fi
fi
