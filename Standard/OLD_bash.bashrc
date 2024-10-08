[ -z "$PS1" ] && return
shopt -s checkwinsize
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi
if ! [ -n "${SUDO_USER}" -a -n "${SUDO_PS1}" ]; then
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
if [ -x /usr/lib/command-not-found -o -x /usr/share/command-not-found/command-not-found ]; then
	function command_not_found_handle {

                if [ -x /usr/lib/command-not-found ]; then
		   /usr/lib/command-not-found -- "$1"
                   return $?
                elif [ -x /usr/share/command-not-found/command-not-found ]; then
		   /usr/share/command-not-found/command-not-found -- "$1"
                   return $?
		else
		   printf "%s: command not found\n" "$1" >&2
		   return 127
		fi
	}
fi

export EDITOR='micro'
alias mc='micro'
alias ls='ls --color=auto'
alias AUP='source /etc/bash.bashrc'
alias welcome='echo "Welcome $USER"'
alias la='ls -a'
alias cu='cd ..'
alias msg='echo "Enter Message: " && read msg && curl -d "$msg" ntfy.sh/A76bd4Z5Ijvc672'
alias exe='read file && sudo chmod +x $file'
alias pacup='echo "y" | sudo pacman -Syu'
alias paclean='(sudo pacman -Rsnu $(sudo pacman -Qdtq)) && sudo pacman -Scc'
alias packey='echo "y" | sudo pacman -S archlinux-keyring'
alias fontUp='setfont ter-132b'
alias fontDown='setfont'
alias productKey='echo "y" | sudo pacman -S acpica && sudo acpidump -n MSDM && echo "\n//Last five sets of five letters/numbers//\n"'
alias chromeUpdate='mkdir /home/family/AUR/ && cd /home/family/AUR/ && curl -LO https://aur.archlinux.org/cgit/aur.git/snapshot/google-chrome.tar.gz && tar -xvf google-chrome.tar.gz && cd google-chrome && makepkg -sirc && cd /home/family/ && rm -r /home/family/AUR/'