Memcached container images
========================

This repository contains Dockerfiles for Memcached images.
Users can choose between RHEL, Fedora and CentOS based images.

For more information about contributing, see
[the Contribution Guidelines](https://github.com/sclorg/welcome/blob/master/contribution.md).
For more information about concepts used in these container images, see the
[Landing page](https://github.com/sclorg/welcome).


Versions
---------------
Memcached versions currently supported are:
* [1.5](https://github.com/sclorg/memcached/tree/master/1.5)

RHEL versions currently supported are:
* RHEL8


Installation
----------------------
*  **RHEL8 based image**

    To build a RHEL8 based image, you need to run Docker build on a properly
    subscribed RHEL machine.

    ```
    $ git clone --recursive https://github.com/sclorg/memcached.git
    $ cd memcached
    $ make build TARGET=rhel8 VERSIONS=1.5
    ```

*  **Fedora based image**

    ```
    $ git clone --recursive https://github.com/sclorg/memcached.git
    $ cd memcached
    $ make build TARGET=fedora VERSIONS=1.5
    ```

**Notice: By omitting the `VERSIONS` parameter, the build/test action will be performed
on all provided versions of Memcached.**

Usage
---------------------------------

For information about usage of Dockerfile for Memcached 1.5,
see [usage documentation](https://github.com/sclorg/memcached/tree/master/1.5).

Test
---------------------------------

This repository also provides a test framework, which checks basic functionality
of the Memcached image.

*  **RHEL8 based image**

    To test a RHEL8 based Memcached image, you need to run the test on a properly
    subscribed RHEL machine.

    ```
    $ cd memcached
    $ make test TARGET=rhel8 VERSIONS=1.5
    ```

*  **Fedora based image**

    ```
    $ cd memcached
    $ make test TARGET=fedora VERSIONS=1.5
    ```

**Notice: By omitting the `VERSIONS` parameter, the build/test action will be performed
on all provided versions of Memcached.**
