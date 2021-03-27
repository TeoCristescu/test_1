FROM golang:alpine AS Builder
WORKDIR /ex_yt
COPY helloworld.go .
RUN go mod init hello
RUN go env -w GO111MODULE=on
RUN go env -w GOPROXY=https://goproxy.cn,direct
RUN GOOS=linux go build -a -installsuffix cgo -o helloworld .


FROM alpine:latest
WORKDIR /root

COPY --from=Builder /ex_yt/helloworld .
CMD ["./helloworld"]

