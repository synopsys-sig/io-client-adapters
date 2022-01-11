#!/bin/bash

rm dependency-check.zip
rm -rf dependency-check-6.5.2-release

curl -L https://github.com/jeremylong/DependencyCheck/releases/download/v6.5.2/dependency-check-6.5.2-release.zip > dependency-check.zip
unzip dependency-check.zip

./dependency-check/bin/dependency-check.sh --format HTML --out . --scan ./target/**/*.jar
