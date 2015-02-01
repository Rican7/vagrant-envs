# -*- mode: ruby -*-
# vi: set ft=ruby :

#
# Custom modules
#

# OS-level operations
module OS
  # Check if the host OS is Windows
  # http://stackoverflow.com/a/171011/852382
  def OS.is_windows?
    nil != (RUBY_PLATFORM =~ /cygwin|mswin|mingw|bccwin|wince|emx/)
  end
end


# https://docs.vagrantup.com.
Vagrant.configure(2) do |config|

  config.vm.box = "chef/centos-6.6"
  config.vm.box_check_update = true

  if OS.is_windows? and not Vagrant.has_plugin?('vagrant-vbguest')
    Kernel.abort('Windows host detected without "vagrant-vbguest" installed. Use "vagrant plugin install vagrant-vbguest" to install.')
  end

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network "forwarded_port", guest: 80, host: 8080

  # Shell provisioning configuration
  config.vm.provision "shell", run: "once" do |shell|
    shell.path = "provisioning/shell.sh"
  end

  # Puppet provisioning configuration
  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "provisioning/puppet/manifests"
    puppet.manifest_file = ""
    puppet.module_path = "provisioning/puppet/modules"
  end

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL

end
