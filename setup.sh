echo "// Move 'setup' directory to ~/Documents/ //"

echo "// Checking Time and Date //"
sudo timedatectl status 
echo " "

echo "// Updating System //"
sudo apt update && sudo apt upgrade -y
echo " "

echo "// Removing Applications //"
sudo apt purge -y gnome-sushi cheese* gnome-terminal* eog gnome-calculator gnome-calendar gnome-contacts gnome-maps gnome-software gnome-user-docs gnome-weather *malcontent* evince* gnome-music gnome-photos orca *totem* gnome-terminal* gnome-2048 aisleriot five-or-more four-in-a-row hitori gnome-klotski lightsoff gnome-mahjongg gnome-mines gnome-nibbles quadrapassel gnome-games gnome-robots gnome-sudoku gnome-taquin gnome-tetravex gnome-weather evolution* transmission* *rhythmbox* shotwell* swell-foop tali iagno
sudo apt autoremove -y
sudo apt install -y gnome-session nautilus
sudo systemctl enable --now gdm
echo " "

echo "// Installing Apllications //"
# gnome-boxes, veracrypt, arduino, audacity obs-studio, cups, gimp
sudo apt install vlc micro curl fontconfig fonts-terminus alacritty ufw keepassxc cifs-utils smbclient nautilus gnome-shell-extensions -y
echo " "

# echo "// Installing Spotify //"
# curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
# echo "deb http://repository.spotify.com stable non-free" |  sudo tee /etc/apt/sources.list.d/spotify.list
# sudo apt-get update && sudo apt-get install spotify-client
echo " "

echo "// Updating Aliases //"
sudo cp /etc/bash.bashrc /etc/bash.bashrc.bak
sudo cp /home/masonp/Documents/setup/bash/bash.bashrc /etc/bash.bashrc

# echo "// Installing Cockpit //"
# echo "y" | sudo pacman -S cockpit cockpit-storaged cockpit-packagekit udisks2
# sudo systemctl enable cockpit.socket
# sudo systemctl start cockpit.socket
# echo "// Go to https://192.168.0.178:9090 for Cockpit //"
echo " "

# echo "// Installing SSH //"
# echo "y" | sudo pacman -S openssh
# echo "// Use ssh -p 753 masonp@192.168.0.178 //"
# sudo systemctl enable sshd
# sudo systemctl start sshd
# sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
# sudo cp /home/masonp/Documents/setup/ssh/sshd_config /etc/ssh/sshd_config
echo " " 

echo "// Configuring Micro //"
mkdir /home/masonp/.config/micro/
cp /home/masonp/Documents/setup/micro/settings.json /home/masonp/.config/micro/settings.json
echo " " 

echo "// Configuring Alacritty //"
mkdir /home/masonp/.config/alacritty/
cp /home/masonp/Documents/setup/alacritty/alacritty.yml /home/masonp/.config/alacritty/alacritty.yml
echo " "

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



# add more here

echo "// Configuring Firewall //"
sudo ufw default deny incoming
sudo ufw default allow outgoing
# add open ports here (cockpit, ssh, http...)
sudo ufw enable
sudo systemctl enable --now ufw
sudo systemctl status ufw
sudo ufw status verbose
echo " "

echo "// Configure Printing //"
echo "// Go to 'Settings' > 'Printers' > 'Unlock' > 
'Add Printer' //"
echo "// Enter IPv4 Address '192.168.0.209' //"
echo "// Click 'LPD-Printer' //"
echo "// Select 'Generic' > 'Generic PDF Printer' //"
echo "// Click Three Dots //"
echo "// Click 'Printer Details'  //"
echo "// Click 'Install PPD File' //"
echo "// Select Brother_HL-2270DW_series.ppd //"
echo "// Edit 'Printer Options' //"
echo "// click 'Use Printer by Default' //"



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


# echo "// Configuring Firewall //"
# add mount.cifs to fstab
# sudo systemctl enable ufw
# sudo systemctl start ufw
# sudo ufw default allow outgoing
# sudo ufw default deny incoming
# sudo ufw limit 753/tcp
# sudo ufw allow 9090/tcp
# sudo ufw allow CIFS
# sudo ufw allow 67/udp
# sudo ufw allow 68/udp
# sudo ufw allow 69/udp
# sudo ufw allow 26000/tcp
# sudo ufw allow 16000/tcp
# sudo ufw allow 10809/tcp
# sudo ufw allow 80/tcp
# sudo ufw enable
# sudo ufw status verbose
# echo "// Manual Installations //"
# sudo pacman -S firefox
# sudo pacman -S libreoffice
# sudo pacman -S inkscape
# sudo pacman -S shotcut
# echo "// Setup Complete //"
