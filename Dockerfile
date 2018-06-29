FROM golang:1.10.1

RUN apt-get update && apt-get install -y --no-install-recommends unzip

# Install go dep.
RUN go get -u github.com/golang/dep/...

# Get Protocol Buffers installation and add to PATH.
ADD https://github.com/google/protobuf/releases/download/v3.5.1/protoc-3.5.1-linux-x86_64.zip .
RUN mkdir protobuf-3.5.1
RUN unzip protoc-3.5.1-linux-x86_64.zip -d protobuf-3.5.1
RUN rm protoc-3.5.1-linux-x86_64.zip
RUN chmod +x /go/protobuf-3.5.1/bin/protoc
ENV PATH $PATH:/go/protobuf-3.5.1/bin

RUN go get -u github.com/golang/protobuf/protoc-gen-go