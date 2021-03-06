#!/bin/bash

# Install Golang
sudo add-apt-repository ppa:longsleep/golang-backports -y
sudo apt-get update
sudo apt-get install golang-go -y

# Install protobuf
sudo apt-get install autoconf automake libtool curl make g++ unzip -y
cd $(dirname ${0})
git clone https://github.com/google/protobuf.git
cd protobuf
git submodule update --init --recursive
./autogen.sh
./configure
make -j
make check -j
sudo make install
sudo ldconfig
cd -

## Install gRPC as a go module
#export GO111MODULE=on
#go get google.golang.org/grpc
#
## Install protoc plugin for Go
#go get github.com/golang/protobuf/protoc-gen-go
#export PATH="$PATH:$(go env GOPATH)/bin"
#
## Copy k8s config
#mkdir -p $HOME/.kube
#sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
#sudo chown $(id -u):$(id -g) $HOME/.kube/config
#
## Install controller
#git clone https://github.com/USC-NSL/Low-Latency-FaaS.git
#cd Low-Latency-FaaS
#make
