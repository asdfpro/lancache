# REMEMBER EDIT IP ADDRESSES AND NETMASK BEFORE RUN
# Stop NGINX service
service nginx stop
# Add Uplay to lancache.conf
cat >> /etc/nginx/vhosts/lancache.conf <<EOF
# Uplay (Ubisoft)
server {
	listen lancache-uplay default;
	server_name uplay _;
	access_log /lancache/logs/uplay-access.log main buffer=128k flush=1m;
	error_log /lancache/logs/uplay-error.log;
	include lancache/node-default;
}

EOF
# Modify with 1 unused IP for this hostname
cat >> /etc/hosts <<EOF
192.168.0.0 lancache-uplay
EOF
# Add static addressing to your primary interface
# Put the same IP from hostname for this interface
cat >> /etc/network/interfaces <<EOF
iface eth0 inet static
	address 192.168.0.0
	netmask 255.255.255.0
EOF
# Reload network config
service networking reload
# Start NGINX service
service nginx start
