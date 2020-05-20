Python versions in Linux distributions
======================================

Goal of this project is to summarize python versions
available on current Linux distributions.

We provide also set of tools necessary to perform such survey.

.. contents:: Table of Contents
   :depth: 2

Problem
-------

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

Results
-------

Results obtained from query made on 2016.09.28

Ubuntu
~~~~~~

+---------+-------------------------+-------------------+-------------------+
|         |                         | Python 2.x        | Python 3.x        |
| Release |        Life span        +---------+---------+---------+---------+
|         |                         | Python  | Pip     | Python  | Pip     |
+=========+=========================+=========+=========+=========+=========+
| 16.10   | 2016-10-20 - 2017-07-?? |  2.7.12 | 8.1.2   | 3.5.2+  | 8.1.2   |
+---------+-------------------------+---------+---------+---------+---------+
| 16.04   | 2016-04-21 - 2021-04-?? |  2.7.12 | 8.1.1   | 3.5.2   | 8.1.1   |
+---------+-------------------------+---------+---------+---------+---------+

Ubuntu life span taken from https://en.wikipedia.org/wiki/Ubuntu_version_history#Table_of_versions

Debian
~~~~~~

+----------+-------------------------+-------------------+-------------------+
|          |                         | Python 2.x        | Python 3.x        |
| Release  |        Life span        +---------+---------+---------+---------+
|          |                         | Python  | Pip     | Python  | Pip     |
+==========+=========================+=========+=========+=========+=========+
| 8 jessie | 2015-04-26 - 2020-06-30 |  2.7.9  | 1.5.6   | 3.4.2   | 1.5.6   |
+----------+-------------------------+---------+---------+---------+---------+
| 9 stretch| 2017-06-17 - 2022-06-?? |  2.7.13 | 9.0.1   | 3.5.3   | 9.0.1   |
+----------+-------------------------+---------+---------+---------+---------+
| 10 buster| 2019-07-06 - 2022-06-?? |  2.7.16 | 18.1    | 3.7.3   | 18.1    |
+----------+-------------------------+---------+---------+---------+---------+
| testing* | rolling release         |  X      | X       | 3.8.3   | 20.1    |
+----------+-------------------------+---------+---------+---------+---------+
| unstable*| rolling release         |  X      | X       | 3.8.3   | 20.1    |
+----------+-------------------------+---------+---------+---------+---------+

Checks done 2020-05-20

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
| 5       | 2007-04-12 - 2017-03-31 |  2.4.3  | --      | --      | --      |
+---------+-------------------------+---------+---------+---------+---------+
| 6       | 2011-07-10 - 2020-11-30 |  2.6.6  | --      | --      | --      |
+---------+-------------------------+---------+---------+---------+---------+
| 7       | 2014-07-07 - 2024-06-30 |  2.7.5  | --      | --      | --      |
+---------+-------------------------+---------+---------+---------+---------+

CentOS life span taken from https://en.wikipedia.org/wiki/CentOS#End-of-support_schedule

openSUSE
~~~~~~~~

+------------+-------------------------+-------------------+-------------------+
|            |                         | Python 2.x        | Python 3.x        |
| Release    |        Life span        +---------+---------+---------+---------+
|            |                         | Python  | Pip     | Python  | Pip     |
+============+=========================+=========+=========+=========+=========+
| 42.1       | 2015-11-04 - 2017-04-?? |  2.7.12 | 7.1.2   | 3.4.5   | 7.1.2   |
+------------+-------------------------+---------+---------+---------+---------+
| 13.2       | 2014-11-04 - 2017-01-?? |  2.7.12 | 1.5     | 3.4.5   | 1.5.6   |
+------------+-------------------------+---------+---------+---------+---------+
| tumbleweed | rolling release         |  2.7.12 | 8.1.2   | 3.5.1   | 8.1.1   |
+------------+-------------------------+---------+---------+---------+---------+

openSUSE life span taken from https://en.wikipedia.org/wiki/OpenSUSE#Version_history

ArchLinux
~~~~~~~~~

+----------+-------------------------+-------------------+-------------------+
|          |                         | Python 2.x        | Python 3.x        |
| Release  |        Life span        +---------+---------+---------+---------+
|          |                         | Python  | Pip     | Python  | Pip     |
+==========+=========================+=========+=========+=========+=========+
| rolling  | rolling release         |  2.7.12 | 8.1.2   | 3.5.2   | 8.1.2   |
+----------+-------------------------+---------+---------+---------+---------+


Summary
-------

Python releases
~~~~~~~~~~~~~~~

Following https://www.python.org/doc/versions/ and https://en.wikipedia.org/wiki/History_of_Python#Version_release_dates

+------------+---------------+---------------------------------------+
| Version    |  Release date |   Comments                            +
+============+===============+=======================================+
| 2.7        | 2010-07-03    |  -                                    |
+------------+---------------+---------------------------------------+
| 2.7.3      | 2012-04-09    |  Debian 7 (2014.05-2018.05)           |
|            |               |  Ubuntu 12.04 (2012.04-2017.04)       |
+------------+---------------+---------------------------------------+
| 2.7.5      | 2013-05-15    |  CentOS 7 (2014.07-2024.06)           |
+------------+---------------+---------------------------------------+
| 2.7.6      | 2013-11-10    |  Ubuntu 14.04 (2014.04-2019.04)       |
+------------+---------------+---------------------------------------+
| 2.7.9      | 2014-12-10    |  **ensurepip**, Debian 8              |
+------------+---------------+---------------------------------------+
| 2.7.11     | 2015-12-05    |  Fedora 23                            |
+------------+---------------+---------------------------------------+
| 2.7.12     | 2016-06-26    |  debian testing/unstable, Fedora 24   |
|            |               |  openSUSE, Ubuntu 16.04, 16.10        |
+------------+---------------+---------------------------------------+
+------------+---------------+---------------------------------------+
| 3.1        | 2009-06-27    |  **obsolete**                         |
+------------+---------------+---------------------------------------+
| 3.2        | 2011-02-20    |  **argparse**                         |
|            |               |  Ubuntu 12.04 (2012.04-2017.04)       |
|            |               |  Debian 7 (2014.05-2018.05)           |
+------------+---------------+---------------------------------------+
| 3.3        | 2012-09-29    |  **virtualenv**                       |
+------------+---------------+---------------------------------------+
| 3.4        | 2014-03-16    |  **enum**, **ensurepip**              |
|            |               |  Ubuntu 14.04 (2014.04-2019.04)       |
|            |               |  Debian 8, Fedora 23, openSUSE 42.1   |
+------------+---------------+---------------------------------------+
| 3.5        | 2015-09-13    |  **zipapp**                           |
|            |               |  Ubuntu 16.04, 16.10, Fedora 24       |
|            |               |  Debian testing/unstable, archLinux   |
|            |               |  openSUSE tumbleweed                  |
+------------+---------------+---------------------------------------+

pip releases
~~~~~~~~~~~~

following https://pip.pypa.io/en/stable/news/

+------------+---------------+---------------------------------------+
| Version    |  Release date |   Comments                            +
+============+===============+=======================================+
| 8.1.0      | 2016-03-05    |  **support for manylinux1 tag**       |
|            |               |  Ubuntu 16.04/16.10, openSUSE tumblew.|
|            |               |  Debian testing/unstable, archLinux   |
+------------+---------------+---------------------------------------+
| 8.0.0      | 2016-01-19    |  **drop support for Python 3.2**      |
|            |               |  Fedora 24                            |
+------------+---------------+---------------------------------------+
| 7.0.0      | 2015-05-21    |  openSUSE 42.1, Fedora 23 (py2)       |
+------------+---------------+---------------------------------------+
| 6.0.0      | 2014-12-22    |  **drop support for Python 3.1**      |
|            |               |  Fedora 23 (py3)                      |
+------------+---------------+---------------------------------------+
| 1.5.6      | 2014-05-16    |  Debian 8, openSUSE 13.2              |
+------------+---------------+---------------------------------------+
| 1.5.4      | 2014-02-21    |  Ubuntu 14.04 (2014.04-2019.04)       |
+------------+---------------+---------------------------------------+
| 1.5.0      | 2014-01-01    |  **Mac OSX support**                  |
+------------+---------------+---------------------------------------+
| 1.1        | 2012-02-16    |  Debian 7 (2014.05-2018.05)           |
+------------+---------------+---------------------------------------+
| 1.0        | 2011-04-04    |  Ubuntu 12.04 (py2)                   |
+------------+---------------+---------------------------------------+

Conclusions
~~~~~~~~~~~

* smooth installation (without compilation) of python packages which contain C extensions, like numpy, matplotlib is possible only for systems release after 2016.03 and which have pip newer than 8.1.0. It applies to following systems: Ubuntu 16.04 and newer, Debian testing and unstable, all up-to-date rolling releases like archLinux and openSUSE tumbleweed.
* Python 3.2 slowly starts to be deprecated (i.e. pip newer than 8.0.0 do not support it), but is still present in many systems, like: Ubuntu 12.04 and Debian 7.
* Some systems ships very old pip (1.0 and 1.1), like Ubuntu 12.04 and Debian 7
* Ubuntu 12.04 doesn't have pip for python 3.x in repository
* CentOS doesn't ship Python 3.x and pip in its repositories.


Tools
-----

Our solution is based on using docker containers to install python and pip on bare system
and make a query for the version. We assume that you are familiar with docker, have it installed and your
computer has good Internet connection.


List of docker containers under study is saved in `images.sh` file and covers following distributions: Ubuntu, Debian,
Fedora, Centos, ArchLinux, openSUSE.


Installation of python and pip is done using `install.sh` (which points to `Dockerfiles/install.sh`) script which 
takes only one argument: either `py2` or `py3` defining python version to install. Install script automatically
discovers which package manager (apt, yum, dnf or others) is available and uses it install Python interpreter and pip.
Such script is thus in some way independent of Linux distribution.

Querying of Python and pip version is implemented in `discover.sh` (which points to `Dockerfiles/discover.sh`) script.
This script is calling `python -V` (version printing option) and `python3 -V` to discover versions of python interpreters
from both families. It is also querying pip version in two ways: by calling `pip` commands and by executing pip module.
Results are printed on the screen and saved into *pip.ver* and *python.ver* files.

Actual study is done by `run.sh` script which loops over all docker images provided in `images.sh` files, 
installs python interpreter using `install.sh` script and makes query using `discover.sh`.
Summary of results is saved into `py2.ver` and `py3.ver` files.

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

Dockerfiles were generated using `Dockerfiles/generate.sh` script. 
We provide also script `Dockerfiles/generate.sh` which runs version discovery on abovementioned 
images (clean systems with Python and pip installed).

Automated testing
-----------------

This project comes also with Travis and wercker configurations. You can see results of automated tests here:

* https://travis-ci.org/grzanka/python-pip-versions
* https://app.wercker.com/grzanka/python-pip-versions/runs

Author
------

Leszek Grzanka (https://github.com/grzanka)
