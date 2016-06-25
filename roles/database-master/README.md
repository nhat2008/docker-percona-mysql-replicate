# Run some command and change config on database-slave/vars/main.yml
# before creating new slave

Step1:
    docker exec -ti masterdb 'mysql' -u{username} -p{password} -e"SHOW MASTER STATUS"
    mysql: [Warning] Using a password on the command line interface can be insecure.
    *************************** 1. row ***************************
                 File: mysqld-bin.000004
             Position: 310
         Binlog_Do_DB:
     Binlog_Ignore_DB:
    Executed_Gtid_Set:

    => get File, Position

Step2:
    In database-slave/vars/main.yml
    => log_file: File , log_pos: Position

Step3:
    change config on database-slave/files/my.cnf
    => server-id: to a new id (integer)




