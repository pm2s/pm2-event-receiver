apt-get update
apt-get -y upgrade
echo "deb http://www.rabbitmq.com/debian/ testing main" >> /etc/apt/sources.list
curl http://www.rabbitmq.com/rabbitmq-signing-key-public.asc | apt-key add -
apt-get update
apt-get -y install rabbitmq-server
rabbitmq-plugins enable rabbitmq_management
rabbitmqctl add_user test test
rabbitmqctl set_user_tags test administrator
rabbitmqctl set_permissions -p / test ".*" ".*" ".*"
service rabbitmq-server restart
