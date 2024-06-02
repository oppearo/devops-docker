FROM golang:alpine as builder
WORKDIR /usr/src/app
COPY ./material-applications/example-backend .

ENV PORT=8080
ENV REQUEST_ORIGIN='http://localhost:5000'
RUN GOOS=linux go build -ldflags='-s'

# Create minimal /etc/passwd wiht appuser
RUN echo "appuser:x:10001:10001:App User:/:/sbin/nologin" > /etc/minimal-passwd

FROM scratch
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app/server /usr/src/app/server

# Create and set nonroot user
COPY --from=builder /etc/minimal-passwd /etc/passwd
USER appuser

EXPOSE 8080
CMD ["./server"]