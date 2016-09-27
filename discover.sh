#!/usr/bin/env bash

set -x # Print command traces before executing command

set -e # Exit immediately if a simple command exits with a non-zero status.

set -o pipefail # Return value of a pipeline as the value of the last command to
                # exit with a non-zero status, or zero if all commands in the
                # pipeline exit successfully.

apt_install() {
    PYTHON_VERSION=$1
    apt-get -q update
    PYTHON2_CMD="apt-get install -y python"
    PYTHON3_CMD="apt-get install -y python3"
    choose_python_version "$PYTHON_VERSION" "$PYTHON2_CMD" "$PYTHON3_CMD"
}


yum_install() {
    PYTHON_VERSION=$1
    yum update -y -q
    PYTHON2_CMD="yum install -y -q python"
    PYTHON3_CMD="yum install -y -q python3"
    choose_python_version "$PYTHON_VERSION" "$PYTHON2_CMD" "$PYTHON3_CMD"
}


dnf_install() {
    PYTHON_VERSION=$1
    dnf update -y -q
    PYTHON2_CMD="dnf install -y -q python"
    PYTHON3_CMD="dnf install -y -q python3"
    choose_python_version "$PYTHON_VERSION" "$PYTHON2_CMD" "$PYTHON3_CMD"
}


zypper_install() {
    PYTHON_VERSION=$1
    dnf update -y -q
    PYTHON2_CMD="dnf install -y -q python"
    PYTHON3_CMD="dnf install -y -q python3"
    choose_python_version "$PYTHON_VERSION" "$PYTHON2_CMD" "$PYTHON3_CMD"
}

choose_python_version() {
    PYTHON_VERSION=$1
    PYTHON2_CMD=$2
    PYTHON3_CMD=$3
    case "$PYTHON_VERSION" in
        py2*)
        echo "Py2: $PYTHON_VERSION"
        $PYTHON2_CMD
        ;;
        py3*)
        echo "Py3: $PYTHON_VERSION"
        $PYTHON3_CMD
        ;;
        *)
        echo "Unknown: $PYTHON_VERSION"
        ;;
     esac
}


# TODO - check if this would be good to discover system version
# found here: http://unix.stackexchange.com/questions/6345/how-can-i-get-distribution-name-and-version-number-in-a-simple-shell-script/6348
# check discussion below
function os_type
{
case `uname` in
  Linux )
     LINUX=1
     which dnf && { PACFUN=dnf_install; return; }
     which yum && { PACFUN=yum_install; return; }
     which zypper && { PACFUN=zypper_install; return; }
     which apt-get && { PACFUN=apt_install; return; }
     ;;
  * )
     # Handle other stuff here.
     ;;
esac
}


PYTHON_VERSION=$1


# Detect the platform (similar to $OSTYPE)
# Inspired by http://stackoverflow.com/questions/394230/detect-the-os-from-a-bash-script
# TODO improve furter
case "$OSTYPE" in
  linux-gnu*) # Debian
    echo "Linux-gnu: $OSTYPE"
    os_type
    $PACFUN $PYTHON_VERSION
    ;;
  linux*)
    echo "Linux: $OSTYPE"
    os_type
    $PACFUN $PYTHON_VERSION
    ;;
  bsd*)
    echo "BSD: $OSTYPE"
    os_type
    $PACFUN $PYTHON_VERSION
    ;;
  *)
    echo "Unknown: $OSTYPE"
    ;;
esac

python -V || python3 -V
pip -V || pip3 -V
