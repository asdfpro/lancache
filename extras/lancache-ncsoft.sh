# REMEMBER EDIT IP ADDRESSES AND NETMASK BEFORE RUN
# Stop NGINX service
service nginx stop
# Add NCSoft to lancache.conf
cat >> /etc/nginx/vhosts/lancache.conf <<EOF
# NC Soft
server {
	listen lancache-ncsoft default;
	server_name ncsoft _;
	access_log /lancache/logs/ncsoft-access.log main buffer=128k flush=1m;
	error_log /lancache/logs/ncsoft-error.log;
	include lancache/node-ncsoft;
}

EOF
# Copy NCSoft node
cp /opt/lancache/extras/node-ncsoft /etc/nginx/lancache/node-ncsoft
# Modify with 1 unused IP for this hostname
cat >> /etc/hosts <<EOF
192.168.0.0 lancache-ncsoft
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
