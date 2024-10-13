
### DO NOT RUN ###

# New HP Desktop - Arch + Gnome + GDM

ping archlinux.org
fdisk -l
setfont ter-132b
fdisk /dev/sda
d   # as many Times as Necessary
n
+1000M
t
EF
n
+4000M
t
82
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
echo "y" | pacman -Sy archlinux-keyring
pacstrap /mnt base linux linux-firmware intel-ucode helix grub efibootmgr reflector man-pages man-db sudo networkmanager xorg gnome
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
ln -sf /usr/share/zoneinfo/US/Pacific /etc/localtime
hwclock --systohc
helix /etc/locale.gen
# uncomment "en_US.UTF-8 UTF-8"
locale-gen
helix /etc/hostname
# add "ASERV1"
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
# remove USB
# power On
ping archlinux.org
# edit settings
curl -LO https://raw.githubusercontent.com/ThiefInBlueJeans/CompFiles/main/Server/Arch-Gnome/setup.sh
chmod +x setup.sh
./setup.sh