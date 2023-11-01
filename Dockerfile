FROM golang:latest AS build

ADD src /app
WORKDIR /app
RUN go mod init adamo \
&& go build

FROM scratch

WORKDIR /app

COPY --from=build /app/adamo /app/adamo

ENTRYPOINT ["/app/adamo"]