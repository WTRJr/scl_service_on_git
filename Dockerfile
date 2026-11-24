FROM docker.io/library/eclipse-temurin:21-jdk AS build
WORKDIR /app_scl_for_compile
COPY Main.java .
RUN javac Main.java

FROM docker.io/library/eclipse-temurin:21-jre
WORKDIR /app_scl_for_run
COPY --from=build /app_scl_for_compile/*.class .
EXPOSE 5000
CMD ["java", "Main"]
