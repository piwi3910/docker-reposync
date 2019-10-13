From centos:8

RUN yum install -y dnf-utils createrepo epel-release && \
    mkdir -p /repo/conf/ && \
    mkdir -p /repo/repo/ && \
    mkdir -p /repo/cachedir/

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
