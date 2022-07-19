pipeline{
    agent any
    
    stages{
        stage('Compile & Unit Test'){
            steps{
                git url: "https://github.com/BharadwajAyinapurapu/Spring-Boot-Hello-World.git"
                sh 'mvn test'
            }
            post{
                always{
                    junit '**/target/surefire-reports/TEST-*.xml'
                }
            }
        }
        
        
        stage('Package'){
            steps{
                sh 'mvn install'
            }
            post{
                success{
                    archiveArtifacts 'target/*.jar'
                }
            }
        }
 
    }
}
