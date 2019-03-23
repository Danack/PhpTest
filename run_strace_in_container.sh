

docker-compose run php_fpm echo 0 \> /proc/sys/kernel/yama/ptrace_scope
docker-compose run php_fpm bash batch_strace.sh
