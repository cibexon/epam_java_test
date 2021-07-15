FROM maven:3.5.2-jdk-8-alpine AS Epam_test_Java
COPY pom.xml /tmp/
RUN mvn -B dependency:go-offline -f /tmp/pom.xml
COPY src /tmp/src/
WORKDIR /tmp/
RUN mvn package

FROM java:8-jre-alpine

EXPOSE 8080

RUN mkdir /app
COPY --from=Epam_test_Java /tmp/target/*.jar /app/spring-boot-application.jar

ENTRYPOINT ["java","-jar","/app/spring-boot-application.jar"]

#HEALTHCHECK --interval=1m --timeout=3s CMD wget -q -T 3 -s http://localhost:8080/actuator/health/ || exit 1
