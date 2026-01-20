#!/bin/bash
set -xeuo pipefail
cd $(dirname $0)

rm -f tailon

make BUILD=prod frontend
go generate -v
CGO_ENABLED=0 GOOS=linux GOARCH=amd64 \
go build -v -trimpath -ldflags="-s -w"

echo build done
