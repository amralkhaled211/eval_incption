FROM debian:bullseye
RUN apt-get update -qq && \
    apt-get upgrade -y 

RUN mkdir -p /html_temp

COPY files/index.html /html_temp/index.html
COPY files/style.css /html_temp/style.css

COPY tools/keep-alive.sh /usr/local/bin/keep-alive.sh
RUN chmod +x /usr/local/bin/keep-alive.sh



CMD ["/usr/local/bin/keep-alive.sh"]
