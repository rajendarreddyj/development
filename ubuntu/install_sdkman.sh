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
sdk install gradle < /dev/null
sdk install ant < /dev/null
sdk install maven < /dev/null
sdk install scala < /dev/null
sdk install kotlin < /dev/null
sdk install groovy < /dev/null
sdk install grails < /dev/null
sdk install springboot < /dev/null
sdk install jbossforge < /dev/null
echo "gradle/ant/maven/scala/kotlin/grails/springboot/jbossforge Installation done"
