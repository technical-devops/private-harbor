HARBOR_YML_TMPL="harbor.yml.tmpl"
HARBOR_YML="harbor.yml"
IF_IPADDRESS="192.168.70.68"
HarborInstallConfFile=${HARBOR_YML}

if [ -f ${HARBOR_YML_TMPL} ]; then
    sudo cp -i ${HARBOR_YML_TMPL} ${HARBOR_YML}
    
    if [ -f ${HARBOR_YML} ]; then
        sudo sed -i 's|^hostname:.*|hostname: '${IF_IPADDRESS}'|g' ${HarborInstallConfFile}

        HarborConfHostnameIP=$(grep '^hostname:' ${HarborInstallConfFile} | cut -d':' -f2|tr -d ' ')
        if [ "${IF_IPADDRESS}" = "${HarborConfHostnameIP}" ];then
            echo ">>>> Change Success hostname: ${IF_IPADDRESS}"
        else
            echo ">>>> Change Failed hostname: ${IF_IPADDRESS}"
            exit 1
        fi
    fi
fi
