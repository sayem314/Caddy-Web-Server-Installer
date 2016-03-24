#!/bin/bash
#
#
# Caddy Web Server Installer
#
#
 caddycheck=`[ -e /usr/local/bin/caddy ] && echo "Found" || echo "Not"`
 if [ "$caddycheck" == 'Found' ]; then
	echo ""
	echo "  Removing old Caddy script"
	rm -f /usr/local/bin/caddy
 fi
 echo ""
 echo "  Setting up Caddy"
 cd /tmp
 wget -q yesgig.com/downloads/caddy
 chmod +x caddy
 mv caddy /usr/local/bin
 echo "  Done. run 'caddy' to use Caddy"
 echo ""
 exit
 