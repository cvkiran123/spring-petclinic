FROM registry.access.redhat.com/ubi8/openjdk-17:1.15-1.1682053058 AS builder

WORKDIR spring-petclinic
COPY ./src ./src
RUN ./mvnw package

FROM openjdk:11-jre-slim
COPY --from=builder target/*.jar /spring-petclinic/*.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","target/*.jar"]
