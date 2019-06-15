CREATE USER 'repl'@'172.17.0.4' IDENTIFIED BY 'password';
GRANT REPLICATION SLAVE ON *.* TO 'repl'@'172.17.0.4';
flush privileges;
