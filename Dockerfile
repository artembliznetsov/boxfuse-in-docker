FROM ubuntu:16.04

EXPOSE 8080/tcp

RUN apt update && \
  apt install -y git default-jdk tomcat8 maven && \
  git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello && \
  cd boxfuse-sample-java-war-hello && \
  mvn package && \
  mv target/hello-1.0.war /var/lib/tomcat8/webapps/
 
 
ENV CATALINA_BASE /var/lib/tomcat8/


CMD ["/usr/share/tomcat8/bin/catalina.sh", "run"]