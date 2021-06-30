
locals {
  user_data = <<EOF
#!/bin/bash
sudo apt-key adv --keyserver keyserver.ubuntu.com:80 --recv-keys 7EA0A9C3F273FCD8

sudo apt-get -y update
sudo apt-get -y install \
   apt-transport-https \
   ca-certificates \
   curl \
   gnupg-agent \
   software-properties-common
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
sudo add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable"
sudo apt-get -y update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io jq

sudo useradd --create-home istio-proxy

sudo usermod -aG docker istio-proxy
sudo usermod -aG docker $USER

sudo mkdir -p /etc/istio-proxy
sudo chmod  775 /etc/istio-proxy
sudo chown istio-proxy:istio-proxy /etc/istio-proxy


sudo docker run -d \
  --name helloworld \
  -p 127.0.0.1:5000:5000 \
  docker.io/istio/examples-helloworld-v2

sudo su - istio-proxy
mkdir -p $HOME/.ssh
chmod 700 $HOME/.ssh
touch $HOME/.ssh/authorized_keys
chmod 600 $HOME/.ssh/authorized_keys

EOF
}
