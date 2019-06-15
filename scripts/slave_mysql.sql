change master to master_host='172.17.0.3',
master_user='repl',
master_password='password',
master_log_file='mysql-bin.000003',
master_log_pos=0;

start slave;