#!/bin/bash

# http://sdkman.io/

echo "sdkman Starting installation"

echo "Installing curl dependency"
sudo apt install -y curl

echo "Intalling sdkman"
# Install sdkman
curl -s http://get.sdkman.io | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

echo "sdkman Installation Done"

echo "Intalling gradle/ant/maven/scala/kotlin/grails/springboot/jbossforge"
# Install sdk Components
sdk version
sdk install gradle
sdk install ant
sdk install maven
sdk install scala
sdk install kotlin
sdk install groovy
sdk install grails
sdk install springboot
sdk install jbossforge
echo "gradle/ant/maven/scala/kotlin/grails/springboot/jbossforge Installation done"
