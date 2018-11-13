memcached container image
=========================

Description
-----------

memcached is a high-performance, distributed memory object caching system,
generic in nature, but intended for use in speeding up dynamic web applications
by alleviating database load.

Usage
-----

```
$ docker run -d --name memcached -p 11211:11211 rhel8/memcached
```

Command-line options supported by `memcached` may be specified as arguments of
the `run` command. For example, the following command increases the maximum
amount of memory to 128 megabytes and enables debug messages:

```
$ docker run -d --name memcached -p 11211:11211 rhel8/memcached -m 128 -vv
```

Environment variables
---------------------

`memcached` started in the container can be also configured with the
following environment variables:

**`MEMCACHED_MAX_MEMORY`**
	Specify the maximum amount of memory used for object storage in
	megabytes. The default value is 64 megabytes.

**`MEMCACHED_MAX_CONNECTIONS`**
	Specify the maximum number of client connections. The default value is
	1024.

**`MEMCACHED_SLAB_PAGE_SIZE`**
	Specify the default size of the slab page. The default value is 1m.

**`MEMCACHED_EXTRA_PARAMETERS`**
	Specify any command-line options supported by `memcached`.
