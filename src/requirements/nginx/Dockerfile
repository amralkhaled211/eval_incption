FROM debian:bullseye

RUN apt-get update -qq && \
    apt-get upgrade -y && \
    apt-get install -y nginx vim openssl

COPY conf/default /etc/nginx/sites-available

# COPY index.html /var/www/html/index.html

COPY tools/script.sh .
RUN chmod +x script.sh

CMD ["./script.sh"]


