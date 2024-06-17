#!/bin/bash

apt install curl -y

curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o /usr/local/bin/wp \
	&& chmod +x /usr/local/bin/wp

mkdir -p /var/www/html/wordpress
mkdir -p /run/php/
cd /var/www/html/wordpress
wp core download --path=/var/www/html/wordpress --allow-root
wp config create --path=/var/www/html/wordpress --allow-root --dbname=$DB_DATABASE --dbhost=$DB_HOST --dbprefix=wp_ --dbuser=$DB_USER_NAME --dbpass=$DB_USER_PASSWORD
wp core install --path=/var/www/html/wordpress --allow-root --url=$DOMAIN_NAME --title="$WP_SITE_TITLE" --admin_user=$WP_ADMIN_NAME --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL
wp plugin update --path=/var/www/html/wordpress --allow-root --all
wp user create --path=/var/www/html/wordpress --allow-root $WP_USER_NAME $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD
chown -R www-data:www-data /var/www/html/wordpress/

apt remove curl -y
apt clean -y
rm /wordpress_set_up.bash

php-fpm8.2 --nodaemonize
