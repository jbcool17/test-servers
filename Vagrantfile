# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
# Add SSH Pub Keys
  ssh_pub_key = File.readlines("#{Dir.home}/.ssh/id_rsa.pub").first.strip

# UBUNTU
  (1..1).each do |i|
      config.vm.define "test-ubuntu-#{i}" do |node|
        node.vm.box = "ubuntu/xenial64"
        node.vm.hostname = "test-ubuntu-#{i}"
        # node.vm.network "private_network", ip: "10.0.0.1#{i}"
        node.vm.network "public_network", bridge: "en0: Wi-Fi (AirPort)"
        node.vm.provision "shell", inline: "apt-get update && apt-get upgrade -y"
        node.vm.provision "shell", inline: "test -e /usr/bin/python || (apt -y update && apt install -y python-minimal)"
        node.vm.provision "shell", inline: "echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys"


      end
    end

# CENTOS
  (1..1).each do |i|
      config.vm.define "test-centos-#{i}" do |node|
        node.vm.box = "centos/7"
        node.vm.hostname = "test-centos-#{i}"
        # node.vm.network "private_network", ip: "10.0.0.2#{i}"
        node.vm.network "public_network", bridge: "en0: Wi-Fi (AirPort)"
        node.vm.provision "shell", inline: "yum update -y"
        node.vm.provision "shell", inline: "echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys"
      end
    end

# "windows2016"
  (1..1).each do |i|
      config.vm.define "test-windows2016-#{i}" do |node|
        node.vm.box = "mwrock/Windows2016"
        node.vm.hostname = "test-windows2016-#{i}"
        # node.vm.network "private_network", ip: "10.0.0.2#{i}"
        node.vm.network "public_network", bridge: "en0: Wi-Fi (AirPort)"
        node.vm.provision "shell", path: "scripts/provision.ps1", privileged: true
      end
    end

    config.vm.provider "virtualbox" do |v|
      v.memory = 512
      v.cpus = 1
    end
end
