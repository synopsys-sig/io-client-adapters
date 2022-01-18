#!/bin/bash

echo 'SpotBugs Runner'
echo '(Prerequisites: curl, unzip, jdk)'

SpotBugsURL="https://github.com/spotbugs/spotbugs/releases/download/4.5.3/spotbugs-4.5.3.zip"
SpotBugsZIP='spotbugs-4.5.3.zip'
SpotBugsFile='spotbugs.zip'

if [ -f "$SpotBugsFile" ]; then
    echo "$SpotBugsFile exists."
else
    echo "$SpotBugsFile does not exist. Downloading: ${SpotBugsURL}"
    curl -L $SpotBugsURL > $SpotBugsFile
    unzip $SpotBugsFile
fi

echo "Running SpotBugs: ${SpotBugsZIP}"
java -jar ./spotbugs-4.5.3/lib/spotbugs.jar -textui -html=spotbugs-report.html .
