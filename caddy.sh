#!/bin/bash
#
#
# Caddy Web Server Installer
#
#

 echo ""
 echo "Removing any previous version"
 rm -f /usr/local/bin/caddy
 echo ""
 echo "  Setting up Caddy"
 cd /tmp
 wget -q https://raw.githubusercontent.com/sayem314/Caddy-Web-Server-Installer/master/caddy
 chmod +x caddy
 mv caddy /usr/local/bin
 echo "  Done. run 'caddy' to use Caddy"
 echo ""
