# docker-easy-install-on-ubuntu
Install docker on ubuntu from official repository

Based on docker documentation suggestion we should install docker from official repo when we want to use docker in production.
As repeating this task can be tideous I have created a script which installs docker from official repository.
The output of the 

How to use this script:
first create a file named docker-install.sh
nano docker-install.sh

then make your file executable:
chmod +x docker-install.sh

execute it:
./docker-install.sh

at the end of executaion your system will reboot.

make sure to read the log files after reboot.
the log file is created next to your docker-install.sh as docker-install.log
