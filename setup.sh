#!/bin/bash

# Install RVM
sudo gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
curl -sSL https://get.rvm.io | sudo bash -s stable

# setup
usermod -G rvm vagrant
source /etc/profile.d/rvm.sh

# Install Ruby
rvm install ruby-2.0.0
rvm alias create default ruby-2.0.0

# Install puppet and librarian-puppet
gem install puppet -v 3.8.1 --no-ri --no-rdoc
gem install librarian-puppet --no-ri --no-rdoc

# Install necessary Puppet modules
if [ -d "/vagrant/modules" ]; then
  echo 'module dir exists, please remove it manually from the vagrant directory'
  echo 'exit with error'
  exit 1
fi

librarian-puppet install --path /vagrant

exit 0
