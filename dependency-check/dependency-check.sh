#!/bin/bash

echo 'Dependency-Check Runner'
echo '(Prerequisites: curl, unzip, mvn, jdk)'

DependencyCheckURL="https://github.com/jeremylong/DependencyCheck/releases/download/v6.5.3/dependency-check-6.5.3-release.zip"
DependencyCheckZIP='dependency-check-6.5.3-release.zip'
DependencyCheckFile='dependency-check.zip'

if [ -f "$DependencyCheckFile" ]; then
    echo "$DependencyCheckFile exists."
else
    echo "$DependencyCheckFile does not exist. Downloading: ${DependencyCheckURL}"
    curl -L $DependencyCheckURL > $DependencyCheckFile.zip
    unzip $DependencyCheckFile.zip
fi

echo 'Packaging Application for Dependency-Check'
mvn clean package

echo "Running DependencyCheck: ${DependencyCheckZIP}"
./dependency-check/bin/dependency-check.sh --format HTML --out . --scan ./target/
