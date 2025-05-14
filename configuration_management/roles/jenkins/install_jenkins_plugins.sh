#!/bin/bash
sudo wget http://localhost:8080/jnlpJars/jenkins-cli.jar -P /var/lib/jenkins/
sudo chown jenkins:jenkins /var/lib/jenkins/jenkins-cli.jar


JENKINS_CLI="/var/lib/jenkins/jenkins-cli.jar"
URL="http://localhost:8080"
ADMIN_PASS=$(sudo cat /var/lib/jenkins/secrets/initialAdminPassword)

install_plugin() {
  java -jar "$JENKINS_CLI" -s "$URL" -auth admin:$ADMIN_PASS install-plugin $1
}

# Plugins required
install_plugin git
install_plugin docker-workflow
install_plugin pipeline
install_plugin ansicolor
install_plugin ssh-slaves

sudo systemctl restart jenkins
