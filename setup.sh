#!/bin/bash
if [ ! -f "/vagrant/shell_provisioned" ]; then
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
    echo 'script ran with /vagrant/module directory existing'
    echo 'please remove it manually from the vagrant directory'
    echo 'exit with error'
    exit 1
  fi

  cd /vagrant
  librarian-puppet install

  touch /vagrant/shell_provisioned

  exit 0
else
  echo 'Shell provisioner ran already, skipping'
  exit 0
fi
