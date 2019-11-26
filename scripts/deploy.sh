#!/bin/bash
set -e

if [ -z "$ENV" ]; then
	ENV=dev
fi

if [ -z "$F" ]; then
  if [ "$ENV" == "prod" ]; then
    TEAM=$(buildkite-agent meta-data get release-name)
    STREAM=$(buildkite-agent meta-data get release-stream)
    echo "Preparing to deploy $TEAM ($STREAM)"
  fi
	echo "Deploying to $ENV"
	exit 0
fi