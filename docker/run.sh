#!/usr/bin/env bash

set -e

# Wait for database to get available
MYSQL_LOOPS="20"
MYSQL_HOST="wavsepdb"
MYSQL_PORT="3306"

# Wait for mysql
i=0
while ! nc ${MYSQL_HOST} ${MYSQL_PORT} >/dev/null 2>&1 < /dev/null; do
  i=`expr ${i} + 1`
  if [ ${i} -ge ${MYSQL_LOOPS} ]; then
    echo "$(date) - ${MYSQL_HOST}:${MYSQL_PORT} still not reachable, giving up"
    exit 1
  fi
  echo "$(date) - waiting for ${MYSQL_HOST}:${MYSQL_PORT}..."
  sleep 1
done

echo
echo "Start the daemon to process the configuration requests"
/usr/local/tomcat/bin/catalina.sh run &

WAVSEP_LOOPS="20"
WAVSEP_HOST="127.0.0.1"
WAVSEP_PORT="8080"

# Wait for WAVSEP
i=0
while ! nc ${WAVSEP_HOST} ${WAVSEP_PORT} >/dev/null 2>&1 < /dev/null; do
  i=`expr ${i} + 1`
  if [ ${i} -ge ${WAVSEP_LOOPS} ]; then
    echo "$(date) - ${WAVSEP_HOST}:${WAVSEP_PORT} still not reachable, giving up"
    exit 1
  fi
  echo "$(date) - waiting for ${WAVSEP_HOST}:${WAVSEP_PORT}..."
  sleep 1
done

echo
echo "Configure the WAVSEP database settings"
curl --data "username=root&password=wavsep&host=wavsepdb&port=3306&wavsep_username=wavsep&wavsep_password=wavsepPass782" http://localhost:8080/wavsep/wavsep-install/install.jsp

echo
echo "Re-creating WAVSEP db user"
echo "drop user 'wavsep'@'wavsepdb';" > grant.sql
echo "GRANT ALL PRIVILEGES ON *.* TO 'wavsep'@'%' IDENTIFIED BY 'wavsepPass782';" >> grant.sql
echo "FLUSH PRIVILEGES;" >> grant.sql
mysql -u root -h ${MYSQL_HOST} -pwavsep < grant.sql

echo
echo "Killing configuration daemon"
pkill -f java

echo
echo "Start the daemon"
/usr/local/tomcat/bin/catalina.sh run