#!/bin/bash
### BEGIN INIT INFO
# Provides:          Caddy Web Server Startup
# Required-Start:    
# Required-Stop:     
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Start Caddy Web Server on boot
# Description:       Enable Caddy Web Server on boot
### END INIT INFO

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

