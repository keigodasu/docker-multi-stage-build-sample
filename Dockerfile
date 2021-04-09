# stage1
FROM golang:1.14.1-alpine3.11 as builder
COPY ./main.go ./
RUN go build -o /go-app ./main.go

# stage2	
FROM alpine:3.11
COPY --from=builder /go-app .
ENTRYPOINT ["./go-app]
