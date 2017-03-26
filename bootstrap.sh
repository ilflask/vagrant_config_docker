##DEBIAN 8

#Update
sudo apt-get update 

#Install Docker
sudo apt-get install -y apt-transport-https ca-certificates curl python-software-properties software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce
sudo groupadd docker     
sudo gpasswd -a vagrant docker
sudo usermod -aG docker vagrant

#Docker-compose
sudo apt-get install -y python-pip
sudo pip install docker-compose

#Command-line completion
sudo curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose