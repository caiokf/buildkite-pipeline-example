#!/bin/bash
set -e

export GO111MODULE=on

function build() {
	for dir in `go list -f '{{.Dir}}' $1`; do
		local out=$(basename $dir)
		mkdir -p bin && cd bin && env GOOS=linux go build -ldflags="-s -w" -o $out $dir
		echo "> $out"
		cd ..
	done
}

build $F
