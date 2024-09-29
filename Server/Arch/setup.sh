
### RUN AFTER INSTALL ###

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
sudo pacman -S openssh
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

echo "run $ source /etc/bash.bashrc"
echo "run $ paclean"
echo "run $ sudo reboot now"
echo "run $ sudo timedateclt set-ntp true"
echo " "

echo "// Setup Script Complete //"
