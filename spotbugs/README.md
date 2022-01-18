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
    ...
    tools {
        maven 'Maven3'
    }
    ...
    stages {
        ...
        stage('IO - Execute - SAST - SpotBugs') {
            steps {
                echo 'Download SpotBugs Adapter & Shell Script'
                sh 'curl https://raw.githubusercontent.com/synopsys-sig/io-client-adapters/main/spotbugs/spotbugs-adapter.json --output spotbugs-adapter.json'
                sh 'curl https://raw.githubusercontent.com/synopsys-sig/io-client-adapters/main/spotbugs/spotbugs.sh --output spotbugs.sh'
                synopsysIO() {
                    sh 'io --stage execution --adapters spotbugs-adapter.json --state io_state.json'
                }
            }
        }
    }
    ..
    post {
        always {
            ...
            archiveArtifacts artifacts: 'spotbugs-report.html', allowEmptyArchive: 'true'
            ...
        }
    }
}
````

## Result/Output

- spotbugs-report.html