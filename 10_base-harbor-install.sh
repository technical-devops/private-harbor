HarborInstallDir=${PWS}
HarborLogDir="/app/harbor/log"

if [ ! -d ${HarborLogDir} ]; then
    sudo  mkdir -p ${HarborLogDir}
fi

sudo ${HarborInstallDir}/install.sh --with-trivy | sudo tee ${HarborLogDir}/harbor-install.log
