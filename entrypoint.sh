#!/bin/sh

set -e

echo "Current directory $(PWD)"

echo "$(ls -la)"

# Run protoc with the provided arguments
protoc "$@"
