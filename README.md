# Project CML
A little configuration of my server running on Raspberry Pi 4B (2GB RAM).

## My story and basic info
It all started as a challenge. I´m a music producer but I also work as a IT analyst and developer. But I haven´t worked with Linux much so I wanted to explore it and maybe use it in some way for my music production. I used cloud service for synchronizing my projects to a cloud and also to share them between all my devices. After a while I found out that the client for this cloud service was causing software crashes which escalated into blue screen in most cases. Pretty annoying thing when you work on music project and suddenly you PC is going down. Then I remembered that I have unused Raspberry Pi and that I could try to learn more about Linux and create my own Linux server. My journey will be documented here in this repository and who know where it will end. 

### HW&SW
OS: Raspberry OS Lite 64bit flashed via Raspberry Pi Imager
  - booting from M2 SSD drive mounted via USB
  - second drive is SATA drive mounted via USB

### Installation
Dowload config_server.sh and docker-compose.yml to directory where you want to run it and then:
  - run: chmod 755 config_server.sh
  - run: ./config_server.sh

### Containers
  1) Visual Code Studio
  2) Syncthing
  3) Portainer
  4) MariaDB
  5) phpmyadmin
  6) Jupyterlab

## Syncthing
