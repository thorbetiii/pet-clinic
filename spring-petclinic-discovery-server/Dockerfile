FROM maven:3.9.9-eclipse-temurin-23 AS builder
WORKDIR /build
#parent pom
COPY pom.xml ./pom.xml 
COPY spring-petclinic-customers-service ./spring-petclinic-customers-service
COPY spring-petclinic-config-server ./spring-petclinic-config-server
COPY spring-petclinic-discovery-server ./spring-petclinic-discovery-server
COPY spring-petclinic-api-gateway ./spring-petclinic-api-gateway
RUN mvn -pl spring-petclinic-discovery-server -am clean package -DskipTests


FROM eclipse-temurin:23-jre
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY --from=builder /build/spring-petclinic-discovery-server/target/*.jar app.jar
EXPOSE 8761
ENTRYPOINT ["java", "-jar", "app.jar"]