#!/usr/bin/env bash

# set -x # Print command traces before executing command

set -e # Exit immediately if a simple command exits with a non-zero status.

set -o pipefail # Return value of a pipeline as the value of the last command to
                # exit with a non-zero status, or zero if all commands in the
                # pipeline exit successfully.


# list of docker images to install python and check its version
source ../images.sh

# save fragment of wercker config into output file
OUTFILE=wercker.tpl

# clean output file
:> $OUTFILE

echo "Output file" $OUTFILE

# generate entries for all images
for IMAGE in "${IMAGES[@]}"
do

    # do it for all both python families
    for PYVER in py2 py3
    do
        NAME=${IMAGE/:/-}-$PYVER  # docker image name might contain : character, replace it with -
        NAME=${NAME/\//-}     # replace also / in image name with -

        echo "# ---------------------------------- $IMAGE $PYVER -----------------------------------------------" >> $OUTFILE
        echo "$NAME:" >> $OUTFILE
        echo "    box: $IMAGE" >> $OUTFILE
        echo "" >> $OUTFILE
        echo "    steps:" >> $OUTFILE
        echo "        - script:" >> $OUTFILE
        echo "          name: install" >> $OUTFILE
        echo "          code: |" >> $OUTFILE
        echo "             ./install $PYVER" >> $OUTFILE
        echo "             ./discover.sh" >> $OUTFILE
        echo "" >> $OUTFILE

    done

done
