FROM registry.access.redhat.com/ubi8/ubi-minimal:8.5 as builder

WORKDIR spring-petclinic
COPY ./src ./src
RUN ./mvnw package

FROM openjdk:11-jre-slim
COPY --from=builder target/*.jar /spring-petclinic/*.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","target/*.jar"]
