From centos:8

RUN yum install -y dnf-utils createrepo epel-release
RUN mkdir -p /repo/conf/
RUN mkdir -p /repo/repo/
RUN mkdir -p /repo/cachedir/
COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
