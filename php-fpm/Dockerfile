FROM debian:12

RUN apt update && apt upgrade && apt install php php-fpm php-mysql -y
RUN apt clean -y

COPY www.conf /etc/php/8.2/fpm/pool.d/www.conf
COPY wordpress_set_up.bash /wordpress_set_up.bash

CMD ["bash", "/wordpress_set_up.bash"]
