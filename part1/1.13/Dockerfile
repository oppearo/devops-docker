FROM golang:1.16
EXPOSE 8080
WORKDIR /go/src/app
COPY . .
RUN go build
RUN go test ./...
CMD ["./server"]
