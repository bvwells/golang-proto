FROM golang:1.12.7

RUN apt-get update && apt-get install -y --no-install-recommends unzip

# Get Protocol Buffers installation and add to PATH.
ADD https://github.com/google/protobuf/releases/download/v3.9.0/protoc-3.9.0-linux-x86_64.zip .
RUN mkdir protobuf-3.9.0
RUN unzip protoc-3.9.0-linux-x86_64.zip -d protobuf-3.9.0
RUN rm protoc-3.9.0-linux-x86_64.zip
RUN chmod +x /go/protobuf-3.9.0/bin/protoc
ENV PATH $PATH:/go/protobuf-3.9.0/bin

RUN go get -u github.com/golang/protobuf/protoc-gen-go
