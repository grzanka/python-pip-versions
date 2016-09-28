Python versions in Linux distributions
======================================

Goal of this project is to summarize python versions
available on current Linux distributions.

We provide also set of tools necessary to perform such survey.

The problem
-----------

Many Linux distributions have long term support (sometimes few years). 
This sometimes means that during the lifetime of such distribution
major Python version is not changing. We have thus wide variety
of Python interpreters installed on user machines.

We assume that python is installed using package manager from standard repository
(i.e. using `sudo apt-get install python3` on Ubuntu) by superuser.
Let us assume you created nice program which works with new Python version,
but not with the old one. You may ask why bother with old python interpreter,
as it can be easily upgraded either by installing from third-party repository
or compiled from sources. Unfortunately for some users this is not the case - 
for example users of computing cluster do not have superuser powers, thus
cannot install software from any third-party repository. Installation of Python from
sources also require some system packages which might as well be not available.

Most popular way of distributing application written in Python is the pip manages.
Thus we also study which version of pip is installed.


Discovery of default python and pip versions shipped with
Python and pip default versions on major Linux distros

The results
-----------

Ubuntu
~~~~~~

Table:


+---------+------------+-------------+ 
| Release | Python 2.x | Python 3.x  | 
+=========+============+=============+ 
| 16.10   | column 2   |   column 3  | 
+---------+------------+-------------+ 
| 16.04   | Cells may span columns.  | 
+---------+------------+-------------+ 
| 14.04   | Cells may  | Cells       | 
+---------+ span rows. | contain     | 
| 12.02   |            | blocks.     | 
+---------+------------+-------------+

16.10

16.04

14.04

12.04

Debian
~~~~~~

7

8

Fedora
~~~~~~

20

21

22

23

24

CentOS
~~~~~~

5

6

7

ArchLinux
~~~~~~~~~

rolling release

openSUSE
~~~~~~~~

rolling release


The tools
---------

Our solution is based on using docker containers to install python and pip on bare system
and make a query for the version. We assume that you are familiar with docker, have it installed and your
computer has good Internet connection.


List of docker containers under study is saved in :file:`images.sh` file and covers following distributions: Ubuntu, Debian,
Fedora, Centos, ArchLinux, openSUSE.


Installation of python and pip is done using :file:`install.sh` (which points to :file:`Dockerfiles/install.sh`) script which 
takes only one argument: either `py2` or `py3` defining python version to install. Install script automatically
discovers which package manager (apt, yum, dnf or others) is available and uses it install Python interpreter and pip.
Such script is thus in some way independent of Linux distribution.

Querying of Python and pip version is implemented in :file:`discover.sh` (which points to :file:`Dockerfiles/discover.sh`) script.
This script is calling `python -V` (version printing option) and `python3 -V` to discover versions of python interpreters
from both families. It is also querying pip version in two ways: by calling `pip` commands and by executing pip module.
Results are printed on the screen and saved into *pip.ver* and *python.ver* files.

Actual study is done by :file:`run.sh` script which loops over all docker images provided in :file:`images.sh` files, 
installs python interpreter using :file:`install.sh` script and makes query using :file:`discover.sh`.
Summary of results is saved into :file:`py2.ver` and :file:`py3.ver` files.

For example to install Python 3 + pip and check versions for Debian 8, use following commands:

::

    docker run --rm -it -v `pwd`:/tmp/opt/ debian:8 bash -c "cd /tmp/opt; ./install.sh py2; ./discover.sh"
    cat python.ver
    cat pip.ver

The Similar approach is used in **run.sh** script.

Dockerfiles
~~~~~~~~~~~

Installation of python might be time consuming. We thus provide Dockerfiles - a recipe to build a docker image with python+pip installed in a clean system. 
These files are used to automatically build docker images by dockerhub, available here:

* https://hub.docker.com/r/grzanka/debian_python/
* https://hub.docker.com/r/grzanka/ubuntu_python/
* https://hub.docker.com/r/grzanka/centos_python/
* https://hub.docker.com/r/grzanka/opensuse_python/
* https://hub.docker.com/r/grzanka/archlinux_python/
* https://hub.docker.com/r/grzanka/fedora_python/

Such images might be used for making tests of software in clean Linux environment. 
Following command provides shell in fresh Debian 8 with Python 3 + pip installed:

::

    docker run -it --rm grzanka/debian_python:8_py3 bash
    
These images have also bundled script querying the python and pip versions. 
This gives another way to get these versions:

::

    docker run -it --rm grzanka/debian_python:8_py3 ./discover.sh

Not all combinations of distribution and Python versions are available. For example CentOS 5, 6 and 7 doesn't
have Python3 in standard repository. Thus we do not have docker image for CentOS with Python3 installed.

Dockerfiles were generated using :file:`Dockerfiles/generate.sh` script. 
We provide also script :file:`Dockerfiles/generate.sh` which runs version discovery on abovementioned 
images (clean systems with Python and pip installed).

Automated testing
-----------------

This project comes also with Travis and wercker configurations. You can see results of automated tests here:

* https://travis-ci.org/grzanka/python-pip-versions
* https://app.wercker.com/grzanka/python-pip-versions/runs

Author
------

Leszek Grzanka (leszek.grzanka@gmail.com)
