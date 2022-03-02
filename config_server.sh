#!/usr/bin/sh

printf "Update, Upgrade...\n";
sudo apt -qq update
sudo apt -qq upgrade
sudo apt -qq install mc -y
printf " Hotovo.\n";

printf "Nastaveni pripojeneho disku...\n";
sudo mkdir /media/hdd
sudo chown -R sali: /media/hdd
sudo mount /dev/sdb1 /media/hdd
sudo echo 'PARTUUID=b8e16f79-a4ef-406c-af98-cf44e4205588 /media/hdd   ext4    defaults        0       0' >> /etc/fstab
printf " Hotovo.\n";

printf "Vytvoreni zakladnich slozek...\n";
sudo mkdir /home/sali/projekty
sudo mkdir /home/sali/mariadb
sudo mkdir /home/sali/syncthing
sudo mkdir /home/sali/phpmyadmin
#sudo mkdir /home/jupyterlab
sudo mkdir /home/sali/nginx
sudo mkdir /home/sali/code
sudo chown -R sali: /home/sali/projekty
sudo chown -R sali: /home/sali/mariadb
sudo chown -R sali: /home/sali/syncthing
sudo chown -R sali: /home/sali/phpmyadmin
#sudo chown -R sali: /home/jupyterlab
sudo chown -R sali: /home/sali/nginx
sudo chown -R sali: /home/sali/code
printf " Hotovo.\n";

printf "Instalace a nastaveni samba...\n";
sudo apt-get -qq install samba samba-common-bin -y
sudo printf '[HDDServer]\n   comment=Hdd share\n   path=/media/hdd\n   browseable=yes\n   guest ok=yes\n   read only=no\n   create mask=0777\n   force create mode=0777\n   directory mask=0777\n   force directory mode=02777\n   force user=sali' >> /etc/samba/smb.conf 
sudo systemctl restart --quiet smbd
printf " Hotovo.\n"; 

printf "Instalace docker a docker-compose...\n";
curl -sS https://get.docker.com | sh
sudo usermod -aG docker sali
sudo apt-get -qq install -y libffi-dev libssl-dev 
sudo apt -qq install -y python3-dev 
sudo apt-get -qq install -y python3 python3-pip
sudo pip3 install -q docker-compose
sudo systemctl enable --quiet docker 
printf " Hotovo.\n";

printf "Spusteni docker-compose...\n";
cd /home/sali/project_cml
docker-compose up






