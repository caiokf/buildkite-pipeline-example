#!/bin/bash
set -e

if [ -z "$F" ]; then
	rm -rf bin
  rm build.tar.gz
	exit 0
fi

dir=$(go list -f '{{.Dir}}' $F)
out=$(basename $dir)
rm -f bin/$out
