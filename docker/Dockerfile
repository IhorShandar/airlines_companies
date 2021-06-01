#FROM openjdk:11-jdk-alpine
#
#VOLUME /tmp
#EXPOSE 7001
#
#ARG LOCAL_JAR_FILE=target/app.jar
#ARG JAR_AT_CONTAINER_FILE_NAME=app.jar
#ADD ${LOCAL_JAR_FILE} ${JAR_AT_CONTAINER_FILE_NAME}
#
#ENTRYPOINT ["java", "-Djava.security.agd=file:/dev/./urandom","-jar", "/app.jar"]

FROM mysql:8.0.23
COPY ./sql_files/ /docker-entrypoint-initdb.d/
