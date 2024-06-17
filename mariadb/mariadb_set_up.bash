apt install gettext-base -y

source /.env
mariadbd &
sleep 1
mariadb <<< "CREATE DATABASE $DB_DATABASE;"
mariadb <<< "GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER
				  ON $DB_DATABASE.*
                  TO $DB_USER_NAME@'%'
                  IDENTIFIED BY '$DB_USER_PASSWORD';"
mariadb <<< "FLUSH PRIVILEGES;"

apt remove gettext-base -y
