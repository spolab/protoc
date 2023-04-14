#!/bin/sh

set -e

echo "Received the following parameters: $@"

# Run protoc with the provided arguments
protoc $@
