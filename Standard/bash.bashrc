
# bash.bashrc customization file for Arch Linux

# deals with command not found
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

# alters standard bash prompt using https://bash-prompt-generator.org/
PS1='\[\e[38;5;23;1m\]\u\[\e[38;5;25;2m\]@\[\e[38;5;26m\]\H\[\e[0;1m\] \[\e[0;38;5;92;2m\][\[\e[1;3m\]\w\[\e[23m\]]\[\e[0;1m\] \[\e[32m\]\$\[\e[39m\] \[\e[0m\]'

# default editor
export EDITOR='micro'

# aliases
alias mc='micro'
alias ls='ls --color=auto'
alias aliasUp='source /etc/bash.bashrc'
alias la='ls -a'
alias cu='cd ..'
alias msg='echo "Enter Message: " && read msg && curl -d "$msg" ntfy.sh/A76bd4Z5Ijvc672'
alias exe='echo "Enter File Name: " && read file && sudo chmod +x $file'
alias pacup='echo "y" | sudo pacman -Syu'
alias paclean='(sudo pacman -Rsnu $(sudo pacman -Qdtq)) && sudo pacman -Scc'
alias packey='echo "y" | sudo pacman -S archlinux-keyring'
alias fontUp='setfont ter-132b'
alias fontDown='setfont'
alias productKey='echo "y" | sudo pacman -S acpica && sudo acpidump -n MSDM && echo "\n//Last five sets of five letters/numbers//\n"'
alias chromeInstall='mkdir /home/family/AUR/ && cd /home/family/AUR/ && curl -LO https://aur.archlinux.org/cgit/aur.git/snapshot/google-chrome.tar.gz && tar -xvf google-chrome.tar.gz && cd google-chrome && makepkg -sirc && cd /home/family/ && rm -r /home/family/AUR/'