echo "// Running Setup Script //"
echo " "

echo "// Updating Time and Date //"
sudo timedatectl set-timezone America/Los_Angeles
sudo timedateclt set-ntp true
sudo timedatectl status 
echo " "

echo "// Updating System //"
sudo pacman -Syu
echo " "

echo "// Removing Applications //"
echo "Use: pacman -Q to list installed packages"
echo "y" | sudo pacman -Rsnu epiphany gnome-calculator gnome-calendar gnome-connections gnome-contacts gnome-maps gnome-music gnome-software gnome-tour gnome-user-docs gnome-weather malcontent totem yelp
echo " "

echo "// Installing Apllications //"
sudo pacman -S vlc ufw cups base-devel
mkdir /home/family/AUR/
cd /home/family/AUR/
curl -LO https://aur.archlinux.org/cgit/aur.git/snapshot/google-chrome.tar.gz
tar -xvf google-chrome.tar.gz
rm google-chrome.tar.gz
cd google-chrome
makepkg -sirc
cd /home/family/
rm -r AUR
echo " "

echo "// Updating Aliases //"
sudo cp /etc/bash.bashrc /etc/bash.bashrc.bak
curl -LO https://raw.githubusercontent.com/ThiefInBlueJeans/CompFiles/main/KitCom/bash.bashrc
sudo mv bash.bashrc /etc/bash.bashrc
echo " "

echo "// Configuring Micro //"
mkdir /home/family/.config/micro/
curl -LO https://raw.githubusercontent.com/ThiefInBlueJeans/CompFiles/main/KitCom/settings.json
mv settings.json /home/family/.config/micro/settings.json
echo " " 

echo "// Configuring Firewall //"
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable
sudo systemctl enable --now ufw
sudo systemctl status ufw
sudo ufw status verbose
echo " "

echo "// Configure Printing //"
echo "// Go to 'Settings' > 'Printers' > 'Unlock' > 
'Add Printer' //"
echo "// Enter IPv4 Address '.30' //"
echo "// Click 'LPD-Printer' //"
echo "// Select 'Generic' > 'Generic PDF Printer' //"
echo "// Click Three Dots //"
echo "// Click 'Printer Details'  //"
echo "// Click 'Install PPD File' //"
echo "// Select Brother_HL-2270DW_series.ppd //"
echo "// Edit 'Printer Options' //"
echo "// click 'Use Printer by Default' //"
sudo systemctl enable cups.service
sudo systemctl start cups.service
curl -LO https://raw.githubusercontent.com/ThiefInBlueJeans/CompFiles/main/KitCom/Brother_HL-2270DW_series.ppd
echo " "

echo "run $ source /etc/bash.bashrc"
echo "run $ paclean"
echo "run $ sudo systemctl enable bluetooth"
echo "run $ sudo systemctl start bluetooth"
echo "run $ sudo reboot now"
echo " "

echo "// Setup Script Complete //"

echo "// Change Background & Profile Pictures //"
curl -LO https://raw.githubusercontent.com/ThiefInBlueJeans/CompFiles/main/Background_Pic.jpg
curl -LO https://raw.githubusercontent.com/ThiefInBlueJeans/CompFiles/main/Profile_Pic.jpg
echo " "

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

# echo "// Installing SSH //"
# echo "y" | sudo pacman -S openssh
# echo "// Use ssh -p 753 masonp@192.168.0.178 //"
# sudo systemctl enable sshd
# sudo systemctl start sshd
# sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
# sudo cp /home/masonp/Documents/setup/ssh/sshd_config /etc/ssh/sshd_config
# echo " " 

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