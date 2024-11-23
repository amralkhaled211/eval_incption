#!/bin/bash


#Wait for the database to be ready
until mysql -h "$WORDPRESS_DB_HOST" -u "$WORDPRESS_DB_USER" -p"$WORDPRESS_DB_PASSWORD" -e "SHOW DATABASES;" > /dev/null 2>&1; do
  echo -e "\e[33mWaiting for database connection...\e[0m"
  sleep 5
done

echo -e "\e[33mAfter the loop\e[0m"

cd /var/www/html

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --dbhost=$WORDPRESS_DB_HOST --allow-root
./wp-cli.phar core install --url=$WORDPRESS_WP_URL --title=$WORDPRESS_WP_TITLE --admin_user=$WORDPRESS_WP_ADMIN_USER --admin_password=$WORDPRESS_WP_ADMIN_PASS --admin_email=$WORDPRESS_WP_ADMIN_EMAIL --allow-root
./wp-cli.phar user create $NEW_USER_NAME $NEW_USER_EMAIL --role=author --user_pass=$NEW_USER_PASS --allow-root


php-fpm7.4 -F