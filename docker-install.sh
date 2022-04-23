#!/bin/bash
# the following script assumes that you are using a clean install of Ubuntu.

# Preprations:
sudo apt-get update &> /dev/null
echo -e "\n======================================="
echo "Updating apt & setting up the environment "
echo "======================================="
sudo apt-get install ca-certificates curl gnupg lsb-release -y &> /dev/null

# Add Docker’s official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg &> /dev/null

# Use the following command to set up the stable repository.
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list &> /dev/null

###########################################################
####################Installation Part######################
###########################################################

# Install Docker Engine
sudo apt-get update &> /dev/null
echo -e "\n======================================="
echo "Installing Docker"
echo "======================================="
echo "=======================================" > docker-install.log
echo "Installation logs" >> docker-install.log
echo "======================================="  >> docker-install.log
sudo apt-get install docker-ce docker-ce-cli containerd.io -y &>> docker-install.log
sleep 2

# installing docker compose version 2:
echo -e "\n======================================="
echo "Installing Docker Compose V2"
echo "======================================="
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins
curl -SL https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose &>/dev/null
chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
sleep 2

# To manage docker as non-root user
echo -e "\n======================================="
echo "Adding the current user to docker group"
echo "======================================="
# sudo groupadd docker
sudo usermod -aG docker $USER
sleep 2

# Informing the user about the log file
echo -e "\n======================================="
echo "Installation logs are stored in ./docker-install.log"
echo "======================================="
sleep 2

#############################################################
#################Verification Part###########################
#############################################################
# verify the presence of docker packages
echo -e "\n=======================================" >> docker-install.log
echo "Verify the presence of docker packages:" >> docker-install.log
echo "=======================================" >> docker-install.log
sudo dpkg -l | grep -i docker >> docker-install.log

# verify the installed software version
echo -e "\n=======================================" >> docker-install.log
echo "Verify docker version" >> docker-install.log
echo "=======================================" >> docker-install.log
sudo docker --version >> docker-install.log

# get the details of server/client model:
echo -e "\n=======================================" >> docker-install.log
echo "Verify the server/client model infos" >> docker-install.log
echo "=======================================" >> docker-install.log
sudo docker version >> docker-install.log

# to show the information about the docker host:
# number of running containers, number of images, default registry, etc...
echo -e "\n=======================================" >> docker-install.log
echo "Verify the docker host infos" >> docker-install.log
echo "=======================================" >> docker-install.log
sudo docker system info >> docker-install.log

echo -e "\n=======================================" >> docker-install.log
echo "Verify the docker compose version" >> docker-install.log
echo "=======================================" >> docker-install.log
sudo docker-compose version >> docker-install.log

####################################################
###################System Reboot####################
####################################################
# reboot the system
echo -e "\n======================================="
echo "Rebooting system in 5 seconds"
echo "======================================="
sleep 5
sudo reboot
