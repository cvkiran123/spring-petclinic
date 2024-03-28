FROM maven:3.6.3-jdk-11-slim AS builder

WORKDIR spring-petclinic
COPY . .
RUN ./mvnw package



FROM openjdk:11-jre-slim
COPY --from=builder target/*.jar /spring-petclinic/*.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","target/*.jar"]
