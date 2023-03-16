FROM openjdk:18
EXPOSE 8080
ADD target/CapstoneProject-0.0.1-SNAPSHOT.jar CapstoneProject-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/CapstoneProject-0.0.1-SNAPSHOT.jar"]
