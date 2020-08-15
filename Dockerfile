FROM golang:1.14-buster as go-build
ENV CGO_ENABLED 0
ENV GO111MODULE on

WORKDIR /go/src/github.com/hgkcho/cliEx
COPY . .
RUN set -ex && \
    apt-get update && \
    apt-get install -y git curl less vim && \
    go get -v \
      github.com/go-delve/delve/cmd/dlv@latest \
      github.com/rogpeppe/godef@latest \
      golang.org/x/tools/gopls@latest \
      golang.org/x/tools/cmd/goimports@latest \
      github.com/ramya-rao-a/go-outline@latest \
      github.com/cweill/gotests/...
