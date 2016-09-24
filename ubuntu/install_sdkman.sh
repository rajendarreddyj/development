#!/bin/bash

# http://sdkman.io/

# Install sdkman
curl -s http://get.sdkman.io | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

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
