#!/bin/bash
#
# qbittorrent-installer by @sayem314
#

# Global value
user="qbtuser"
home="/home/$user"

# Creating non-root user
[[ -d $installdir ]] || mkdir -p $installdir
echo "Creating user '$user'"
if id -u $user >/dev/null 2>&1; then
	echo "User '$user' already exists. Skipped!"
else
	useradd -r -m -s /bin/false $user
fi

echo "Installing qbitorrent"
apt-get install sed sudo qbittorrent-nox -y

sudo -u "$user" HOME="$home" /bin/bash <<'SU_END'
yes | qbittorrent-nox &
sleep 2
pkill qbittorrent-nox
SU_END

clear
sed -i -e 's/Port=8080/Port=9091/g' $home/.config/qBittorrent/qBittorrent.conf

# Create startup service
init=$(cat /proc/1/comm)
if [[ "$init" == "systemd" ]]; then
	echo "Creating systemd service"
	echo "[Unit]
Description=qBittorrent Daemon Service
After=network.target

[Service]
Type=simple
User=qbtuser
ExecStart=/usr/bin/qbittorrent-nox
Restart=always
RestartSec=2
TimeoutStopSec=5

[Install]
WantedBy=multi-user.target
"> /etc/systemd/system/qbittorrent.service
	chmod 0644 /etc/systemd/system/qbittorrent.service
	systemctl daemon-reload
	systemctl enable qbittorrent
	service qbittorrent start
fi

echo "Install finished. Default settings:"
echo "User: admin"
echo "Password: adminadmin"
echo "Port: 9091"
