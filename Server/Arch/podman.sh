
### DO NOT RUN ###

# podman
    https://archlinux.org/packages/extra/x86_64/podman/
    https://wiki.archlinux.org/title/Podman
# podman-compose
    https://archlinux.org/packages/extra/any/podman-compose/
# buildah
    https://archlinux.org/packages/extra/x86_64/buildah/
    https://wiki.archlinux.org/title/Buildah
# ufw
    https://archlinux.org/packages/extra/any/ufw/
    https://wiki.archlinux.org/title/Uncomplicated_Firewall
    sudo ufw default deny incoming
    sudo ufw default allow outgoing
    sudo ufw allow from 192.168.0.0/24 to any port 753 proto tcp
    sudo ufw enable
    sudo systemctl enable --now ufw
    sudo systemctl status ufw
    sudo ufw status verbose
# htop
    https://archlinux.org/packages/extra/x86_64/htop/
# clamav
    https://archlinux.org/packages/extra/x86_64/clamav/
    https://hub.docker.com/r/clamav/clamav