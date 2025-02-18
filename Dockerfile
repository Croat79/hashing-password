FROM golang:1.17.6-alpine as builder
WORKDIR /go/src
COPY . .
RUN go build -o hashed_password .

FROM alpine:3.15.0
WORKDIR /bin
COPY --from=builder /go/src .
USER nobody
EXPOSE 8080
CMD ["hashed_password"]