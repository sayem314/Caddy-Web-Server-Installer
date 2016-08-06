#!/bin/bash
#
# Caddy Web Server Startup
#

do_start () {
	/usr/local/bin/caddy start
}

do_stop () {
	/usr/local/bin/caddy stop
}

do_reload () {
	/usr/local/bin/caddy reload
}

case "$1" in
  start|"")
        do_start
        ;;
  restart|reload|force-reload)
        do_reload
        ;;
  stop|status)
        do_stop
        ;;
  *)
        echo "Usage: runcaddy.sh [start|stop]" >&2
        exit 1
        ;;
esac

:

