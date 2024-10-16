
### DO NOT RUN ###

# New HP Desktop - Arch + Gnome + GDM

# To Do
    # File Sharing - Samba?
    # Media Sharing
    # SSH Server - With Keys
    # Unbound - https://docs.pi-hole.net/guides/dns/unbound/
    # Adguard Home
    # HTTP Server - Apache
    # Podman?
    # Nmap
    # FreshRSS

# Install
    ping archlinux.org
    fdisk -l
    setfont ter-132b
    fdisk /dev/sda
    d   # as many times as necessary
    n
    +1000M
    t
    1
    n
    +4000M
    t
    19
    n
    w
    fdisk -l /dev/sda
    mkfs.fat -F 32 /dev/sda1
    mkswap /dev/sda2
    swapon /dev/sda2
    mkfs.ext4 /dev/sda3
    mount /dev/sda3 /mnt
    mkdir /mnt/efi
    mount /dev/sda1 /mnt/efi
    lsblk
    echo "y" | pacman -Sy archlinux-keyring
    pacstrap /mnt base linux linux-firmware intel-ucode helix grub efibootmgr reflector man-pages man-db sudo networkmanager rsync xorg gnome
    genfstab -U /mnt >> /mnt/etc/fstab
    arch-chroot /mnt
    ln -sf /usr/share/zoneinfo/US/Pacific /etc/localtime
    hwclock --systohc
    helix /etc/locale.gen
    # uncomment "en_US.UTF-8 UTF-8"
    locale-gen
    helix /etc/hostname
    # add "aserv"
    grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/efi
    grub-mkconfig -o /boot/grub/grub.cfg
    pacman -Syu
    cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
    reflector -c "US" -f 12 -l 10 -n 12 --save /etc/pacman.d/mirrorlist
    cat /etc/pacman.d/mirrorlist
    passwd
    useradd -m masonp
    passwd masonp
    rfkill list
    EDITOR=helix visudo /etc/sudoers
    # add "masonp ALL=(ALL:ALL) ALL"
    systemctl enable NetworkManager.service
    systemctl enable gdm.service
    exit
    shutdown now

# Setup
    ping archlinux.org
    sudo timedatectl set-timezone America/Los_Angeles
    sudo timedateclt set-ntp true
    sudo timedatectl status
    sudo pacman -Syu
    echo "y" | sudo pacman -Rsnu gnome-calculator gnome-calendar gnome-contacts gnome-maps gnome-music gnome-software gnome-tour gnome-user-docs gnome-weather malcontent totem yelp
    sudo pacman -S vlc ufw cups
    curl -LO https://raw.githubusercontent.com/ThiefInBlueJeans/CompFiles/main/Standard/dotbashrc
    curl -LO https://raw.githubusercontent.com/ThiefInBlueJeans/CompFiles/main/Standard/config.toml
    curl -LO https://raw.githubusercontent.com/ThiefInBlueJeans/CompFiles/main/Standard/Brother_HL-2270DW_series.ppd
    curl -LO https://raw.githubusercontent.com/ThiefInBlueJeans/CompFiles/main/Standard/Background_Pic.jpg
    curl -LO https://raw.githubusercontent.com/ThiefInBlueJeans/CompFiles/main/Standard/Profile_Pic.jpg
    mv dotbashrc ~/.bashrc
    mv config.toml ~/.config/helix/config.toml
    sudo systemctl enable cups.service
    sudo systemctl start cups.service
    sudo systemctl enable bluetooth
    sudo systemctl start bluetooth
    paclean
    sudo reboot now
    # edit settings & change pics

# RDP
    # Enable Remote Login
    # add username & password
    # login using aserv.rdp on Windows
    ip a

# Keep GDM from Suspending
    sudo su
    passwd gdm  # not neccesary?
    # add password
    sudo -su gdm
    dbus-launch gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
    # reboot

# Samba
    sudo pacman -S samba avahi
    mkdir /home/masonp/share
    sudo helix /etc/samba/smb.conf
    # add
        # [share]
            # comment = aserv Share
            # path = /home/masonp/share
            # writeable = yes
            # browseable = yes
            # create mask = 0644
            # directory mask = 0755
            # write list = user
    sudo smbpasswd -a masonp
    # add password
    sudo systemctl enable avahi-daemon
    sudo systemctl start avahi-daemon
    sudo systemctl enable smb
    sudo systemctl start smb
    # Use \\aserv\share

# DO Firewall
    sudo ufw default deny incoming
    sudo ufw default allow outgoing
    sudo ufw allow from 192.168.0.0/24 to any port 3389 proto tcp
    sudo ufw allow CIFS
    sudo ufw enable
    sudo systemctl enable --now ufw
    sudo systemctl status ufw
    sudo ufw status verbose