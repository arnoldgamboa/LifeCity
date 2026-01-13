FROM php:8.4-apache

# Install zip extension and dependencies
RUN apt-get update && apt-get install -y \
    libzip-dev \
    zip \
    unzip \
    && docker-php-ext-install zip \
    && docker-php-ext-install mysqli pdo pdo_mysql \
    && rm -rf /var/lib/apt/lists/*

# Enable Apache mod_rewrite (useful for WordPress/other CMS)
RUN a2enmod rewrite

# Set working directory
WORKDIR /var/www/html
