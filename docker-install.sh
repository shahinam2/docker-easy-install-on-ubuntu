#!/bin/bash
# as installing from repo is recommended, the following guide is based on using official repo:
# the following can be installed on the following ubuntu versions:
# Ubuntu Impish 21.10
# Ubuntu Hirsute 21.04
# Ubuntu Focal 20.04 (LTS)
# Ubuntu Bionic 18.04 (LTS)

# the following script assumes that you are using a clean install of ubuntu

# setups the repo:
sudo apt-get update > /dev/null
echo -e "\n======================================="
echo "Updating apt & setting up the environment "
echo "======================================="
sudo apt-get install ca-certificates curl gnupg lsb-release -y > /dev/null

# Add Docker’s official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg > /dev/null

# Use the following command to set up the stable repository.
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker Engine
sudo apt-get update > /dev/null
echo -e "\n======================================="
echo "Installing Docker"
echo "======================================="
echo "=======================================" > docker-install.log
echo "Installation logs" >> docker-install.log
echo "======================================="  >> docker-install.log
sudo apt-get install docker-ce docker-ce-cli containerd.io -y >> docker-install.log
sleep 2

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
echo -e "\n======================================="
echo "Adding the current user to docker group"
echo "======================================="
# sudo groupadd docker
sudo usermod -aG docker $USER
sleep 2

# reboot the system
echo -e "\n======================================="
echo "Rebooting system in 5 seconds"
echo "======================================="
sleep 5
sudo reboot
