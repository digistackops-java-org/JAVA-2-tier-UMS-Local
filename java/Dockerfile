FROM tomcat:10.1-jdk17-temurin
ARG WAR_FILE
COPY ${WAR_FILE} /usr/local/tomcat/webapps/ROOT.war


To build

docker build -t myapp:build-342 --build-arg WAR_FILE=target/SSO-1.0-SNAPSHOT.war .