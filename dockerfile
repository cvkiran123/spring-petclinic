FROM openjdk-17 AS builder

WORKDIR spring-petclinic
COPY . .
RUN mvn clean install -U
RUN ./mvnw clean package


FROM openjdk:11-jre-slim
COPY --from=builder target/*.jar /spring-petclinic/*.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","target/*.jar"]
