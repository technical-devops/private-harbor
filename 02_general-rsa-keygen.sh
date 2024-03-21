HarborCertificateDir="/app/harbor/certs"

if [ -d ${HarborCertificateDir} ]; then

    sudo openssl genrsa -out ${HarborCertificateDir}/ca.key 2048  && sudo chmod 644 ${HarborCertificateDir}/ca.key

    if [ -f  ${HarborCertificateDir}/ca.key ]; then
        echo ">>>> RSA Key Generation Success : ${HarborCertificateDir}/ca.key"
    else 
        echo ">>>> RSA Key Generation Failed : ${HarborCertificateDir}/ca.key"
        exit 1
    fi
fi
