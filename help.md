% MEMCACHED(1) Container Image Pages
% Petr Hracek
% February 6, 2017

# NAME
memcached - High Performance, Distributed Memory Object Cache.

# DESCRIPTION
Memcached is a high-performance, distributed memory object caching system, generic in nature, but intended for use in speeding up dynamic web applications by alleviating database load.

The container itself consists of:
    - fedora/24 base image
    - memcached RPM package

Files added to the container during docker build include: /files/memcached.sh

# USAGE
To get the memcached container image on your local system, run the following:

    docker pull hub.docker.io/phracek/memcached 

  
# ENVIRONMENT VARIABLES
The memcached container includes the following environment variables:

CACHE_SIZE=128
    The variable sets size of cached used by memcached.
        
# SECURITY IMPLICATIONS
Lists of security-related attributes that are opened to the host.

-p 11211:11211
    Opens container port 11211 and maps it to the same port on the host.

# SEE ALSO
Memcached page
<https://memcached.org/>
