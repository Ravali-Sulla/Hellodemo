pipeline { 
    
    

    environment { 

        registry = "ravalis123/demo" 

        registryCredential = 'dockerhub_id' 

        dockerImage = '' 

    }
     agent any

    stages { 

        stage('Cloning our Git') { 

            steps { 

                git branch: 'main', credentialsId: 'gitcred', url: 'https://github.com/Ravali-Sulla/Hellodemo.git'

            }

        } 
        stage('Building our image') { 

            steps { 

                script { 

                    dockerImage = docker.build registry + ":$BUILD_NUMBER" 

                }

            } 

        }

        stage('Deploy our image') { 

            steps { 

                script { 

                    docker.withRegistry( '', registryCredential ) { 

                        dockerImage.push() 

                    }

                } 

            }

        } 
        stage('puling our image and running as a container') { 

            steps { 

                script { 
                 
		    def image

		    docker.withRegistry( '', registryCredential ) { 


                    image = docker.image('ravalis123/demo:$BUILD_NUMBER')

		    image.pull()
		
		    sh 'docker run  ravalis123/demo:$BUILD_NUMBER'

                }

            } 

        }
	
	}
       

        stage('Cleaning up') { 

            steps { 

                sh "docker rmi $registry:$BUILD_NUMBER" 

            }

        } 

    }

}
