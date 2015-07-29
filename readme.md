# Vagrant Puppet Master
Written by Bas Langenberg (baslangenberg at gmail dot com) [homecooked.nl](http://www.homecooked.nl)

Many thanks to [Ginja](https://github.com/Ginja) for his [puppet_stack](https://github.com/Ginja/puppet_stack) module, on which this setup is based.

The goal of this project is to make the setup of an open source Puppet master for test purposes as easy as possible.

During my daily work, I noticed that sometimes I needed to debug Puppet code by running it directly of a master. It was time consuming to rebuild a VM all the time. This project solves this for me. It is in no way pretending to do this in 'the best' way, but this is working great for me.

Feel free to fork this module and change it to your own needs. Pull requests are welcome, but as this is a highly opinionated setup, I'll might reject it.


## Requirements
- A virtualisation engine, I use virtualbox
- Vagrant
- A RedHat based Linux Box for Vagrant

No special software needs to be installed in the Vagrant box, the module takes care of this.

## Usage
Issue the following command in the cloned directory

    vagrant up

That's it!

## Moving parts
### setup.sh
After the box is initiated, the setup.sh script will run, executing the following tasks

1. Install and setup of Ruby Version Manager ([RVM](https://rvm.io))
2. Use RVM to install and setup Ruby 2.0
3. Install Bundler gem
4. Install Puppet 3.8.1 gem (this is the current PE version)
5. Install librarian-puppet gem
6. Use librarian-puppet to install Puppet modules from Puppetfile
7. Touch a file (shell_provisioned) to indicate this step is done

Please note that all gems are installed without documentation. I use the shell_provisioned file to be able to quickly rerun the Puppet manifest (next step) without going through this again.

### manifests/site.pp
This manifest installs a Puppet master. The module also supports The Foreman and it's smart proxy, but I do not use it for my cases as of now. I might look into this into the future and update the project.
