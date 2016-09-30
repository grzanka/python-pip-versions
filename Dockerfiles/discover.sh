#!/usr/bin/env bash

# set -x # Print command traces before executing command

set -e # Exit immediately if a simple command exits with a non-zero status.

set -o pipefail # Return value of a pipeline as the value of the last command to
                # exit with a non-zero status, or zero if all commands in the
                # pipeline exit successfully.


# first agument is the command which prints a version
# second argument is a path to the logfile
# function checks if command is present:
#   yes, it's present: command and its output will be appended to output file
#   yes, it's missing: command and "missing" will be appended to output file
check_version() {
    # get arguments
    CMD=$1
    LOGFILE=$2

    # try to execute command, do not exit if command if missing
    # save return code
    set +e
    $CMD -V 1>/dev/null 2>/dev/null
    RETCODE=$?
    set -e

    # save output depending on the return code
    if [[ $RETCODE -eq 0 ]] ; then
        echo $CMD `$CMD -V 2>&1` >> $LOGFILE
    else
        echo $CMD "missing" >> $LOGFILE
    fi
}


# check python version, if present, then save it to python.ver file
:> python.ver
check_version python3 python.ver
check_version python2 python.ver
check_version python python.ver
cat python.ver

# check pip version, if present, then save it to pip.ver file
:> pip.ver
check_version pip3 pip.ver
check_version "python3 -m pip -V" pip.ver
check_version pip pip.ver
check_version "python -m pip -V" pip.ver
cat pip.ver