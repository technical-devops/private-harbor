HarborCertificateDir="/app/harbor/certs"
DomainName="192.168.70.68"

if [ -d ${HarborCertificateDir} ]; then

    sudo openssl genrsa -out ${HarborCertificateDir}/${DomainName}.key 2048  && sudo chmod 644 ${HarborCertificateDir}/${DomainName}.key

    if [ -f  ${HarborCertificateDir}/${DomainName}.key ]; then
        echo ">>>> Request Generation Success : ${HarborCertificateDir}/${DomainName}.key"
    else 
        echo ">>>> Request Generation Failed : ${HarborCertificateDir}/${DomainName}.key"
        exit 1
    fi
fi
