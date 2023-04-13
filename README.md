# protoc-action github action

This is a simple GitHub Action that enables the pipeline to execute protoc commands.

Both protobuf and grpc are supported.

The action includes the Go plugins.

## Example usage

```yaml
name: Main Workflow

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v3

      - name: Run Custom Protoc Go Action
        uses: spolab/protoc-action@master
        with:
          args: --go_out=. --go_opt=paths=source_relative --go-grpc_out=. --go-grpc_opt=paths=source_relative your_proto_file.proto

      # ... The rest of your workflow steps

```
