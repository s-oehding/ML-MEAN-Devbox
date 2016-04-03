# Create Apache2 Vhost conf
# --------------------
VHOST=$(cat <<EOF
server {
    listen 80;

    server_name dashboard.$1;

    location / {
        proxy_pass http://127.0.0.1:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host \$host;
        proxy_cache_bypass \$http_upgrade;
    }
}
EOF
)
echo "$VHOST" > /etc/nginx/sites-available/dashboard.$1.conf
ln -s /etc/nginx/sites-available/dashboard.$1.conf /etc/nginx/sites-enabled/dashboard.$1