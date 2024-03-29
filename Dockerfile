FROM registry.access.redhat.com/ubi8/openjdk-17:1.19-1 AS builder

WORKDIR spring-petclinic
RUN mkdir -p /spring-petclinic  # Create the directory if it doesn't exist
COPY . .
RUN chmod 755 /spring-petclinic
RUN ./mvnw clean package -Dcheckstyle.skip

FROM openjdk:11-jre-slim
COPY --from=builder target/*.jar /spring-petclinic/*.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","target/*.jar"]
