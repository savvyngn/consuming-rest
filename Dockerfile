FROM maven:3.9.6 AS build

WORKDIR /app

COPY pom.xml .

RUN mvn dependency:go-offline

COPY src src

RUN mvn package -DskipTests

FROM openjdk:17-slim AS runtime

WORKDIR /app

COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080

CMD ["java", "-jar", "app.jar"]
