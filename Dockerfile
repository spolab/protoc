FROM alpine

# Install protobuf-compiler and curl
RUN apk add --no-cache protobuf curl

# Set the working directory
WORKDIR /app

# Download protoc-gen-go and protoc-gen-go-grpc binaries
RUN mkdir -p /usr/local/bin && \
    curl -L -o /tmp/protoc-gen-go.tar.gz https://github.com/protocolbuffers/protobuf-go/releases/download/v1.28.0/protoc-gen-go.v1.28.0.linux.amd64.tar.gz && \
    tar -C /usr/local/bin -xzf /tmp/protoc-gen-go.tar.gz && \
    rm /tmp/protoc-gen-go.tar.gz && \
    curl -L -o /tmp/protoc-gen-go-grpc.tar.gz https://github.com/grpc/grpc-go/releases/download/cmd%2Fprotoc-gen-go-grpc%2Fv1.2.0/protoc-gen-go-grpc.v1.2.0.linux.amd64.tar.gz && \
    tar -C /usr/local/bin -xzf /tmp/protoc-gen-go-grpc.tar.gz && \
    rm /tmp/protoc-gen-go-grpc.tar.gz && \
    chmod +x /usr/local/bin/protoc-gen-go /usr/local/bin/protoc-gen-go-grpc

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
