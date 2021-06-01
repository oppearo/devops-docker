# change to ENV from the previous to allow nginx pings
FROM golang:1.16
EXPOSE 8080
WORKDIR /go/src/app
COPY . .
RUN go build
RUN go test ./...
ENV REQUEST_ORIGIN=http://localhost
CMD ["./server"]