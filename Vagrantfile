# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Compiling SFCGAL requires some decent memory
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "3072"]
  end
  # Every Vagrant virtual environment requires a box to build from
  config.vm.box = "ubuntu/trusty64"
  # Let's build our tools by running our bootstrap script
  config.vm.provision :shell, :path => "bootstrap.sh"
  # Now we set our external port for PostgreSQL
  config.vm.network :forwarded_port, host: 4567, guest: 5432
end
