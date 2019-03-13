# -*- mode: ruby -*-
# vi: set ft=ruby :

$script = <<-SCRIPT
yum install -y curl policycoreutils-python openssh-server
systemctl enable sshd
systemctl start sshd
firewall-cmd --permanent --add-service=http
systemctl reload firewalld

yum install postfix
systemctl enable postfix
systemctl start postfix

curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.rpm.sh | bash

EXTERNAL_URL="http://127.0.0.1.nip.io" yum install -y gitlab-ee
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.define "centos-gitlab" do |centos|
    centos.vm.box = "centos/7"
    centos.vm.hostname = "centos-gitlab.localdomain"
    centos.vm.network "private_network", type: "dhcp"
    centos.vm.provision "shell", inline: $script
    centos.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.cpus = 2
    end
    centos.vm.network "forwarded_port", guest: 80, host: 80, host_ip: "127.0.0.1"
    centos.vm.network "forwarded_port", guest: 443, host: 443, host_ip: "127.0.0.1"
  end
end
