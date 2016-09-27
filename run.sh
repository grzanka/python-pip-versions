#!/usr/bin/env bash

images="debian:testing
ubuntu:16.04"

for image in "$images"
do
   docker run --rm -it -v `pwd`:/tmp/opt/:ro $image bash -c "/tmp/opt/discover.sh py2"
   docker run --rm -it -v `pwd`:/tmp/opt/:ro $image bash -c "/tmp/opt/discover.sh py3"
done