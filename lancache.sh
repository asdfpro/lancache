#-------------------------------------------------------
# REMEMBER: Modify to fit with your IP before execute
#-------------------------------------------------------
# Stop NGINX service
service nginx stop
# Create a backup for original NGINX
mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.backup
# Copy of LAN Cache files
cp -r /opt/lancache/nginx.conf /etc/nginx/nginx.conf
cp -r /opt/lancache/vhosts/lancache.conf /etc/nginx/vhosts/lancache.conf
cp -r /opt/lancache/lancache /etc/nginx/lancache
# Modify with 1 unused IP for each hostname
cat >> /etc/hosts <<EOF
# LAN Cache host names
192.168.0.201 lancache-steam
192.168.0.202 lancache-riot
192.168.0.203 lancache-blizzard
192.168.0.204 lancache-hirez
192.168.0.205 lancache-origin
EOF
# Add static addressing to your primary interface
# Put the same IP from hostnames for each interface
cat >> /etc/network/interfaces <<EOF
# LAN Cache Network interfaces
iface eth0 inet static
	address 192.168.0.201
	netmask 255.255.255.0
iface eth0 inet static
	address 192.168.0.202
	netmask 255.255.255.0
iface eth0 inet static
	address 192.168.0.203
	netmask 255.255.255.0
iface eth0 inet static
	address 192.168.0.204
	netmask 255.255.255.0
iface eth0 inet static
	address 192.168.0.205
	netmask 255.255.255.0
EOF
# Reload networks changes
service networking reload
# Create system user for nginx
adduser --system --no-create-home www
addgroup --system www
usermod -aG www www
# Create LAN Cache directories and assign permissions
mkdir -p /lancache/installs
mkdir -p /lancache/other
mkdir -p /lancache/logs
mkdir -p /lancache/tmp
chown -R www /lancache
