
### DO NOT RUN ###

## To-do
    # mailcow/unbound or cloudflare?
    # openvpn/openvpn-as - https://www.tp-link.com/us/support/faq/1544/
    podman w/ cockpit?
    clamAV & ufw & fail2ban?
    nmap
    rdp with guacamole? or remmina
    under TV?
    # https://brandonrozek.com/blog/auto-updating-podman-containers/ or other update system (watchtower)
    # Once on playstore: https://hub.docker.com/r/linuxserver/syncthing
    https://hub.docker.com/r/linuxserver/librespeed
    https://hub.docker.com/r/linuxserver/darktable
    https://hub.docker.com/r/linuxserver/kicad
    https://hub.docker.com/r/linuxserver/vscodium
    https://hub.docker.com/r/linuxserver/libreoffice
    https://hub.docker.com/r/linuxserver/gimp
    https://hub.docker.com/r/linuxserver/remmina
    https://hub.docker.com/r/linuxserver/freecad
    https://hub.docker.com/r/linuxserver/inkscape
    https://hub.docker.com/r/linuxserver/ardour
    https://hub.docker.com/r/linuxserver/piwigo
    https://hub.docker.com/r/linuxserver/freshrss
    https://hub.docker.com/r/linuxserver/speedtest-tracker
    https://hub.docker.com/r/linuxserver/shotcut


## Windows Terminal
    ssh masonp@192.168.0.222 -p 753

## Docker
    echo "// Configuring Docker //"
    systemctl enable --now docker.service
    systemctl status docker.service
    echo " "

## Htop
    sudo pacman -S htop
    htop

## Portainer
    sudo docker volume create portainer_data
    sudo docker volume ls
    sudo docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:2.21.1
    sudo docker ps
    sudo ufw allow from 192.168.0.0/24 to any port 9443 proto tcp
    # for Edge: sudo ufw allow from 192.168.0.0/24 to any port 8000 proto tcp
    sudo ufw reload
    sudo ufw status verbose
    https://192.168.0.222:9443
    # admin

# httpd container
    # make httpd_data volume
    # httpd:latest image
    # 80 -> 80 tcp
    # restart always
    # httpd_data -> /usr/local/apache2/htdocs
    sudo ufw allow from 192.168.0.0/24 to any port 80 proto tcp
    sudo ufw reload
    sudo ufw status verbose
    http://192.168.0.222
    sudo -s
    cd /var/lib/docker/volumes/httpd_data/_data/
    curl -LO https://raw.githubusercontent.com/ThiefInBlueJeans/CompFiles/refs/heads/main/Standard/Chess_Timer.html

# adguard home
    # https://hub.docker.com/r/adguard/adguardhome
    # 192.168.0.222:3000
    # all interfaces
    # port 80 # change next time
    # all interfaces
    # port 53
    # admin
    # same pw
    # 192.168.0.222
    # add content filtering settings
    # add 1.1.1.3, 1.0.0.3, 8.8.8.8, 8.8.4.4
    # DO: add encryption settings
    # DO: add more blocklists
    # DO: add allowlists
    # DO: add dns rewrites
    # https://hub.docker.com/u/pihole
    # add firewall rules

## Fresh RSS Container
    # https://hub.docker.com/r/freshrss/freshrss
    # masonp - same pw

## Watchtower
    # https://hub.docker.com/r/containrrr/watchtower
    docker run -d \
        --name watchtower \
        -v /var/run/docker.sock:/var/run/docker.sock \
        --restart unless-stopped \
        containrrr/watchtower






##########################################

## Extra Stuff

# Unbound:
# 	unboundCT
# 	arch linux
# 	20GiB
# 	1 core
# 	1024MiB+1024MiB swap
# 	192.168.0.22/24
# 	192.168.0.1
# 	Start at boot
# 	ip a
# 	pacman-key --init
# 	pacman-key --populate
# 	pacman -Sy archlinux-keyring
# 	pacman -Syu
# 	pacman -S unbound
# 	systemctl enable --now unbound.service
# 	systemctl status unbound.service
# 	nano /etc/unbound/unbound.conf
# 	systemctl restart unbound.service
# 	systemctl disable --now systemd-resolved
# 	pacman -S ufw
# 	ufw default allow outgoing
# 	ufw default deny incoming
# 	ufw allow from 192.168.0.0/24 to any port 53 proto tcp
# 	ufw allow from 192.168.0.0/24 to any port 53 proto udp
# 	ufw enable
# 	systemctl enable --now ufw
# 	systemctl status ufw
# 	ufw status verbose
# 	Snapshot

# echo "// Installing Samba //"
# echo "y" | sudo pacman -S samba avahi
# mkdir /home/masonp/share
# sudo cp /home/masonp/Documents/setup/samba/smb.conf /etc/samba/smb.conf
# echo "// Enter New Samba Password //"
# sudo smbpasswd -a masonp
# sudo systemctl enable avahi-daemon
# sudo systemctl start avahi-daemon
# sudo systemctl enable smb
# sudo systemctl start smb
# echo "// Use \\\\masonASERV1\\share //"
# sudo ufw allow CIFS

# echo "// Installing IVentoy //"
# cd /home/masonp/Documents/setup/iventoy
# curl -LO  https://github.com/ventoy/PXE/releases/download/v1.0.20/iventoy-1.0.20-linux-free.tar.gz
# curl -LO  https://github.com/ventoy/PXE/releases/download/v1.0.20/sha256.txt
# sha256sum -c sha256.txt iventoy-*-linux-free.tar.gz
# rm sha256.txt
# tar -xzf iventoy-*-linux-free.tar.gz
# rm iventoy-*-linux-free.tar.gz
# cd iventoy-*
# mv * ..
# cd ..
# rmdir iventoy-*
# echo "// Move .iso files to iso/ //"
# echo "// Use http://192.168.0.178:26000 //"
