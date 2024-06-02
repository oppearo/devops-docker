FROM openjdk:8 as builder
EXPOSE 8080
COPY . /usr/src/app
WORKDIR /usr/src/app
RUN ./mvnw package

FROM alpine:latest
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app /usr/src/app/

RUN apk update && \
    apk add openjdk8-jre && \
    addgroup -S appgroup && \
    adduser -S appuser -G appgroup
USER appuser


CMD ["java", "-jar", "./target/docker-example-1.1.3.jar"]
