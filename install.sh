#!/bin/bash
# Author: Ximing Hu
# This script helps installing Ghost Chat on a GNU/Linux server.
# Works on RHEL 9 and its variants.

# Check if this script is being run as root
if [ $EUID -ne 0 ]; then
   echo "This script must be run as root."
   exit 1
fi

# Record if MySQL is installed
unset MYSQL_HAS_INSTALLED
MYSQL_HAS_INSTALLED=0
if dnf list installed mysql-server > /dev/null; then
   MYSQL_HAS_INSTALLED=1
fi

# Install requred packages
dnf update -y
dnf install -y nginx java-17-openjdk-devel mysql-server npm git rsync


# Configure firewall rules to allow port 80, 443
firewall-cmd --permanent --add-port={80/tcp,443/tcp}
firewall-cmd --reload

# Configure nginx
systemctl enable nginx
systemctl start nginx

# WARNING: this will clear existing content of chat_app.conf
tee /etc/nginx/default.d/chat_app.conf > /dev/null <<EOT
location /api/ {
   proxy_pass http://localhost:8080;
   proxy_set_header Host               \$host;
   proxy_set_header X-Real-IP          \$remote_addr;
   proxy_set_header X-Forwarded-For    \$proxy_add_x_forwarded_for;
   proxy_set_header X-Forwarded-Host   \$host;
   proxy_set_header X-Forwarded-Server \$host;
   proxy_set_header X-Forwarded-Port   \$server_port;
   proxy_set_header X-Forwarded-Proto  \$scheme;
}
EOT

# Set SELinux to allow NGINX to forward traffic
setsebool -P httpd_can_network_connect 1

systemctl restart nginx

# Create a temporary directory for building
unset INSTALL_DIR
readonly INSTALL_DIR=/tmp/ghost-chat-install

if [ -d $INSTALL_DIR ]; then
    rm -rf $INSTALL_DIR
fi
mkdir $INSTALL_DIR
cd $INSTALL_DIR

# Build and deploy frontend webpage
dnf install 
git clone https://github.com/LJC0414/GhostChat.git
cd GhostChat/
npm install
npm run build
rsync -a --delete dist/ /usr/share/nginx/html/
cd $INSTALL_DIR

# Configure MySQL
systemctl start mysqld.service
systemctl enable mysqld.service
if [ $MYSQL_HAS_INSTALLED -eq 1 ]; then
   mysql_secure_installation
fi

unset MYSQL_ROOT_PASS DB_NAME DB_USER DB_PASS
read -s -p "Enter MySQL root user password: "
DB_NAME=ghost_chat
DB_USER=ghost_chat_user
DB_PASS=
echo "Creating a new MySQL user \"$DB_USER\"."
read -s -p "Enter password for the new user: " DB_PASS

tee mysql_chat_init.sql > /dev/null <<EOT
CREATE DATABASE $DB_NAME;
CREATE USER '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASS';
GRANT ALL ON $DB_NAME.* TO '$DB_USER'@'localhost';
EOT

echo "Logging in to MySQL as root user."
mysql -uroot -p$MYSQL_ROOT_PASS < "$PWD/mysql_chat_init.sql"
unset MYSQL_ROOT_PASS

# Build and deploy backend server
git clone https://github.com/hu-ximing/chat-server.git
cd chat-server/
chmod +x mvnw
./mvnw install
mkdir /usr/local/chat-server/
mv -f target/chat-server-*.jar /usr/local/chat-server/chat-server.jar
cd $INSTALL_DIR

# Create application group and user
useradd ghost-chat --no-create-home --shell /sbin/nologin --comment "Ghost Chat server"

# Configure backend server as a systemd service
tee /etc/systemd/system/ghost-chat.service > /dev/null <<EOT
[Unit]
Description=Backend service for Ghost Chat
After=syslog.target network.target mysqld.service

[Service]
SuccessExitStatus=143

User=ghost-chat
Group=ghost-chat

Type=simple

ExecStart=java -jar /usr/local/chat-server/chat-server.jar
ExecStop=/bin/kill -15 $MAINPID

[Install]
WantedBy=multi-user.target
EOT

systemctl enable ghost-chat.service
systemctl start ghost-chat.service
