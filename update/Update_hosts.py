# -*- coding: utf-8 -*-
# filename: Update_hosts.py
# author: joker

import urllib2
import re
import sys
import os

class NetworkError(Exception):
    pass
class WriteError(Exception):
    pass

def get_hosts():
    print "Get hosts file start..."
    # url = "https://raw.githubusercontent.com/racaljk/hosts/master/hosts"
    url = "https://raw.githubusercontent.com/googlehosts/hosts/master/hosts-files/hosts"
    try:
        request = urllib2.Request(url)
        raw_hosts = urllib2.urlopen(request).read()
    except urllib2.URLError:
        print "Network connect failed!"
        raise NetworkError
    else:
        return raw_hosts, raw_hosts[98:108]

def write2hosts(raw_hosts):
    print "Write hosts file start..."
    try:
        f = file('/etc/hosts', 'w+')
        f.writelines(raw_hosts)
        f.close()
    except IOError:
        print "Write hosts to local failed!"
        raise WriteError

def main():
    print "\nUpdate your hosts file start..."
    try:
        raw_hosts, date = get_hosts()
        write2hosts(raw_hosts)
    except NetworkError:
        print "Please check your network connection."
        sys.exit(1)
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

