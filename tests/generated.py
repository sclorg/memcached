#!/usr/bin/python

import socket
from avocado import main
from moduleframework import module_framework

if __name__ == '__main__':
    main()

class GeneratedTestsConfig(module_framework.AvocadoTest):
    """
    :avocado: enable
    """

    def test_processrunning(self):
        self.start()
        self.run("ls  /proc/*/exe -alh | grep memcached")

    def test_selfcheck(self):
        self.start()
        self.runHost("echo errr | nc localhost 11211")
        self.runHost("echo set AAA 0 4 2 | nc localhost 11211")
        self.runHost("echo get AAA | nc localhost 11211")

    def test_selcheckError(self):
        self.start()
        self.runHost("echo errr | nc localhost 11211 |grep ERROR")
