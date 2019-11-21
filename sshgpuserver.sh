#!/bin/bash

if [ "$1" = "--tensorboard" ]; then
	echo 'ssh with port forwarding.'
	ssh -L 14398:localhost:5245 zxshao@192.168.3.156
else
	ssh zxshao@192.168.3.156
fi

