FROM eclipse-temurin:17-jdk-jammy as builder

WORKDIR spring-petclinic
COPY ./src ./src
RUN ./mvnw package

FROM openjdk:11-jre-slim
COPY --from=build target/*.jar /spring-petclinic/*.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","target/*.jar"]
