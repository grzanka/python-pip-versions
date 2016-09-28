#!/usr/bin/env bash

# list of docker images to install python and check its version
source ../images.sh

# generate all possible docker files
for IMAGE in "${IMAGES[@]}"
do
    FILENAME=${IMAGE/:/_}_py2
    FILENAME=${FILENAME/\//_}
    echo "FROM $IMAGE" > $FILENAME
    echo "" >> $FILENAME
    echo "# add installation script" >> $FILENAME
    echo "ADD install.sh /install.sh" >> $FILENAME
    echo "ADD discover.sh /discover.sh" >> $FILENAME
    echo "" >> $FILENAME
    echo "# install python" >> $FILENAME
    echo "RUN /install.sh py2" >> $FILENAME
    echo "" >> $FILENAME
    echo "CMD /discover.sh && bash" >> $FILENAME


    FILENAME=${IMAGE/:/_}_py3
    FILENAME=${FILENAME/\//_}
    echo "FROM $IMAGE" > $FILENAME
    echo "" >> $FILENAME
    echo "# add installation script" >> $FILENAME
    echo "ADD install.sh /install.sh" >> $FILENAME
    echo "ADD discover.sh /discover.sh" >> $FILENAME
    echo "" >> $FILENAME
    echo "# install python" >> $FILENAME
    echo "RUN /install.sh py3" >> $FILENAME
    echo "" >> $FILENAME
    echo "CMD /discover.sh && bash" >> $FILENAME

done
