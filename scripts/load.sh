# Start Mongodb
# --------------------
sudo service mongodb start

# Start Admin Mongo
# --------------------
cd /var/www/mongo
echo "Admin Mongo Installed - Visit http://127.0.0.1:1234 in your browser"
forever start app.js

# Start Mailcatcher
# --------------------
# mailcatcher --http-ip=$1
