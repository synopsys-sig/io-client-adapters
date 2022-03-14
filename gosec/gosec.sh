#!/bin/bash

echo 'GoSec Runner'

GoSecURL='https://raw.githubusercontent.com/securego/gosec/master/install.sh'

echo 'Installing GoSec:'
curl -sfL $GoSecURL | sh -s latest

echo 'Running GoSec:'
./bin/gosec -exclude-dir=go -fmt=json -out=gosec-results.json ./...
