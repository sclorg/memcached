# memcached

Memcached is High Performance, Distributed Memory Object Cache

## Summary

- Dockerfile - build container image with memcached.
- openshift-template.yml - Template for OpenShift to memcached.


## How to use the container over standard 25 port

Command for running memcached docker container:

```bash
docker run -it -e CACHE_SIZE=128 \
    -p 11211:11211
```

If you would like to increase a CACHE_SIZE use environment variable -e CACHE_SIZE:
```bash
docker run -it -e CACHE_SIZE=128 \
    -p 11211:11211
```

## How to test the memcached

Commands for testing memcached docker container:

To store data in memcached server with telnet:
```bash
set KEY META_DATA EXPIRY_TIME LENGTH_IN_BYTES
```

To get data
```bash
get KEY
```

To overwrite existing key
```bash
replace KEY META_DATA EXPIRE_TIME LENGTH_IN_BYTES
```

To delete key
```bash
delete KEY
```

To get the server statistics
```bash
stats
stats items
stats slabs

```

To clear the metadata statistics
```bash
flush all
```