echo 'deb http://ftp.us.debian.org/debian jessie main' | tee --append /etc/apt/sources.list
apt install aptitude
aptitude install coturn
internalIp="$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')"
externalIp="$(dig +short myip.opendns.com @resolver1.opendns.com)"

echo "listening-port=3478
tls-listening-port=5349

listening-ip="$internalIp"

relay-ip="$internalIp"
external-ip="$externalIp"

realm=3dstreamingturnubuntu.com
server-name=3dstreamingturnubuntu.com

lt-cred-mech
userdb=/var/lib/turn/turndb

# use real-valid certificate/privatekey files
cert=/etc/ssl/certificate.pem
pkey=/etc/ssl/private.key
 
no-stdout-log"  | tee /etc/turnserver.conf

turnadmin -a -u user -p 3Dstreaming0317 -r 3dstreamingturnubuntu.com

sudo turnserver

