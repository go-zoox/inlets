# Builder
FROM golang:1.18-alpine as builder

RUN         apk add --no-cache make git

WORKDIR     /app

COPY        go.mod ./

COPY        go.sum ./

RUN         go mod download

ARG         VERSION=unknown

ARG         BUILD_TIME=unknown

ARG         COMMIT_HASH=unknown

COPY        . ./

RUN         CGO_ENABLED=0 \
            GOOS=linux \
            GOARCH=amd64 \
            go build \
              -trimpath \
              -ldflags '\
                -X "github.com/go-zoox/lighthouse/constants.Version=${VERSION}" \
                -X "github.com/go-zoox/lighthouse/constants.BuildTime=${BUILD_TIME}" \
                -X "github.com/go-zoox/lighthouse/constants.CommitHash=${COMMIT_HASH}" \
                -w -s -buildid= \
              ' \
              -v -o lighthouse

# Product
FROM  scratch

LABEL       MAINTAINER="Zero<tobewhatwewant@gmail.com>"

LABEL       org.opencontainers.image.source="https://github.com/go-zoox/lighthouse"

ARG         VERSION=v1.0.0

COPY        --from=builder /app/lighthouse /

COPY        conf/lighthouse.yaml /conf/lighthouse.yaml

EXPOSE      53

ENV         GIN_MODE=release

ENV         VERSION=${VERSION}

CMD  ["/lighthouse", "-c", "/conf/lighthouse.yaml"]
