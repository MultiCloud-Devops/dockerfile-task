FROM ubuntu:20.04
RUN apt update -y && \
    apt install apache2 -y
COPY index.html /var/www/html
EXPOSE 80
CMD ["apachectl", "-D", "FOREGROUND"]