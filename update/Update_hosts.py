# -*- coding: utf-8 -*-
# filename: Update_hosts.py
# author: joker

import urllib2
import re
import sys
import os


class NetworkError(Exception):
    """ doc string """
    pass


class WriteError(Exception):
    """ doc string """
    pass


def get_hosts():
    print 'Get hosts file start...'
    # proxies = 
    proxy_s = urllib2.ProxyHandler({"socks5": "127.0.0.1:8080"})
    opener = urllib2.build_opener(proxy_s)
    urllib2.install_opener(opener)
    url = "https://raw.githubusercontent.com/googlehosts/hosts/master/hosts-files/hosts"
    try:
        raw_hosts = urllib2.urlopen(url).read()
    except urllib2.URLError:
            print "Network connect failed!"
            raise NetwrokError
    else:
        return raw_hosts, raw_hosts[103:113]


def write2hosts(raw_hosts):
    print "Write hosts file start..."
    hostname = str(sys.argv[1])
    try:
        f = file('/etc/hosts', 'w+')
        f.writelines(raw_hosts)
        f.close()
        print "Write finished, change hostname..."
        f = open('/etc/hosts', 'r+')
        all_lines = f.readlines()
        f.seek(0)
        f.truncate()
        for line in all_lines:
            if line == '127.0.0.1\tlocalhost\n':
                line = line.replace('127.0.0.1\tlocalhost\n',
                                    '127.0.0.1\t'+hostname+'\n')
            f.write(line)
        f.close()
    except IOError:
        print "Write hosts to local failed!"
        raise WriteError


def main():
    print "\nUpdate your hosts file start..."
    try:
        raw_hosts, date = get_hosts()
        write2hosts(raw_hosts)
    except WriteError:
        print "Try sudo run this script."
        sys.exit(2)
    except KeyboardInterrupt:
        print "User interrupt."
        sys.exit(3)
    else:
        print "Update success!"
        print "The hosts date is %s." % date
        sys.exit(0)


if __name__ == '__main__':
    main()
