** Replicate MYSQL master-slave with Ansible**
We will set up the replication with type GTID: master-slave  , master-multi slaves
1. Install ansible and ansible-playbook version 2.0
2. Install Docker in the destination host
3. Update hosts file: where for MASTER , where for SLAVE
4. Check config 
    4.1 my.cnf for MySQL config, example: Server ID, Swap ...
    4.2 on database-slave/vars: replace the docker_container.master_host with the HOST masterdb
5. Run ansible for deploying: ansible-playbook -i hosts database.yml

* Some commands to check the replication:
# docker exec -ti slavedb 'mysql' -uroot -pmysecretpass -e"SHOW SLAVE STATUS;" -vvv
# docker exec -ti masterdb 'mysql' -uroot -pmysecretpass -e"SHOW SLAVE HOSTS;" -vvv
# docker exec -ti masterdb 'mysql' -uroot -pmysecretpass -e"SHOW MASTER STATUS;" -vvvv

* For more information about replication with docker: https://www.percona.com/blog/2016/03/30/docker-mysql-replication-101/
