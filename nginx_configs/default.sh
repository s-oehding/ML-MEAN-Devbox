# Create Apache2 Vhost conf
# --------------------
mkdir -p /var/www/html
VHOST=$(cat <<EOF
server {

    server_name $1 www.$1;

    listen 80 default_server;
    listen [::]:80 default_server ipv6only=on;

    root /var/www/html;
    index index.html index.htm;
}
EOF
)
echo "$VHOST" > /etc/nginx/sites-available/$1.conf
ln -s /etc/nginx/sites-available/$1.conf /etc/nginx/sites-enabled/$1