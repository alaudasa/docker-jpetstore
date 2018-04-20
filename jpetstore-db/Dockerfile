FROM registry.alauda.cn/library/mysql:5.5

COPY *.sql /docker-entrypoint-initdb.d/

ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE jpetstore
