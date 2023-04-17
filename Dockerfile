# Use an official maven image as the base image
FROM maven:3.8.4-openjdk-17-slim AS build

# Set the working directory to /app
WORKDIR /app

# Copy the pom.xml and the rest of the source code to the container
COPY pom.xml .
COPY src/ ./src/

# Run maven clean install to build the application
RUN mvn clean install

# Use an official OpenJDK runtime image as the base image
FROM openjdk:17-slim

# Set the working directory to /app
WORKDIR /app

# Copy the built JAR file from the build image to the runtime image
COPY --from=build /app/target/spring-boot-admin-server-0.0.1-SNAPSHOT.jar .

# Expose port 8080 for the application
EXPOSE 8081

# Run the application using the java command
CMD ["java", "-jar", "spring-boot-admin-server-0.0.1-SNAPSHOT.jar"]
