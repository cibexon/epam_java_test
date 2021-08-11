pipeline {
 	agent { label 'ubuntu_node1' } 
 	stages {

   		stage('Build images from git repo') {
     			steps {
      				git 'https://github.com/cibexon/epam_java_test'
				//git([url: 'https://github.com/ismailyenigul/hacicenkins.git', branch: 'master', credentialsId: 'ismailyenigul-github-user-token'])   or this way, specify branch and connect
      			  script {
                    		def customImage = docker.build("cibexon/jenkins_docker_pull:v1")
				def customImage1 = docker.build("cibexon/jenkins_docker_pull:v2")
                    		customImage.push('v1')
				customImage1.push('v2')
			  }
			}
		}

		stage('Stop and remove all containers and images') {
			steps {
				sh '''
				cont=$(docker container ps -a | grep -i java | cut -d" " -f1)
				if [ -n "$cont"]
				then
				docker rmi -f $(docker images -a -q) > /dev/null 2>&1 && 
				echo "All images are successfully removed from the Node1"
				else 
				docker container stop $cont;docker container rm $cont;docker rmi -f $(docker images -a -q) > /dev/null 2>&1 && 
				echo "Stopped and removed all images from the Node1"
				fi
				'''
			}	   
		}
 

 	// triggers { githubPush()	//pollSCM('') or this one, empty quotes tells it to build on a push }
 	      		  
	}
}
