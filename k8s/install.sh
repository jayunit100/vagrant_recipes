#!/bin/bash
echo "This recipe setsup a k8s cluster w/ calico"

echo $1 $2 $3
echo $1 $2 $3
echo $1 $2 $3
echo $1 $2 $3
echo $1 $2 $3
echo $1 $2 $3
echo $1 $2 $3
echo $1 $2 $3
echo $1 $2 $3
echo $1 $2 $3

exit




function setup() {
    update-alternatives --set iptables /usr/sbin/iptables-legacy
    sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
    sudo yum install -y docker-ce docker-ce-cli containerd.io
}

function k8s() {
    swapoff -a
    # Set SELinux in permissive mode (effectively disabling it)
    setenforce 0
    source /vagrant/kubeadmrepo.sh
    sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config
    yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes
    systemctl enable --now kubelet
}

function network() {
    echo "blah"
}

setup
k8s

