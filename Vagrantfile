# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.box_check_update = false
  config.ssh.insert_key = false

  config.vm.network "forwarded_port", guest: 3000, host: 3000 # rack
  config.vm.network "forwarded_port", guest: 4567, host: 4567 # rack
  config.vm.network "forwarded_port", guest: 9292, host: 9292 # sinatra

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.cpus = 4
    vb.memory = "4096"
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    #vb.check_guest_additions = false
		#vb.customize ["modifyvm", :id, "--natnet1", "10.10.10/24"]
  end
  config.vm.provision "shell", inline: <<-SHELL
    apt-get update -q
    apt-get install -y tar unzip apache2 unoconv
    # Install ruby build dependencies
    apt-get install -f -y git curl libcurl4-openssl-dev wget build-essential subversion autoconf libpq-dev libsqlite3-dev libmysqlclient-dev zlib1g-dev libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt-dev bison qt4-qmake libqtwebkit-dev libffi-dev net-tools
    apt install -y libssl1.0-dev
    timedatectl set-timezone Asia/Taipei
  SHELL
  config.vm.define "ruby23" do|ruby2|
    ruby2.vm.provision :shell, path: "vagrant/unoconv.sh", privileged: true
    ruby2.vm.provision :shell, path: "vagrant/provision.sh", privileged: true
  end

  #sudo -H -u root /bin/bash << 'SCRIPT'
  #  source /etc/profile.d/rbenv.sh
  #  gem install sinatra --user-install --no-ri --no-rdoc
  #SCRIPT
end


