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
curl -LO https://raw.githubusercontent.com/ThiefInBlueJeans/CompFiles/refs/heads/main/Standard/sshd_config
sudo mv sshd_config /etc/ssh/sshd_config
echo " "

echo "// Updating Aliases //"
sudo cp /etc/bash.bashrc /etc/bash.bashrc.bak
curl -LO https://raw.githubusercontent.com/ThiefInBlueJeans/CompFiles/refs/heads/main/Standard/bash.bashrc
sudo mv bash.bashrc /etc/bash.bashrc
echo " "

echo "// Configuring Micro //"
mkdir /home/masonp/.config/micro/
curl -LO https://raw.githubusercontent.com/ThiefInBlueJeans/CompFiles/refs/heads/main/Standard/settings.json
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
