# docker-easy-install-on-ubuntu
## Install docker on ubuntu from official repository automatically

when we want to use docker in production, based on docker docs suggestion we should install docker from official repository.
As repeating this task can be tideous I have created a script which installs docker from official repository with zero touch.

### **How to use this script:**
#### 0. First make sure that you are using one of the following versions of ubuntu and its a clean install:
- Ubuntu Impish 21.10
- Ubuntu Hirsute 21.04
- Ubuntu Focal 20.04 (LTS)
- Ubuntu Bionic 18.04 (LTS)

#### 1. Clone this repo:
`git clone https://github.com/shahinam2/docker-easy-install-on-ubuntu.git`

#### 2. Then make the script executable:
```
cd docker-easy-install-on-ubuntu
chmod +x docker-install.sh
```

#### 3. Run it:
`./docker-install.sh`
#### at the end of executaion your system will reboot.

#### make sure to read the log files after reboot.
#### the log file is created next to your docker-install.sh as **docker-install.log**


### **Notes:**
#### 1. For extra convenience the current user is added to docker group. so you don't have to type sudo every time.
#### 2. Test dockers functionality without sudo
`docker run hello-world`
#### If it works, it means that the installaion was successfull.
#### 3. the following are extra commands executed and logged after installing docker:
```
sudo dpkg -l | grep -i docker
sudo docker --version
sudo docker version
sudo docker system info
```

