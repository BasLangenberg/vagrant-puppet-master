# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  # In this case, I use Oracle Enterprise Linux
  # Should be RedHat compactible
  config.vm.box = "OEL66-Base"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  # ToDo!
  #config.vm.box_url = "ToDo"

  # Let's create a private network, other Boxxes will connect to this one
  config.vm.hostname = "puppet.example.com"
  config.vm.network "private_network", ip: "192.168.50.4"

  config.vm.provider :virtualbox do |vb|
    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end
  # Shared Directories
  config.vm.synced_folder "/path/to/your/puppet/modules", "/etc/puppet/modules"

  # Prepare Puppet modules
  config.vm.provision "shell",
    inline: "/bin/bash /vagrant/setup.sh"


  # Run puppet modules
  config.vm.provision "puppet"  do |puppet|
    puppet.module_path = "modules"
    puppet.manifests_path = "manifests"
    puppet.manifest_file  = "site.pp"
    puppet.options = "--verbose"
  end

end
