# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define :kali do |kali|
    kali.vm.box = "offensive-security/kali-linux"
    kali.vm.hostname = "kali-linux"
    kali.vm.network "private_network", ip: "192.168.89.1"
    kali.vm.synced_folder ".", "/vagrant", type:"virtualbox"
    kali.vm.provision :shell do |shell|
      shell.path = "provision-kali.sh"
    end
#    kali.vm.provider "virtualbox" do |vb|
#      vb.cpus = "2"
#      vb.memory = "1024"
#    end
  end

  config.vm.define :target do |target|
    target.vm.box = "centos/7"
    target.vm.hostname = "target"
    target.vm.network "private_network", ip: "192.168.89.2"
    target.vm.synced_folder ".", "/vagrant", type:"virtualbox"
    target.vm.provision :shell do |shell|
      shell.path = "provision-target.sh"
    end
#    target.vm.provider "virtualbox" do |vb|
#      vb.cpus = "2"
#      vb.memory = "1024"
#    end
  end

end
