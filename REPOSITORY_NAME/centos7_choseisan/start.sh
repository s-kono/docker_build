#!/bin/bash

set -e

mysqld_safe --skip-grant-tables --bind-address=127.0.0.1 &

sleep 20

mysql -u root <<EOS
CREATE DATABASE coordination_dev DEFAULT CHARACTER SET utf8;
EOS

cd /var/tmp/choseisan/
  sed -i 's%^end%  config.web_console.whitelisted_ips = "0.0.0.0/0"%' config/environments/development.rb
  echo end                                                         >> config/environments/development.rb
  cat config/environments/development.rb
  rake db:migrate RAILS_ENV=development
  rails server -b 0.0.0.0

