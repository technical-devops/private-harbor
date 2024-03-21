HARBOR_YML_TMPL="harbor.yml.tmpl"
HARBOR_YML="harbor.yml"
DomainName="192.168.70.68"
HarborInstallConfFile=${HARBOR_YML}
HarborCertificateDir="/app/harbor/certs"


for kind in certificate private_key
    do
        if [ "${kind}" = "certificate" ]; then
            sudo sed -i 's|  certificate:.*|  certificate: '${HarborCertificateDir}'/'${DomainName}.crt'|g' ${HarborInstallConfFile}
        else
            sudo sed -i 's|  private_key:.*|  private_key: '${HarborCertificateDir}'/'${DomainName}.key'|g' ${HarborInstallConfFile}
        fi

        CertDir=$(grep "${kind}:"  ${HarborInstallConfFile} | cut -d':' -f2 | tr -d ' ')

        if [ "$(dirname ${CertDir})" = "${HarborCertificateDir}" ]; then
            echo ">>>> Change Success ${kind} Location in ${HarborCertificateDir}"
        else
            echo ">>>> Change Failed ${kind} Location in ${HarborCertificateDir}"
            exit 1
        fi
done
