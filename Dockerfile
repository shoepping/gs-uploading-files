FROM maven:3.5.3-alpine AS BUILD_IMAGE

COPY complete /root
WORKDIR /root
RUN mvn -f pom.xml package

FROM openjdk:8-jre
WORKDIR /opt/
COPY --from=BUILD_IMAGE /root/target/uploading-files-0.0.1-SNAPSHOT.jar .
EXPOSE 8080
CMD ["java","-jar","uploading-files-0.0.1-SNAPSHOT.jar"]
