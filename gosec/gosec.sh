#!/bin/bash

echo 'GoSec Runner'

GoURL="https://go.dev/dl/go1.17.6.linux-amd64.tar.gz"
GoSecURL='https://raw.githubusercontent.com/securego/gosec/master/install.sh'
GoSecTAR='go1.17.6.linux-amd64.tar.gz'

# Setup Go
if [ -f "$GoTAR" ]; then
    echo "$GoTAR exists."
else
    echo "$GoTAR does not exist. Downloading: ${GoURL}"
    curl -O $GoURL
    tar -xzvf- $GoTAR
    mv go /tmp/
    export PATH=$PATH:/tmp/go/bin:$GOPATH/bin
fi

# Download GoSec
echo 'Installing GoSec:'
curl -sfL $GoSecURL | sh -s latest

echo 'Running GoSec:'
./bin/gosec -exclude-dir=go -fmt=json -out=gosec-results.json ./...
