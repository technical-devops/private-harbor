# harbor offline installed v2.10.1 on ubuntu-22.04LTS

## install flow
- 실행은 harbor-offline-installer 압축을 푼후 harbor 디렉토리 안에서 실행해야 하며, 모든 스크립트는 harbor 디렉토리에 있어야 한다.
### 0) 00_harbor-offlineinstaller-download.sh
harbor offline-installer download version check : https://github.com/goharbor/harbor/releases/

### 1) 01_common-openssl.sh

### 2) 02_general-rsa-keygen.sh

### 3) 03_general-request-gen.sh

### 4) 04_harbor-rsa-keygen.sh

### 5) 05_harbor-reqgen-convert.sh

### 6) 06_harbor-yml-mody.sh

### 7) 07_certi-key-change.sh

### 8) 08_harbor-adminPW.sh

### 9) 09_data-vol-change.sh

### 10) 10_base-harbor-install.sh
