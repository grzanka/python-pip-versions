#!/usr/bin/env bash

# set -x # Print command traces before executing command

set -e # Exit immediately if a simple command exits with a non-zero status.

set -o pipefail # Return value of a pipeline as the value of the last command to
                # exit with a non-zero status, or zero if all commands in the
                # pipeline exit successfully.


# list of docker images to install python and check its version
IMAGES=(
    "debian:testing"
    "debian:stable"
    "debian:7"
    "debian:8"
    "ubuntu:12.04"
    "ubuntu:14.04"
    "ubuntu:16.04"
    "ubuntu:16.10"
    "fedora:20"
    "fedora:21"
    "fedora:22"
    "fedora:23"
    "fedora:24"
    "centos:7"
    "centos:6"
    "centos:5"
    "opensuse"
    "finalduty/archlinux"
)