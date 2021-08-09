pipeline {
    agent { 
	  label 'ubuntu_node1' 
 	stages {

   		stage('get git repo') {
     			steps {

      				git 'https://github.com/cibexon/epam_java_test'

      			  script {
                    		def customImage = docker.build("cibexon/jenkins_docker_pull")
                    		customImage.push() 	
	
 

 	triggers {
        	githubPush()
        	//pollSCM('') or this one, empty quotes tells it to build on a push
 	}
 	      		  }
	    		} 
		}
      
	}
    }
}
