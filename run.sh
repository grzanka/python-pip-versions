#!/usr/bin/env bash

set -x # Print command traces before executing command

set -e # Exit immediately if a simple command exits with a non-zero status.

set -o pipefail # Return value of a pipeline as the value of the last command to
                # exit with a non-zero status, or zero if all commands in the
                # pipeline exit successfully.

# list of docker images to install python and check its version
images=(
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


# loop over all images and in each of them install python2 + pip, check python and pip versions and report them
# then the same for python3 + pip
:>py2.ver
:>py3.ver
for image in "${images[@]}"
do
   docker run --rm -it -v `pwd`:/tmp/opt/:rw $image bash -c "/tmp/opt/install.sh py2; /tmp/opt/discover.sh"
   echo $image >> py2.ver
   cat python.ver >> py2.ver
   cat pip.ver >> py2.ver
   echo "--------------------------------------------------" >> py2.ver
   docker run --rm -it -v `pwd`:/tmp/opt/:rw $image bash -c "/tmp/opt/install.sh py3; /tmp/opt/discover.sh"
   echo $image >> py3.ver
   cat python.ver >> py3.ver
   cat pip.ver >> py3.ver
   echo "--------------------------------------------------" >> py3.ver
done
cat py2.ver
cat py3.ver