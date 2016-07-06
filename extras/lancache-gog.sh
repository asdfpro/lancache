# REMEMBER EDIT IP ADDRESSES AND NETMASK BEFORE RUN
# Stop NGINX service
service nginx stop
# Add GOG to lancache.conf
cat >> /etc/nginx/vhosts/lancache.conf <<EOF
# GOG
server {
	listen lancache-gog default;
	server_name gog _;
	access_log /lancache/logs/gog-access.log main buffer=128k flush=1m;
	error_log /lancache/logs/gog-error.log;
	include lancache/node-gog;
}

EOF
# Copy GOG node
cp /opt/lancache/extras/node-gog /etc/nginx/lancache/node-gog
# Modify with 1 unused IP for this hostname
cat >> /etc/hosts <<EOF
192.168.0.0 lancache-gog
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
