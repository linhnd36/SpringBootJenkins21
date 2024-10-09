FROM --platform=linux/amd64 maven:3.9.9-amazoncorretto-21-debian AS builder

# add pom.xml and source code
COPY ./pom.xml pom.xml
COPY ./src src/

# package jar
RUN mvn clean package -DskipTests

# Second stage: minimal runtime environment
From --platform=linux/amd64 amazoncorretto:21-alpine3.17

# copy jar from the first stage
COPY --from=builder target/*.jar my-app-1.0-SNAPSHOT.jar

EXPOSE 8080

CMD ["java", "-jar", "my-app-1.0-SNAPSHOT.jar"]