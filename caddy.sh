#!/bin/bash
#
#
# Caddy Web Server Installer
#
#

main () {
 caddycheck=`[ -e /usr/local/bin/caddy ] && echo "Found" || echo "Not"`
 if [ "$caddycheck" == 'Found' ]; then
	echo ""
	echo "  Removing old Caddy script"
	rm -f /usr/local/bin/caddy
 fi
 echo ""
 echo "  Setting up Caddy"
 cd /tmp
 wget -q https://raw.githubusercontent.com/sayem314/Caddy-Web-Server-Installer/master/caddy
 chmod +x caddy
 mv caddy /usr/local/bin
 echo "  Done. run 'caddy' to use Caddy"
 echo ""
}

case $1 in
	*)
		main;;
esac
