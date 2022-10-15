

# we will use openjdk with alpine as it is a very small linux distro
FROM openjdk:20-oraclelinux8
# copy the packaged jar file into our docker image
COPY my-app-1.0-SNAPSHOT.jar app.jar
# set the startup command to execute the jar
CMD ["java", "-jar", "/app.jar"]

