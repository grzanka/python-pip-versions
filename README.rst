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

Results obtained from query made on 2016.09.28

Ubuntu
~~~~~~

+---------+-------------------------+-------------------+-------------------+
|         |                         | Python 2.x        | Python 3.x        |
| Release |        Life span        +---------+---------+---------+---------+
|         |                         | Python  | Pip     | Python  | Pip     |
+=========+=========================+=========+=========+=========+=========+
| 16.10   | 2016-10-20 - 2017-07-?? |  ??     | ??      | 3.5.2+  | 8.1.2   |
+---------+-------------------------+---------+---------+---------+---------+
| 16.04   | 2016-04-21 - 2021-04-?? |  2.7.12 | 8.1.1   | 3.5.2   | 8.1.1   |
+---------+-------------------------+---------+---------+---------+---------+
| 14.04   | 2014-04-17 - 2019-04-?? |  2.7.6  | 1.5.4   | 3.4.3   | 1.5.4   |
+---------+-------------------------+---------+---------+---------+---------+
| 12.04   | 2012-04-26 - 2017-04-26 |  ??     | ??      | ??      | ??      |
+---------+-------------------------+---------+---------+---------+---------+

Ubuntu life span taken from https://en.wikipedia.org/wiki/Ubuntu_version_history#Table_of_versions

Debian
~~~~~~

+----------+-------------------------+-------------------+-------------------+
|          |                         | Python 2.x        | Python 3.x        |
| Release  |        Life span        +---------+---------+---------+---------+
|          |                         | Python  | Pip     | Python  | Pip     |
+==========+=========================+=========+=========+=========+=========+
| 7 wheezy | 2014-05-04 - 2018-05-?? |  2.7.3  | --      | 3.2.3   | --      |
+----------+-------------------------+---------+---------+---------+---------+
| 8 jessie | 2015-04-26 - 2020-05-?? |  2.7.9  | 1.5.6   | 3.4.2   | 1.5.6   |
+----------+-------------------------+---------+---------+---------+---------+

Debian life span taken from https://en.wikipedia.org/wiki/Debian_version_history#Release_table

Fedora
~~~~~~

+---------+-------------------------+-------------------+-------------------+
|         |                         | Python 2.x        | Python 3.x        |
| Release |        Life span        +---------+---------+---------+---------+
|         |                         | Python  | Pip     | Python  | Pip     |
+=========+=========================+=========+=========+=========+=========+
| 23      | 2015-11-03 - 20??-??-?? |  2.7.11 | 7.1     | 3.4.2   | 6.0.8   |
+---------+-------------------------+---------+---------+---------+---------+
| 24      | 2016-06-21 - 20??-??-?? |  2.7.12 | 8.0.2   | 3.5.1   | 8.0.2   |
+---------+-------------------------+---------+---------+---------+---------+

Fedora life span taken from https://en.wikipedia.org/wiki/Fedora_version_history#Version_history

CentOS
~~~~~~

+---------+-------------------------+-------------------+-------------------+
|         |                         | Python 2.x        | Python 3.x        |
| Release |        Life span        +---------+---------+---------+---------+
|         |                         | Python  | Pip     | Python  | Pip     |
+=========+=========================+=========+=========+=========+=========+
| 5       | 2007-04-12 - 2017-03-31 |  ??     | ??      | ??      | ??      |
+---------+-------------------------+---------+---------+---------+---------+
| 6       | 2011-07-10 - 2020-11-30 |  ??     | ??      | ??      | ??      |
+---------+-------------------------+---------+---------+---------+---------+
| 7       | 2014-07-07 - 2024-06-30 |  ??     | ??      | ??      | ??      |
+---------+-------------------------+---------+---------+---------+---------+

CentOS life span taken from https://en.wikipedia.org/wiki/CentOS#End-of-support_schedule

ArchLinux
~~~~~~~~~

+----------+-------------------------+-------------------+-------------------+
|          |                         | Python 2.x        | Python 3.x        |
| Release  |        Life span        +---------+---------+---------+---------+
|          |                         | Python  | Pip     | Python  | Pip     |
+==========+=========================+=========+=========+=========+=========+
| rolling  |    --                   |  ??     | ??      | 3.5.2   | 8.1.2   |
+----------+-------------------------+---------+---------+---------+---------+

openSUSE
~~~~~~~~

TBV


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
