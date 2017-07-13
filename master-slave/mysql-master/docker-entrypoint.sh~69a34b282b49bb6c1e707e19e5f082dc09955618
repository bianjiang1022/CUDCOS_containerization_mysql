#!/bin/bash
set -e
……
        echo 'Initializing database..'
        mysqld --initialize-insecure=on --datadir="$DATADIR"
        echo 'Database initialized.'

……
        echo "GRANT REPLICATION SLAVE, REPLICATION CLIENT, SELECT on *.* TO 'repl'@'%' IDENTIFIED BY '$MYSQL_REPLICATION_PASSWORD';" >> "$tempSqlFile"

        echo 'FLUSH PRIVILEGES ;' >> "$tempSqlFile"

        set -- "$@" --init-file="$tempSqlFile"
    fi

    chown -R mysql:mysql "$DATADIR"
fi

exec "$@"

