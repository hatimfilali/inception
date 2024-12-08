FROM debian:bullseye

RUN apt update -y && \
  apt install -y php \
	php-cgi \
	php-mysql \
	php-fpm \
	php-pdo \
	php-gd php-cli \
	php-mbstring \
  mariadb-client curl wget && \
  rm -rf /var/lib/apt/lists/*

RUN wget https://wordpress.org/wordpress-6.7.1.tar.gz && \
    tar -xvzf wordpress-6.7.1.tar.gz && \
    mv wordpress/* /var/www/html/ && \
    rm -rf wordpress-6.7.1.tar.gz wordpress

WORKDIR /var/www/html

COPY tools/init.sh  /bin/init.sh

RUN chmod +x /bin/init.sh

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/

RUN mkdir -p /run/php/

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

ENTRYPOINT ["/bin/init.sh"]

CMD ["php-fpm7.4",  "-F"]