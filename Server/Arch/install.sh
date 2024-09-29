
### DO NOT RUN ###

# Old HP Desktop (BIOS) - Terminal Only

# Plug-In USB
# Boot to USB Menu w/ Esc or F10
ping archlinux.org
fdisk -l
setfont ter-132b
fdisk /dev/sda
d   # as many times as necessary
n
+4000M
t
82
n
w
fdisk -l /dev/sda
mkswap /dev/sda1
swapon /dev/sda1
mkfs.ext4 /dev/sda2
mount /dev/sda2 /mnt
echo "y" | pacman -Sy archlinux-keyring
pacstrap /mnt base linux linux-firmware micro grub reflector man-pages man-db sudo networkmanager
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
ln -sf /usr/share/zoneinfo/US/Pacific /etc/localtime
hwclock --systohc
micro /etc/locale.gen
# uncomment "en_US.UTF-8 UTF-8"
locale-gen
micro /etc/hostname
# add "server2"
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
pacman -Syu
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
reflector -c "US" -f 12 -l 10 -n 12 --save /etc/pacman.d/mirrorlist
cat /etc/pacman.d/mirrorlist
passwd
useradd -m masonp
passwd masonp
rfkill list
EDITOR=micro visudo /etc/sudoers
# add "masonp ALL=(ALL:ALL) ALL"
systemctl enable NetworkManager.service
exit
shutdown now
# remove USB
# power On
# check boot priority
ping archlinux.org
# edit settings
curl -LO https://raw.githubusercontent.com/ThiefInBlueJeans/CompFiles/refs/heads/main/Server/Arch/setup.sh
chmod +x setup.sh
./setup.sh