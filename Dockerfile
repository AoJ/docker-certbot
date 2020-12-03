from centos:8

RUN yum install -y epel-release                                   \
    && yum upgrade -y                                             \
    && yum install -y certbot python3-certbot-dns-digitalocean openssl
