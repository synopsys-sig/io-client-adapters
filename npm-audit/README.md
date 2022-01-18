# NPM Audit Adapter

## Overview

Software Composition Analysis Tool for JavaScript - https://docs.npmjs.com/cli/audit

## Prerequisites

- Node JS
- NPM

## Usage in Pipeline

````
pipeline {
    ...
    tools {
        nodejs 'NodeJS'
    }
    ...
    stages {
        ...
        stage('IO - Execute - SCA - NPM Audit') {
            steps {
                echo 'Download NPM Audit Adapter & Shell Script'
                sh 'curl https://raw.githubusercontent.com/synopsys-sig/io-client-adapters/main/npm-audit/npm-audit-adapter.json --output npm-audit-adapter.json'
                sh 'curl https://raw.githubusercontent.com/synopsys-sig/io-client-adapters/main/npm-audit/npm-audit.sh --output npm-audit.sh'
                synopsysIO() {
                    sh 'io --stage execution --adapters npm-audit-adapter.json --state io_state.json'
                }
            }
        }
    }
    ..
    post {
        always {
            ...
            archiveArtifacts artifacts: 'npm-audit.log', allowEmptyArchive: 'true'
            ...
        }
    }
}
````

## Result/Output

- npm-audit.log