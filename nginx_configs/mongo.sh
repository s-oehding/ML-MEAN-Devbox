# Create Apache2 Vhost conf
# --------------------
VHOST=$(cat <<EOF
server {
    listen 80;
    server_name mongo.$1;
    location / {
        proxy_set_header   X-Real-IP \$remote_addr;
        proxy_set_header   Host      \$http_host;
        proxy_pass         http://127.0.0.1:1234;
    }
}
EOF
)

echo "$VHOST" > /etc/nginx/sites-available/mongo.$1.conf
sudo ln -s /etc/nginx/sites-available/mongo.$1.conf /etc/nginx/sites-enabled/mongo.$1