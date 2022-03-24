#!/bin/bash
# as installing from repo is recommended, the following guide is based on using official repo:
# the following can be installed on the following ubuntu versions:
# Ubuntu Impish 21.10
# Ubuntu Hirsute 21.04
# Ubuntu Focal 20.04 (LTS)
# Ubuntu Bionic 18.04 (LTS)

# the following guide assumes that you are using a clean install of ubuntu

# setups the repo:
sudo apt-get update 
sudo apt-get install ca-certificates curl gnupg lsb-release -y

# Add Docker’s official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Use the following command to set up the stable repository.
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker Engine
sudo apt-get update
echo -e "\n=======================================" > docker-install.log
echo "Installation logs" >> docker-install.log
echo "======================================="  >> docker-install.log
sudo apt-get install docker-ce docker-ce-cli containerd.io -y >> docker-install.log

# start and enable docker 
# sudo systemctl status docker
# docker in ubuntu is up and running after install

# verify the presence of docker packages
echo -e "\n=======================================" >> docker-install.log
echo "verify the presence of docker packages:" >> docker-install.log
echo "=======================================" >> docker-install.log
sudo dpkg -l | grep -i docker >> docker-install.log

# verify the installed software version
echo -e "\n=======================================" >> docker-install.log
echo "verify the installed software version" >> docker-install.log
echo "=======================================" >> docker-install.log
sudo docker --version >> docker-install.log

# get the details of server/client model:
echo -e "\n=======================================" >> docker-install.log
echo "get the details of server/client model" >> docker-install.log
echo "=======================================" >> docker-install.log
sudo docker version >> docker-install.log

# to show the information about the docker host:
# number of running containers, number of images, default registry, etc...
echo -e "\n=======================================" >> docker-install.log
echo "information about the docker host" >> docker-install.log
echo "=======================================" >> docker-install.log
sudo docker system info >> docker-install.log

# To manage docker as non-root user
sudo groupadd docker
sudo usermod -aG docker $USER

# reboot the system
sudo reboot

# test the non-root user
# docker run hello-world
