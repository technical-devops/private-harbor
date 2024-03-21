HarborAdminPassword='bizarch!@#123'
HarborInstallConfFile="harbor.yml"


sudo sed  -i 's|harbor_admin_password:.*|harbor_admin_password: '${HarborAdminPassword}'|g' ${HarborInstallConfFile}

HarborAdminPW="$(grep '^harbor_admin_password:' ${HarborInstallConfFile} | cut -d':' -f2|tr -d ' ')"

if [ "${HarborAdminPW}" = "${HarborAdminPassword}" ];then
    echo ">>>> Change Success harbor admin password: ${HarborAdminPassword}"
else
    echo ">>>> Change Failed harbor admin password: ${HarborAdminPassword}"
    exit 1
fi
