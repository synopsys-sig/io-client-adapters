#!/bin/bash

java -jar ./spotbugs-4.5.3/lib/spotbugs.jar -textui -html=report.html .

rm spotbugs-4.5.3.zip
rm -rf spotbugs-4.5.3

curl -L https://github.com/spotbugs/spotbugs/releases/download/4.5.3/spotbugs-4.5.3.zip > spotbugs.zip
unzip spotbugs.zip

java -jar ./spotbugs-4.5.3/lib/spotbugs.jar -textui -html=spotbugs-report.html   .
