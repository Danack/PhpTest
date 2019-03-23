FROM debian:9

USER root

# Get Debian up-to-date
RUN apt-get update -qq \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y git \
    mariadb-client wget curl \
    ca-certificates lsb-release apt-transport-https gnupg bsdmainutils

# Install 3rd party PHP 7.2 packages
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee -a /etc/apt/sources.list.d/php.list
#RUN curl -L https://packages.sury.org/php/apt.gpg | apt-key add -
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg

RUN  apt-get update -qq \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y php7.3 php7.3-common php7.3-cli php7.3-fpm \
    php7.3-mysql  php7.3-curl php7.3-xml php7.3-mbstring \
    php7.3-intl php7.3-redis php7.3-zip tidy \
    php7.3-imagick strace procps

# Make the default directory you
WORKDIR /var/app

# Run the process that this container will serve
CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize", "--fpm-config=/var/app/docker/php_fpm/config/fpm.conf", "-c", "/var/app/docker/php_fpm/config/php.ini"]

#CMD tail -f README.md