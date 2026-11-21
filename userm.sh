#!/bin/bash

echo "___________USER MANAGEMENT___________"
if [[ "$EUID" -ne 0 ]]; then
	echo "ROOT PRIVILLEGES REQUIRED...!!! UNABLE TO PROCEED"
exit 1
fi

echo "__________MENU_________"
echo "1. User Creation"
echo "2.User Modification"
echo "3.User Deletion"
read -p "Enter Your Choice(1,2 or 3): "  CHOICE

if [[ "$CHOICE" == 1 ]]; then
	echo "--------USER CREATION-----------"
	read -p "Enter the username :"  USER

	if id  "$USER" &>/dev/null ; then
		echo "USER ALREADY EXISTS.. TRY NEW NAME.."
	exit 1

	else
		read -p "enter the default shell:" SHELL
	 	useradd -m -s "$SHELL" "$USER"
		echo "USER HAS BEEN CREATED"
		read -p "Do you wish to set password for the created user(y/n): " OPTION

		if [[ "$OPTION" -eq "n" ]] || [[ "$OPTION" -eq "N" ]]; then
                        echo "PASSWORD NOT SET...USER CREATED"
		exit 1
		fi

		if [[ "$OPTION" -eq "y" ]] || [[ "$OPTION" -eq "Y" ]]; then
			passwd "$USER"
		fi
	fi
fi

if [[ "$CHOICE" == 2 ]]; then
	echo "---------------USER MODIFICATION---------------"
	echo "1.Rename User"
	echo "2.Change User Shell "
	echo "3.Change Directory"
	read -p "Enter your choice(1,2,3):"  VALUE


	if [[ "$VALUE" == 1 ]]; then
		read -p "enter the username of existing user:" OLD
		read -p "enter the new username: " NEW
		usermod -l  "$NEW" "$OLD"
		echo "USERNAME CHANGED"
	fi


	if [[ "$VALUE" == 2 ]]; then
		read -p "Enter the existing user:" OLD
		read -p  "Enter the shell needed for the user:" SH
		usermod -s "$SH" "$OLD"
		echo "Shell Changed"
	fi

	if [[ "$VALUE" == 3 ]]; then
		read -p "Enter existing user:" OLD
		read -p "Enter the directory:" DIR
		usermod -d /home/"$DIR" "$OLD"
		echo "directory changed"
	fi

fi

if [[ "$CHOICE" == 3 ]]; then
	read -p "enter the username to be deleted :" USER
	userdel -r "$USER"
   	echo "$USER deleted successfully"

fi

