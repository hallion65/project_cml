# server_install
A little configuration of my server running on Raspberry Pi 4B (2GB RAM).

###HW&SW
OS: Raspberry OS Lite 64bit flashed via Raspberry Pi Imager
  - booting from M2 SSD drive mounted via USB
  - second drive is SATA drive mounted via USB

###Installation
Dowload config_server.sh and docker-compose.yml to directory where you want to run it and then:
  - run: chmod 755 config_server.sh
  - run: ./config_server.sh
