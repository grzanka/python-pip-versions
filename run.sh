#!/usr/bin/env bash

images=(
    "debian:testing"
    "ubuntu:12.04"
    "ubuntu:14.04"
    "ubuntu:16.04"
)

for image in "${images[@]}"
do
   docker run --rm -it -v `pwd`:/tmp/opt/:ro $image bash -c "/tmp/opt/discover.sh py2" > ver2.log
   tail -n 2 ver2.log
   docker run --rm -it -v `pwd`:/tmp/opt/:ro $image bash -c "/tmp/opt/discover.sh py3" > ver3.log
   tail -n 2 ver3.log
done