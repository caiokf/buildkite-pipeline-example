#!/bin/bash
set -e

if [ -z "$ENV" ]; then
	ENV=dev
fi

if [ -z "$F" ]; then
	echo "Deploying to $ENV"
	exit 0
fi