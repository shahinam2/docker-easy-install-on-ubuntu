# docker-easy-install-on-ubuntu
## Install docker on ubuntu from official repository automatically

when we want to use docker in production, based on docker docs suggestion we should install docker from official repository.
As repeating this task can be tideous I have created a script which installs docker from official repository with zero touch.

### **How to use this script:**
#### Clone this repo:
`git clone https://github.com/shahinam2/docker-easy-install-on-ubuntu.git`

#### Then make the script executable:
`cd docker-easy-install-on-ubuntu`

`chmod +x docker-install.sh`

#### Execute it:
`./docker-install.sh`
#### at the end of executaion your system will reboot.

#### make sure to read the log files after reboot.
#### the log file is created next to your docker-install.sh as **docker-install.log**


### Notes:
#### 1. For extra convenience the current user is added to docker group
#### 2. test dockers functionality without sudo
`docker run hello-world`
#### if it works, it means that the installaion was successfull.
#### 3. the following are extra commands executed and logged after installing docker:
`sudo dpkg -l | grep -i docker`
`sudo docker --version`
`sudo docker version`
`sudo docker system info`

