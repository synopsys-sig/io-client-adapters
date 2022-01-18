# Dependency-Check Adapter

## Overview

Software Composition Analysis Tool for Java - https://jeremylong.github.io/DependencyCheck/

## Prerequisites

- cURL
- unzip
- JDK
- Maven

## Usage in Pipeline

````
pipeline {
    ...
    stages {
        ...
        stage('SCA - Dependency-Check') {
            steps {
                echo 'Running SCA using DependencyCheck'
                sh 'curl https://raw.githubusercontent.com/synopsys-sig/io-client-adapters/main/dependency-check/dependency-check-adapter.json --output dependency-check-adapter.json'
                sh 'curl https://raw.githubusercontent.com/synopsys-sig/io-client-adapters/main/dependency-check/dependency-check.sh --output dependency-check.sh'
                synopsysIO() {
                    sh 'io --stage execution --adapters dependency-check-adapter.json --state io_state.json'
                }
            }
        }
    }
    ...
    post {
        always {
            ...
            archiveArtifacts artifacts: 'dependency-check-report.html', allowEmptyArchive: 'true'
            ...
        }
    }
}
````

## Result/Output

- dependency-check-report.htm