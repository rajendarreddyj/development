FROM jenkins:2.46.2
MAINTAINER rajendarreddy jagapathi "rajendarreddyj@gmail.com"

# Create Jenkins Log Folder
RUN mkdir /apps/home/jenkins/logs
RUN chown -R jenkins:jenkins /apps/home/jenkins/logs
USER jenkins

# Set default options
ENV JAVA_OPTS="-Xmx1024m"
ENV JENKINS_OPTS="--handlerCountStartup=100 --handlerCountMax=300 --logfile=/apps/home/jenkins/logs/jenkins.log"
