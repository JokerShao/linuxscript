#!/bin/bash
PASSWORD="YOURPASSWORD"
echo $PASSWORD | sudo -S swapoff -a
echo $PASSWORD | sudo -S swapon -a
