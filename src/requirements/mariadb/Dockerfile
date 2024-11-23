FROM debian:bullseye
RUN apt-get update -qq && \
    apt-get upgrade -y && \
    apt-get install -y mariadb-server

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY tools/script.sh .

RUN mkdir /run/mysqld && chmod +x script.sh
CMD ["./script.sh"]