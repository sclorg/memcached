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
# Authors: Jan Scotka <jscotka@redhat.com>
#

import pexpect
from avocado import main
from avocado.core import exceptions
from moduleframework import module_framework
from moduleframework import common


class SanityCheck1(module_framework.AvocadoTest):
    """
    :avocado: enable
    """

    def test_smoke(self):
        self.start()
        session = pexpect.spawn("telnet %s %s " % (self.ip_address,
                                                   self.getConfig()['service']['port']))
        session.sendline('set Test 0 100 4\r\n\n')
        session.sendline('JournalDev\r\n\n')
        common.print_info('Expecting STORED')
        session.expect('STORED')
        common.print_info('STORED was catched')
        session.close()


if __name__ == '__main__':
    main()
