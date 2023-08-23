#! /bin/bash 
#Author: julia
#Update Server before Jenkins Installation
sudo yum update -y
#Installing Java
sudo yum install java-1.8.0-openjdk-devel
sleep 2

#Enable the Jenkins repository
curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo
#Add the repository to your system
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
#Once the repository is enabled, install the latest stable version of Jenkins by typing:
sudo yum install jenkins
#After the installation process is completed, start the Jenkins service with:
sudo systemctl start jenkins
#To check whether it started successfully run:
systemctl status jenkins
#Finally enable the Jenkins service to start on system boot.
sudo systemctl enable jenkins

#Adjust the Firewall
sleep 2
#If you are installing Jenkins on a remote CentOS server that is protected by a firewall you need to port 8080
sudo firewall-cmd --permanent --zone=public --add-port=8080/tcp
sudo firewall-cmd --reload