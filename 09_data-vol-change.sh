HarborDataStoreDir="/app/harbor"
HarborInstallConfFile="harbor.yml"


sudo sed  -i 's|data_volume:.*|data_volume: '${HarborDataStoreDir}'|g' ${HarborInstallConfFile}

HarborVolumnDir=$(grep '^data_volume:' ${HarborInstallConfFile} | cut -d':' -f2|tr -d ' ')

if [ "${HarborVolumnDir}" = "${HarborDataStoreDir}" ];then
    echo ">>>> Change Success hostname: ${HarborDataStoreDir}"
else
    echo ">>>> Change Failed hostname: ${HarborDataStoreDir}"
    exit 1
fi
