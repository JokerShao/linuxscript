#!/bin/bash
PASSWORD="letmefly"
echo $PASSWORD | sudo -S swapoff -a
echo $PASSWORD | sudo -S swapon -a
