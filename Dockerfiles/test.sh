#!/usr/bin/env bash

# list of docker images to install python and check its version
IMAGES=(
    "grzanka/fedora_python:20_py2"
    "grzanka/fedora_python:20_py3"
    "grzanka/fedora_python:21_py2"
    "grzanka/fedora_python:21_py3"
    "grzanka/fedora_python:22_py2"
    "grzanka/fedora_python:22_py3"
    "grzanka/fedora_python:23_py2"
    "grzanka/fedora_python:23_py3"
    "grzanka/fedora_python:24_py2"
    "grzanka/fedora_python:24_py3"
    "grzanka/archlinux_python:py2"
    "grzanka/archlinux_python:py3"
    "grzanka/opensuse_python:py2"
    "grzanka/opensuse_python:py3"
    "grzanka/debian_python:7_py2"
    "grzanka/debian_python:7_py3"
    "grzanka/debian_python:8_py2"
    "grzanka/debian_python:8_py3"
    "grzanka/ubuntu_python:12.04_py3"
    "grzanka/ubuntu_python:14.04_py2"
    "grzanka/ubuntu_python:14.04_py3"
    "grzanka/ubuntu_python:16.04_py2"
    "grzanka/ubuntu_python:16.04_py3"
    "grzanka/ubuntu_python:16.10_py2"
    "grzanka/ubuntu_python:16.10_py3"
)


# generate all possible docker files
for IMAGE in "${IMAGES[@]}"
do
    docker run --rm -it $IMAGE ./discover.sh
done
