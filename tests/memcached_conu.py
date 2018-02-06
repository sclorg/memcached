#!/usr/bin/python
# -*- coding: utf-8 -*-
#
# This Modularity Testing Framework helps you to write tests for modules
# Copyright (C) 2017 Red Hat, Inc.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# he Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
#

import pexpect
import conu, logging
from conu import DockerBackend


def test_conu():
    """
    Function tests memcached container with conu
    """
    backend = DockerBackend(logging_level=logging.DEBUG)
    i = backend.ImageClass("docker.io/modularitycontainers/memcached")
    i.pull()
    rb = conu.DockerRunBuilder(command=["/files/memcached.sh"])
    c = i.run_via_binary(rb)
    assert c.is_running()
    c.wait_for_port(11211)
    session = pexpect.spawn("telnet %s 11211 " % c.get_IPv4s()[0])
    session.sendline('set Test 0 100 10')
    session.sendline('JournalDev')
    assert session.expect('STORED') == 0
    session.sendline('quit')


if __name__ == '__main__':
    test_conu()
