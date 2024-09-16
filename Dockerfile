# Use Ubuntu as the base image
FROM ubuntu:latest

# Update package lists and install necessary packages
RUN apt-get update && apt-get install -y \
    openjdk-11-jdk \
    maven \
    git \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy the project files into the container
COPY . .

# Run Maven tests
RUN mvn clean test

# Build the project without cleaning (since we already cleaned)
RUN mvn package

# Set the entry point to run the application
CMD ["java", "-jar", "target/openrtf-1.2.2-SNAPSHOT.jar"]
