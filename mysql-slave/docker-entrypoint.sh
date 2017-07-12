#!/bin/bash
set -e
бнбн
        echo "GRANT REPLICATION SLAVE, REPLICATION CLIENT, SELECT on *.* TO 'repl'@'%' IDENTIFIED BY '$MYSQL_REPLICATION_PASSWORD';" >> "$tempSqlFile"
        echo 'FLUSH PRIVILEGES ;' >> "$tempSqlFile"

        if [ ! -z "$MYSQL_MASTER_SERVICE_HOST" ]; then
            echo "STOP SLAVE;" >> "$tempSqlFile"
            echo "CHANGE MASTER TO MASTER_HOST='$MYSQL_MASTER_SERVICE_HOST', MASTER_USER='$MYSQL_REPLICATION_USER', MASTER_PASSWORD='$MYSQL_REPLICATION_PASSWORD';">> "$tempSqlFile"
            echo "START SLAVE;" >> "$tempSqlFile"
        fi

        set -- "$@" --init-file="$tempSqlFile"
    fi
    chown -R mysql:mysql "$DATADIR"
fi

exec "$@"

