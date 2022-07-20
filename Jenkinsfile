pipeline{
    agent any
    
    environment{
    	ARTIFACTORY_ACCESS_TOKEN = credentials('artifactory-access-token')
    }
    
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
 	
 	stage('Publish to JFrog'){
 		steps{
 			sh 'jf rt u --url http://192.168.56.102:8082/artifactory/ --access-token ${ARTIFACTORY_ACCESS_TOKEN} target/SpringBootHelloWorld-*.jar Spring-Boot-Project'
 		}	
 	}
    }
}
