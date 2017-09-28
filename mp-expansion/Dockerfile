FROM php:7.0-cli
WORKDIR /var/expansion

RUN apt-get update \
     && apt-get install -y \
	git \
	unzip \
	libicu-dev \
    zlib1g-dev

RUN docker-php-ext-install \
    intl \
    mbstring \
    zip

# Memory Limit
RUN echo "memory_limit=-1" > $PHP_INI_DIR/conf.d/memory-limit.ini

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer --version

# Set timezone
RUN rm /etc/localtime
RUN ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime
RUN "date"

# Type docker-php-ext-install to see available extensions
RUN docker-php-ext-install pdo pdo_mysql

# Add a alias to lake it easier to use sf commands
RUN echo 'alias sf="php bin/console"' >> ~/.bashrc

# Install eXpansion2.
RUN git clone https://github.com/eXpansionPluginPack/eXpansion2.git /var/expansion

# Apply default parameters.
COPY parameters.yml /var/expansion/app/config/

# Install using composer...
RUN composer install

# Copy custom script to launch expansion.
COPY ./run.sh /var/expansion/run.sh
RUN  chmod +x run.sh

ENTRYPOINT ["./run.sh"]