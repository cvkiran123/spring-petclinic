FROM registry.access.redhat.com/ubi8/openjdk-17:1.19-1  AS builder

WORKDIR spring-petclinic
COPY . .
RUN ./mvnw dependency:go-offline
RUN mvn clean install -Dmaven.test.skip



FROM openjdk:11-jre-slim
COPY --from=builder target/*.jar /spring-petclinic/*.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","target/*.jar"]
