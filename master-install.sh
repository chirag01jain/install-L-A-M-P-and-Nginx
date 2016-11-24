#!/usr/bin/env bash

#
# Author: Chirag Jain
# License: GNU GPL v2.0
# Description: The script is used for the installation of web-server (apache/nginx), PHP 5.4 and MySQL Server.
#

main() {
	clear
	echo -e "-----------------------------------------------"
	echo -e "Press the numbers for their corresponding tasks"
	echo -e "1. Install Nginx with PHP 5.4"
	echo -e "2. Install Apache with PHP 5.4"
	echo -e "3. Install MySQL Server 5.5"
	echo -e "4. Exit"
	echo -e "-----------------------------------------------"
	prerequisites
	installServers

}

prerequisites() {
	txtBold=`tput bold`
	txtNormal=`tput sgr0`
}

takeUserInput() {
	unset "USERINPUT"
	read -e USERINPUT
	if [[ -z "$USERINPUT" ]]; 
		then
			echo -e "${txtBold}Please choose at least one option...\n${txtNormal}"
			takeUserInput
	fi
}

installServers() {
	takeUserInput
	case "$USERINPUT" in
		1)
			sh install-nginx-php.sh
		;;

		2)
			sh install-apache-php.sh
		;;

		3)
			sh install-mysql-server.sh
		;;

		4)
			clear
			echo -e "For other technical stuff please visit the following sites:\nhttp://indexlinux.com"
			exit 0

		;;

		*)
			echo -e "${txtBold}Invalid input supplied...\nPlease choose the correct option.${txtNormal}"
			installServers
	esac
}

main