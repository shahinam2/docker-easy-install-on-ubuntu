# docker-easy-install-on-ubuntu
## Install docker on ubuntu from official repository automatically

When we want to use docker in production, based on docker's docs suggestion we should install docker from official repository.
As you already know there is a convenience script for development environment but there is no convenience script for production.
So as repeating the docker install from repo can be tideous I have created a script which installs docker from official repository.

### **How to use this script:**
#### First make sure you are using one of the following versions of ubuntu and its a clean install:
- Ubuntu Impish 21.10
- Ubuntu Hirsute 21.04
- Ubuntu Focal 20.04 (LTS)
- Ubuntu Bionic 18.04 (LTS)

#### Copy and paste the following script which will:
1. Clone this repo
2. Make the script executable
3. Run 
```
sudo apt install git -y && git clone https://github.com/shahinam2/docker-easy-install-on-ubuntu.git && cd docker-easy-install-on-ubuntu && chmod +x docker-install.sh && ./docker-install.sh
```

### **Notes:**
1. At the end of executaion your system will reboot.
2. Make sure to read the log files after reboot. the log file is created next to your docker-install.sh as **docker-install.log**
3. For extra convenience the current user is added to docker group. so you don't have to type sudo every time.
4. Test dockers functionality without sudo. If it works, it means that the installaion was successfull.
`docker run hello-world`
5. the following are extra commands executed and logged after installing docker:
```
sudo dpkg -l | grep -i docker
sudo docker --version
sudo docker version
sudo docker system info
```

