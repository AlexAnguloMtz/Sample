# Build
FROM amazoncorretto:22-alpine-jdk as builder

WORKDIR /app

COPY .mvn/ .mvn
COPY mvnw pom.xml ./

RUN chmod +x mvnw

RUN ./mvnw dependency:go-offline

COPY src/ src/

RUN ./mvnw clean package -DskipTests

# Run
FROM amazoncorretto:22-alpine-jdk

WORKDIR /app

EXPOSE 8080

COPY --from=builder /app/target/*.jar /app/app.jar

# Set the entry point to the JAR file
ENTRYPOINT ["java", "-jar", "/app/app.jar"]