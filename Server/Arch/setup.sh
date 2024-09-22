echo "// Running Setup Script //"
echo " "

echo "// Updating Time and Date //"
sudo timedatectl set-timezone America/Los_Angeles
sudo timedatectl status 
echo " "

echo "// Updating System //"
sudo pacman -Syu
echo " "

echo "// Installing Apllications //"
sudo pacman -S ufw openssh docker docker-compose
echo " "

echo "// Configuring SSH //"
echo "// Use ssh -p 753 masonp@192.168.0.### //"
ip a
sudo systemctl enable sshd
sudo systemctl start sshd
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
curl -LO https://raw.githubusercontent.com/ThiefInBlueJeans/CompFiles/main/Standard/sshd_config
sudo mv sshd_config /etc/ssh/sshd_config
echo " "

echo "// Configuring Docker //"
systemctl enable --now docker.service
systemctl status docker.service
echo " "

echo "// Updating Aliases //"
sudo cp /etc/bash.bashrc /etc/bash.bashrc.bak
curl -LO https://raw.githubusercontent.com/ThiefInBlueJeans/CompFiles/main/Standard/bash.bashrc
sudo mv bash.bashrc /etc/bash.bashrc
echo " "

echo "// Configuring Micro //"
mkdir /home/masonp/.config/micro/
curl -LO https://raw.githubusercontent.com/ThiefInBlueJeans/CompFiles/main/Standard/settings.json
mv settings.json /home/masonp/.config/micro/settings.json
echo " " 

echo "// Configuring Firewall //"
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow from 192.168.0.0/24 to any port 753 proto tcp
sudo ufw enable
sudo systemctl enable --now ufw
sudo systemctl status ufw
sudo ufw status verbose
echo " "

echo "run $ source /etc/bash.bashrc"
echo "run $ paclean"
echo "run $ sudo reboot now"
echo "run $ sudo timedateclt set-ntp true"
echo " "

echo "// Setup Script Complete //"

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
