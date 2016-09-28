#!/usr/bin/env bash

set -x # Print command traces before executing command

set -e # Exit immediately if a simple command exits with a non-zero status.

set -o pipefail # Return value of a pipeline as the value of the last command to
                # exit with a non-zero status, or zero if all commands in the
                # pipeline exit successfully.

# list of docker images to install python and check its version
source ../images.sh

# generate all docker files for all images
for IMAGE in "${IMAGES[@]}"
do

    # do it for all both python families
    for PYVER in py2 py3
    do
        FILENAME=${IMAGE/:/_}_$PYVER  # docker image name might contain : character, replace it with _
        FILENAME=${FILENAME/\//_}     # replace also / in image name with _
        echo "FROM $IMAGE" > $FILENAME
        echo "" >> $FILENAME
        echo "# add installation script" >> $FILENAME
        echo "ADD install.sh /install.sh" >> $FILENAME
        echo "ADD discover.sh /discover.sh" >> $FILENAME
        echo "" >> $FILENAME
        echo "# install python" >> $FILENAME
        echo "RUN /install.sh $PYVER" >> $FILENAME
        echo "" >> $FILENAME
        echo "CMD /discover.sh && bash" >> $FILENAME

    done

done
