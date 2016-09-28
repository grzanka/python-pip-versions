#!/usr/bin/env bash

#set -x # Print command traces before executing command

set -e # Exit immediately if a simple command exits with a non-zero status.

set -o pipefail # Return value of a pipeline as the value of the last command to
                # exit with a non-zero status, or zero if all commands in the
                # pipeline exit successfully.


# first argument - python version to install: py2 or py3
if [[ $# -ne 1 ]] ; then
    echo "Correct usage: ./install.sh py2|py3"
    exit 1
fi
PYTHON_VERSION=$1

# helper method to select installation command based on python version given by user
# if first argument is py2 then execute command provided in second argument
# else if first argument is py3 then execute command provided in third argument
# otherwise do nothing
choose_python_version() {
    PYTHON_VERSION=$1     # py2 or py3
    PYTHON2_CMD=$2        # installation command for py2
    PYTHON3_CMD=$3        # installation command for py3
    case "$PYTHON_VERSION" in
        py2*)
        $PYTHON2_CMD
        ;;
        py3*)
        $PYTHON3_CMD
        ;;
        *)
        echo "Unknown argument: $PYTHON_VERSION"
        ;;
     esac
}

# install using apt, python version (py2 or py3) as first argument
apt_install() {
    PYTHON_VERSION=$1
    apt-get -q update
    PYTHON2_CMD="apt-get install -y python python-pip"
    PYTHON3_CMD="apt-get install -y python3 python3-pip"
    choose_python_version "$PYTHON_VERSION" "$PYTHON2_CMD" "$PYTHON3_CMD"
}

# install using yum, python version (py2 or py3) as first argument
yum_install() {
    PYTHON_VERSION=$1
    yum update -y -q
    PYTHON2_CMD="yum install -y -q python python-pip"
    PYTHON3_CMD="yum install -y -q python3 python3-pip"
    choose_python_version "$PYTHON_VERSION" "$PYTHON2_CMD" "$PYTHON3_CMD"
}

# install using dnf, python version (py2 or py3) as first argument
dnf_install() {
    PYTHON_VERSION=$1
    dnf update -y -q
    PYTHON2_CMD="dnf install -y -q python python-pip"
    PYTHON3_CMD="dnf install -y -q python3 python3-pip"
    choose_python_version "$PYTHON_VERSION" "$PYTHON2_CMD" "$PYTHON3_CMD"
}

# install using zypper, python version (py2 or py3) as first argument
zypper_install() {
    PYTHON_VERSION=$1
    dnf update -y -q
    PYTHON2_CMD="zypper install -y -q python python-pip"
    PYTHON3_CMD="zypper install -y -q python3 python3-pip"
    choose_python_version "$PYTHON_VERSION" "$PYTHON2_CMD" "$PYTHON3_CMD"
}

# install using pacman, python version (py2 or py3) as first argument
pacman_install() {
    PYTHON_VERSION=$1
    PYTHON2_CMD="pacman -S --noconfirm python2 python2-pip"
    PYTHON3_CMD="pacman -S --noconfirm python python-pip"
    choose_python_version "$PYTHON_VERSION" "$PYTHON2_CMD" "$PYTHON3_CMD"
}

# default install, do nothing
default_install() {
   echo "Default installation method, empty"
}


# detects which package manager is present in the system (apt, yum, dnf etc...)
# and uses correct method to install python
# based on: http://unix.stackexchange.com/questions/6345/how-can-i-get-distribution-name-and-version-number-in-a-simple-shell-script/6348
case `uname` in
  Linux )
     which dnf && dnf_install $PYTHON_VERSION         # Fedora
     yum info which && yum_install $PYTHON_VERSION    # CentOS
     which zypper && zypper_install $PYTHON_VERSION   # openSUSE
     which apt-get && apt_install $PYTHON_VERSION     # Ubuntu, Debian
     which pacman && pacman_install $PYTHON_VERSION   # ArchLinux
     true                                             # if all above fails
     ;;
  * )
     # Handle other stuff here.
     default_install
     ;;
esac