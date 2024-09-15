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
echo "Use: pacman -Q to list installed packages
echo "y" | sudo pacman -Rsnu epiphany gnome-calculator gnome-calendar gnome-connections gnome-contacts gnome-maps gnome-music gnome-software gnome-tour gnome-user-docs gnome-weather malcontent totem yelp
echo " "

echo "// Installing Apllications //"
sudo pacman -S vlc ufw chromium cups -y
echo " "

echo "// Updating Aliases //"
sudo cp /etc/bash.bashrc /etc/bash.bashrc.bak
curl -LO https://raw.githubusercontent.com/ThiefInBlueJeans/CompFiles/main/bash.bashrc
sudo mv bash.bashrc /etc/bash.bashrc
echo " "

echo "// Configuring Micro //"
mkdir /home/family/.config/micro/
curl -LO https://raw.githubusercontent.com/ThiefInBlueJeans/CompFiles/main/settings.json
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
curl -LO https://raw.githubusercontent.com/ThiefInBlueJeans/CompFiles/main/Brother_HL-2270DW_series.ppd
echo " "

echo "// Change Background & Profile Pictures //"
curl -LO https://raw.githubusercontent.com/ThiefInBlueJeans/CompFiles/main/Background_Pic.jpg
curl -LO https://raw.githubusercontent.com/ThiefInBlueJeans/CompFiles/main/Profile_Pic.jpg
echo " "

echo "run $ source /etc/bash.bashrc"
echo "run $ paclean"
echo "run $ sudo systemctl enable bluetooth"
echo "run $ sudo systemctl start bluetooth"
echo "run $ sudo reboot now"
echo " "

echo "// Setup Script Complete //"