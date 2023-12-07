FROM golang:alpine as builder

WORKDIR /usr/src/app/

COPY . .

RUN CGO_ENABLED=0 go build -a -ldflags '-extldflags "-static" -s -w' main.go

FROM scratch

WORKDIR /

COPY --from=builder /usr/src/app/ /


CMD ["./main"]