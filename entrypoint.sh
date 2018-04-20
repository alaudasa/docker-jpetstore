#!/bin/bash

set -e

sed 's,{{DB_HOST}},'"${DB_HOST}"',g' -i /usr/local/tomcat/webapps/JPetStore/WEB-INF/classes/properties/database.properties
sed 's,{{DB_PORT}},'"${DB_PORT}"',g' -i /usr/local/tomcat/webapps/JPetStore/WEB-INF/classes/properties/database.properties
sed 's,{{DB_USER}},'"${DB_USER}"',g' -i /usr/local/tomcat/webapps/JPetStore/WEB-INF/classes/properties/database.properties
sed 's,{{DB_PASSWORD}},'"${DB_PASSWORD}"',g' -i /usr/local/tomcat/webapps/JPetStore/WEB-INF/classes/properties/database.properties

exec "$@"
