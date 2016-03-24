#!/bin/bash
#
#
# Caddy Web Server Installer
#
#

	# Installing speed test
	echo ""
	echo "  Setting up Caddy"
	wget -q --no-check-certificate https://raw.githubusercontent.com/sayem314/Caddy-Web-Server-Installer/master/caddy && mv caddy /usr/local/bin/caddy && chmod +x /usr/local/bin/caddy
	echo ""
	
