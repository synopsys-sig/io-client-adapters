# SpotBugs Adapter

## Overview

Static Application Security Test Tool for Java - https://spotbugs.github.io/

## Prerequisites

- cURL
- unzip
- JDK

## Usage in Pipeline

````
pipeline {
    agent any
    stages {
        ...
        stage('IO - Execute - SAST - SpotBugs') {
            steps {
                echo 'Download SpotBugs Adapter & Shell Script'
                sh "curl https://raw.githubusercontent.com/synopsys-sig/io-client-adapters/main/spotbugs/spotbugs-adapter.json --output spotbugs-adapter.json"
                sh "curl https://raw.githubusercontent.com/synopsys-sig/io-client-adapters/main/spotbugs/spotbugs.sh --output spotbugs.sh"
                synopsysIO() {
                    sh 'io --stage execution --adapters spotbugs-adapter.json --state io_state.json'
                }
            }
        }
        ...
        post {
            always {
                // Archive Results & Logs
                archiveArtifacts artifacts: '**/*-results*.json', allowEmptyArchive: 'true'
                archiveArtifacts artifacts: '.io/**', allowEmptyArchive: 'true'
                archiveArtifacts artifacts: 'spotbugs-report.html', allowEmptyArchive: 'true'

                // Remove the state json file it has sensitive information
                sh 'rm io_state.json'
            }
        }
    }
}
````

## Result/Output

- spotbugs-report.html