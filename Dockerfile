
# Use an official PHP image with Apache
FROM php:8.2-apache

# Set working directory
WORKDIR /var/www/html

# Copy your PHP app files to Apache root
COPY . /var/www/html/

# Install PHP extensions needed (like mysqli)
RUN docker-php-ext-install mysqli

# Optional: enable Apache mod_rewrite if you're using .htaccess
RUN a2enmod rewrite

# Set environment variables (if your API uses them)
# ENV DB_HOST=localhost
# ENV DB_USER=root
# ENV DB_PASS=password

# Expose port 80
EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]
