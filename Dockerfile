FROM openjdk:17
EXPOSE 8080
ADD target/devops-integration-final.jar devops-integration-final.jar
ENTRYPOINT ["java","-jar", "/devops-integration-final.jar"]