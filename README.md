# vagrant-instalamp

Quick n' dirty LAMP provisioning on a base Ubuntu Vagrant VM for Mac OS X.

1. Install Homebrew - http://brew.sh/
2. Install Cask - http://caskroom.io/
3. Install Vagrant - `brew cask install vagrant`
4. Install VirtualBox - `brew cask install virtualbox`
5. `vagrant up` (This will be slow the first time.)

Now you have a LAMP stack based on Ubuntu 14.10.  Put site files in `www/` directory.  

HTTP on port 8080.  HTTPS on port 8081 (self-signed cert).  MySQL on port 33066.

MySQL root password is `root`

`vagrant ssh` to ssh into VM.  Private key is located at `~/.vagrant.d/insecure_private_key`. VM username and password are vagrant/vagrant.

`vagrant halt` to turn off VM.

`vagrant destroy` to delete VM.  (`vagrant up` will create it from scratch again.)

Default VM settings are 512 KB RAM and 1 CPU (these can be configured in `Vagrantfile`). Default hard disk size is 40 GB, alloc'ed as needed.

