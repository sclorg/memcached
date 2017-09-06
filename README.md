# memcached

Memcached is High Performance, Distributed Memory Object Cache

## How to use the container

Pull the image from Docker Hub:

```bash
$ sudo docker pull modularitycontainers/memcached
```

Run the container

```bash
docker run -it -p 11211:11211 --name memcached modularitycontainers/memcached
```

If you would like to change memcached options, like cache_size, connections or threads, use environment variable -e MEMCACHED_CACHE_SIZE, -e MEMCACHED_CONNECTIONS, -e MEMCACHED_THREADS respectively:
```bash
docker run -it -p 11211:11211
[-e MEMCACHED_CACHE_SIZE=<size_in_MB>]
[-e MEMCACHED_CONNECTIONS=<max_simultaneous_connections>]
[-e MEMCACHED_THREADS=<max_concurrent_threads>]
--name memcached modularitycontainers/memcached
```

## A demo

Here is a simple demo how to run memcached

* Copy systemd service which will take care of memcached container: 
   ```bash
   $ sudo cp -av memcached-container.service /usr/lib/systemd/system/
   $ sudo systemctl daemon-reload
   ```

* We can start memcached now:
  ```bash
  $ sudo systemctl start memcached-container
  ```

* You should be able to test memcached by commands (taken from http://www.journaldev.com/16/memcached-telnet-commands-with-example):
  ```bash
  set Test 0 100 10
  JournalDev
  STORED
  get Test
  VALUE Test 0 10
  JournalDev
  END
  replace Test 0 100 4
  Temp
  STORED
  get Test
  VALUE Test 0 4
  Temp
  END
  stats items
  STAT items:1:number 1
  STAT items:1:age 19
  STAT items:1:evicted 0
  STAT items:1:evicted_time 0
  STAT items:1:outofmemory 0
  STAT items:1:tailrepairs 0
  END
  flush_all
  OK
  get Test
  END
  version
  VERSION 1.4.25
  quit
  ```

## Repository structure

- Dockerfile - build container image with memcached.
- openshift-template.yml - Template for OpenShift to memcached.
