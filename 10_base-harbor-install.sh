HarborInstallDir=${PWS}
HarborLogDir="/app/harbor/log"
echo "===> 11. Harbor Base Install"
echo "#############################"

if [ ! -d ${HarborLogDir} ]; then
    sudo  mkdir -p ${HarborLogDir}
fi

sudo ${HarborInstallDir}/install.sh --with-trivy | sudo tee ${HarborLogDir}/harbor-install.log
