# GoSec Adapter

## Overview

Static Application Security Test Tool for Go - https://github.com/securego/gosec

## Prerequisites

- cURL
- tar

## Usage in Pipeline

````
pipeline {
    ...
    stages {
        ...
        stage('IO - Execute - SAST - GoSec') {
            steps {
                echo 'Download GoSec Adapter & Shell Script'
                sh 'curl https://raw.githubusercontent.com/synopsys-sig/io-client-adapters/main/gosec/gosec-adapter.json --output gosec-adapter.json'
                sh 'curl https://raw.githubusercontent.com/synopsys-sig/io-client-adapters/main/gosec/gosec.sh --output gosec.sh'
                synopsysIO() {
                    sh 'io --stage execution --adapters gosec-adapter.json --state io_state.json'
                }
            }
        }
    }
    ..
    post {
        always {
            ...
            archiveArtifacts artifacts: 'gosec-results.json', allowEmptyArchive: 'true'
            ...
        }
    }
}
````

## Result/Output

- gosec-results.json