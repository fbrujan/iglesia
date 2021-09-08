FROM centos:6

# MAINTAINER Francisco Brujan  <fbrujan@gmail.com>

WORKDIR /var/www/iglesia

# Installing dependencies
COPY ./config/CentOS-Base.repo /etc/yum.repos.d/

RUN yum install  -y \
  httpd \
  php \
  php-mysql \
  openssh \
  openssh-server \
  mysql \
  mysql-server \
  screen

# Initials config for omega
COPY . /var/www/iglesia
RUN sed -i -e 's/\r$//' ./config/entrypoint.sh

ENV PATH=$PATH:$HOME/sbin

#RUN chown -R apache:apache /var/www/iglesia/*
#RUN chown -R mysql:mysql /var/lib/mysql
COPY ./config/aicrd-vhost.conf /etc/httpd/conf.d/
COPY ./config/httpd.conf /etc/httpd/conf/

EXPOSE 80

#  Clean up
RUN  yum clean all && \
  rm -rf /tmp/*.rpm

COPY ./config/entrypoint.sh /var/www/
RUN chmod +x /var/www/entrypoint.sh
RUN chown apache:apache /var/www/entrypoint.sh
#RUN bash /var/www/entrypoint.sh
ENTRYPOINT ["bash", "/var/www/entrypoint.sh"]


