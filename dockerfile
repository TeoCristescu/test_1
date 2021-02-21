FROM golang:alpine AS Builder
WORKDIR /ex_yt 
COPY helloworld.go .
RUN GOOS=linux go build -a -installsuffix cgo -o helloworld .


FROM alpine:latest
WORKDIR /root

COPY --from=Builder /ex_yt/helloworld .
CMD ["./helloworld"]
