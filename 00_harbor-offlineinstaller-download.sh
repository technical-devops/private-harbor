# harbor offline-installer download
# download version check : https://github.com/goharbor/harbor/releases/

HARBOR_VERSION="v2.10.1"
HARBOR_PKGTGZ="harbor-offline-installer-${HARBOR_VERSION}.tgz"

wget https://github.com/goharbor/harbor/releases/download/${HARBOR_VERSION}/${HARBOR_PKGTGZ}
