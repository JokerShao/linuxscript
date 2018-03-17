#!/bin/bash
# filename: update.sh
# author: joker

# Change this before use the script
PASSWORD="YOURPASSWORD"

SCRIPT_INIT_PATH=$(realpath update.sh)
SCRIPT_WORK_PATH=$(dirname $(readlink -f "$0"))

function hosts {
    echo "#############################"
    echo "#   Update Hosts Start...   #"
    echo "#############################"
    echo $PASSWORD | sudo -S python $SCRIPT_WORK_PATH/Update_hosts.py
    # Other way:
    # sudo -S ./Update_hosts.py << EOF
    # $PASSWORD
    # EOF
    if [ $? -eq 1 ] || [ $? -eq 2 ] || [ $? -eq 3 ]
    then
		echo "exit"
        exit
    fi
}

function apt {
    echo "#############################"
    echo "#    Update apt Start...    #"
    echo "#############################"
    echo $PASSWORD | sudo -S apt update
    sudo apt upgrade
    sudo apt autoremove
    sudo apt autoclean
}

function pip {
    echo "#############################"
    echo "#    Update pip Start...    #"
    echo "#############################"
    echo $PASSWORD | sudo -S python $SCRIPT_WORK_PATH/Update_pip.py
}

function pip3 {
    echo "#############################"
    echo "#    Update pip3 Start...   #"
    echo "#############################"
    echo $PASSWORD | sudo -S python3 $SCRIPT_WORK_PATH/Update_pip3.py
}

function database {
    echo "#############################"
    echo "#    Update database...     #"
    echo "#############################"
    echo $PASSWORD | sudo -S updatedb
    echo "update finished."
}

# Script run from there.
if [ $# -eq 0 ];then hosts; apt; database;
elif [ $# -eq 1 ];then
    if [ $1 = "-H" ] || [ $1 = "--help" ];then

        echo "update.sh - Update your hosts, apt and python package"
        echo "            Default update hosts and apt"
        echo "            ******************************************"
        echo "            * You should edit it and change PASSWORD *"
        echo "            * to your password before use it.        *"
        echo "            ******************************************"
        echo " "
        echo "usage: ./update.sh [arguments]"
        echo " "
        echo "Arguments:"
        echo "   --init                          Script init"
        echo "   -h  or  --hosts                 Only update hosts"
        echo "   -a  or  --apt                   Only update apt"
		echo "   -d  or  --database              update database in /var/cache/locate/locatedb"
        echo "   -p                              Only update pip"
        echo "   -p3                             Only update pip3"
        echo "   -A                              Update all"
        echo "   -H  or  --help                  Print Help(this message) and exit"
        exit 0

    elif [ $1 = "--init" ];then
        ln -s $SCRIPT_INIT_PATH ~/update
        echo "Init Success!"
    elif [ $1 = "-h" ] || [ $1 = "--hosts" ];then hosts; exit 0
    elif [ $1 = "-a" ] || [ $1 = "--apt" ];then apt; exit 0
	elif [ $1 = "-d" ] || [ $1 = "--database" ];then database; exit 0
    elif [ $1 = "-p" ];then pip; exit 0
    elif [ $1 = "-p3" ];then pip3; exit 0
    elif [ $1 = "-A" ];then
        hosts
        apt
        sleep 1
        pip
        sleep 1
        pip3
        exit 0
    else
        echo "Use -H or --help to get help."
        exit 0
    fi
else
    echo "Arguments error, check your input."
    echo "Use -H or --help to get help."
    exit 0
fi
