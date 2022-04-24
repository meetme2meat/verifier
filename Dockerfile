FROM golang:alpine AS builder

RUN apk add --no-cache ca-certificates git

RUN mkdir -p /home/ 

RUN cd /home/

RUN git clone https://github.com/AfterShip/email-verifier.git /home/app

WORKDIR /home/app

RUN go build -o /bin/http_server /home/app/cmd/apiserver

FROM alpine

RUN apk update && apk add ca-certificates && rm -rf /var/cache/apk/*

RUN update-ca-certificates

COPY --from=builder /bin/http_server /bin/http_server

ENTRYPOINT ["http_server"]