@Library('jenkins-shared-library') _  

pipeline {
    agent { label "vinod" }

    options {
        timestamps()
        disableConcurrentBuilds()
    }

    environment {
        DB_FILE = "db.sqlite3"
        DRIVE_FILE_ID = "18tyowDNglRWU1SECs-36952r0hp7pOBs"
        IMAGE_NAME = "odlrs-backend"
    }

    stages {

        stage("Clone Code") {
            steps {
                cloneRepo("https://github.com/vedanshpandey166/ODLRS-Docker.git", "main")
            }
        }

        stage("Download DB file (if missing)") {
            steps {
                sh '''
                if [ ! -f "$DB_FILE" ]; then
                    echo "Downloading DB file..."
                    gdown --id "$DRIVE_FILE_ID" -O "$DB_FILE"
                else
                    echo "DB already exists."
                fi
                '''
            }
        }

        stage("Build Docker Image") {
            steps {
                buildDocker(env.IMAGE_NAME)
            }
        }

        stage("Push to DockerHub") {
            steps {
                pushDocker(env.IMAGE_NAME, 'DockerHubCred')
            }
        }

        stage("Deploy with Docker Compose") {
            steps {
                deployDocker()
            }
        }
    }

    post {
        success {
            echo "Pipeline executed successfully."
        }

        failure {
            echo "Pipeline failed."
        }

        always {
            sh '''
                docker image prune -f
                docker builder prune -f
            '''
        }
    }
}
