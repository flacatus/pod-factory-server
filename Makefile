# Makefile for releasing podinfo
#
# The release version is controlled from ./version

build:
	GO111MODULE=on CGO_ENABLED=0 go build  -a -v -o ./bin/pod-server ./cmd/pod-server/*
