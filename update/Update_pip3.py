# -*- coding: utf-8 -*-
# filename: Update_pip3.py
# author: joker

import pip
from subprocess import call

for dist in pip.get_installed_distributions():
    call("pip3 install --no-cache-dir --upgrade " + dist.project_name, shell = True)
