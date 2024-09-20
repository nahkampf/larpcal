FROM php:8.3-apache
#EXPOSE 80
#RUN mkdir -p /var/www/html/larpcal
#RUN mkdir -p /var/www/html/larpcal/app
#RUN mkdir -p /var/www/html/larpcal/src
#RUN chown -R www-data:www-data /var/www
#RUN apt-get update && \
#    apt-get install -y zip \
#        curl \
#        unzip && \
#    docker-php-ext-install mysqli pdo pdo_mysql
COPY conf/larpcal.conf /etc/apache2/sites-available/000-default.conf
#COPY conf/apache2.conf /etc/apache2/apache.conf
#RUN a2dismod -f autoindex
RUN a2ensite 000-default
RUN a2enmod rewrite
RUN service apache2 restart
#WORKDIR /var/www/larpcal
#COPY composer.json /var/www/larpcal/composer.json
#COPY composer.lock /var/www/larpcal/composer.lock
#COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
#RUN composer update
#RUN service apache2 start
#RUN echo "hehe" > /var/www/html/index.html
RUN echo "<?phpinfo();?>" > /var/www/html/index.php