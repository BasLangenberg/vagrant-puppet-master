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
gem install puppet
gem install librarian-puppet

# Install necessary Puppet modules
if [ -d "/vagrant/modules" ]; then
  rm -rf /vagrant/modules
fi

cd /vagrant
librarian-puppet install

exit 0
