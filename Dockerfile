FROM registry.alauda.cn/library/tomcat:8.5.0-jre8
MAINTAINER Mingqi Shao <mshao@alauda.io>

COPY JPetStore /usr/local/tomcat/webapps/JPetStore
COPY ./entrypoint.sh /jpetstore_entrypoint.sh

CMD ["catalina.sh", "run"]
ENTRYPOINT ["/jpetstore_entrypoint.sh"]
