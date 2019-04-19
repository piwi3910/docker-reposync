From centos:7

RUN yum install -y yum-utils createrepo epel-release yum-plugin-fastestmirror yum-axelget
RUN mkdir -p /repo/conf/
RUN mkdir -p /repo/repo/
COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
