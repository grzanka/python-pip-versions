#!/usr/bin/env bash

set -x # Print command traces before executing command

set -e # Exit immediately if a simple command exits with a non-zero status.

set -o pipefail # Return value of a pipeline as the value of the last command to
                # exit with a non-zero status, or zero if all commands in the
                # pipeline exit successfully.

# list of docker images to install python and check its version
source images.sh

# loop over all images and in each of them install python2 + pip, check python and pip versions and report them
# then the same for python3 + pip
:>py2.ver
:>py3.ver
for IMAGE in "${IMAGES[@]}"
do
   docker run --rm -it -v `pwd`:/tmp/opt/:rw $IMAGE bash -c "cd /tmp/opt; ./install.sh py2; ./discover.sh"
   echo $IMAGE >> py2.ver
   cat python.ver >> py2.ver
   cat pip.ver >> py2.ver
   echo "--------------------------------------------------" >> py2.ver
   docker run --rm -it -v `pwd`:/tmp/opt/:rw $IMAGE bash -c "cd /tmp/opt; ./install.sh py3; ./discover.sh"
   echo $IMAGE >> py3.ver
   cat python.ver >> py3.ver
   cat pip.ver >> py3.ver
   echo "--------------------------------------------------" >> py3.ver
done
cat py2.ver
cat py3.ver