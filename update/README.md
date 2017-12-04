# updateScript

## Usage:
* First:

		If you are used the script first time, you should run this script with arguements "--init"
		and change the variable "PASSWORD" in update.sh to your root password.
		It will create a symbolic link to update.sh in ~/ , so you can use ./update in your home direction.

* Initialzation:

		$ git clone git@github.com:JokerShao/updateScript.git

		$ cd updateScript/

		$ ./update.sh --init

		$ vi/vim update.sh

* Help message:

		update.sh - Update your hosts, apt and python package
		            Default update hosts and apt
		            ******************************************
		            * You should edit it and change PASSWORD *
		            * to your password before use it.        *
		            ******************************************
		 
		usage: ./update.sh [arguments]
 
		Arguments:
			--init                          Script init
			-h  or  --hosts                 Only update hosts
			-a  or  --apt                   Only update apt
			-p                              Only update pip
			-p3                             Only update pip3
			-A                              Update all
			-H  or  --help                  Print Help(this message) and exit

## License
update.sh is released under the LGPL license. See [LICENSE](https://raw.githubusercontent.com/JokerShao/updateScript/master/LICENSE) for details.
