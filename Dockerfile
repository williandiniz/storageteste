FROM php:8.1-apache
RUN apt update -y &&\
    apt install nano -y &&\
    apt-get install libldb-dev libldap2-dev  -y
RUN apt-get install -y curl \
    && curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
WORKDIR /var/www/html
RUN apt install git -y
RUN git clone https://github.com/alexbers/mtprotoproxy.git
COPY .apache/. /etc/apache2/
COPY . .
RUN mkdir /var/www/html/arquivos
RUN chmod -R 777 /var/www/html
RUN a2ensite teste
RUN a2enmod rewrite
EXPOSE 8080
USER 1001
RUN service apache2 restart

