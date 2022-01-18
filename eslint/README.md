# ESLint Adapter

## Overview

Static Application Security Test Tool for JavaScript - https://eslint.org/

## Prerequisites

- Node JS
- NPM

## Usage in Pipeline

````
pipeline {
    ...
    stages {
        ...
        stage('IO - Execute - SAST - ESLint') {
            steps {
                echo 'Download ESLint Adapter & Shell Script'
                sh 'curl https://raw.githubusercontent.com/synopsys-sig/io-client-adapters/main/eslint/eslint-adapter.json --output eslint-adapter.json'
                sh 'curl https://raw.githubusercontent.com/synopsys-sig/io-client-adapters/main/eslint/eslint-adapter.json --output eslint-adapter.json'
                sh 'curl https://raw.githubusercontent.com/synopsys-sig/io-client-adapters/main/eslint/eslintrc.json --output .eslintrc.json'
                sh 'curl https://raw.githubusercontent.com/synopsys-sig/io-client-adapters/main/eslint/eslint.sh --output eslint.sh'
                synopsysIO() {
                    sh 'io --stage execution --adapters eslint-adapter.json --state io_state.json' }
            }
        }
    }
    ..
    post {
        always {
            ...
            archiveArtifacts artifacts: 'npm-eslint.log', allowEmptyArchive: 'true'
            ...
        }
    }
}
````

## Result/Output

- npm-eslint.log