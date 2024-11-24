#!/bin/bash

# Initialize the MariaDB data directory
mysql_install_db --user=mysql --ldata=/var/lib/mysql

# Start the MariaDB server in the background
mysqld_safe &

# Wait for the MariaDB server to start
sleep 20

# Check if the MariaDB server is running
if ! mysqladmin ping -u root --silent; then
  echo "MariaDB server failed to start."
  exit 1
fi

# Execute the SQL commands
mysql -u root <<EOF
CREATE DATABASE $SQL_DATABASE;
CREATE USER '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASS';
GRANT ALL PRIVILEGES ON *.* TO '$SQL_USER'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

# Keep the MariaDB server running
wait
echo "got out of the wait script."