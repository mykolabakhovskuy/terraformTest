#!/bin/bash

# Install MySQL Server in a Non-Interactive mode. Default root password will be "root"
echo "mysql-server mysql-server/root_password password bahovskuy" | sudo debconf-set-selections
echo "mysql-server mysql-server/root_password_again password bahovskuy" | sudo debconf-set-selections
sudo apt-get -y install mysql-server
service mysql restart
