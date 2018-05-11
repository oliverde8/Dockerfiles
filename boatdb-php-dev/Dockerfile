FROM php:7.1-apache

# Update system dependencies
RUN apt-get update && apt-get install -y git libssl-dev libxml2-dev libicu-dev

# Install php extensions
RUN pecl install mongodb \
RUN pecl install xdebug-beta \
RUN docker-php-ext-enable xdebug
RUN docker-php-ext-install mbstring zip xml intl
RUN docker-php-ext-enable mbstring zip xml intl

# Manually enable some extensions
RUN echo "extension=mongodb.so" > $PHP_INI_DIR/conf.d/mongodb.ini

# Set timezone
RUN rm /etc/localtime
RUN ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime
RUN "date"

# Enable apache2 mods
RUN a2enmod rewrite

# Copy configurations
COPY apache-boatdb.conf /etc/apache2/sites-enabled/000-default.conf

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer --version

CMD ["/bin/bash", "apache2-foreground"]
