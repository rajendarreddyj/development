maven-cheatsheet
===================

A cheatsheet on the usage of maven.

## Basics
```sh
# To clean project
mvn clean
# To build all the modules, and to install it in the local repository. 
mvn clean install
# To build all the modules, and to install it in the local repository and skip tests. 
mvn clean install -DskipTests
# To analyze the dependencies of this project and determines which are: used and declared; used and undeclared; unused and declared. 
mvn dependency:analyze
```