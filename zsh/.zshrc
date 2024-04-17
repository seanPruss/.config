eval "$(ssh-agent -s)" &>/dev/null
# Linux TTY colours (I doubt I will ever use this)
if [ "$TERM" = "linux" ]; then
	/bin/echo -e "
	\e]P0#191724
	\e]P1#eb6f92
	\e]P2#9ccfd8
	\e]P3#f6c177
	\e]P4#31748f
	\e]P5#c4a7e7
	\e]P6#ebbcba
	\e]P7#e0def4
	\e]P8#26233a
	\e]P9#eb6f92
	\e]PA#9ccfd8
	\e]PB#f6c177
	\e]PC#31748f
	\e]PD#c4a7e7
	\e]PE#ebbcba
	\e]PF#e0def4
	"
fi
# fzf colours
export FZF_DEFAULT_OPTS="
	--color=fg:#908caa,bg:#191724,hl:#ebbcba
	--color=fg+:#e0def4,bg+:#26233a,hl+:#ebbcba
	--color=border:#403d52,header:#31748f,gutter:#191724
	--color=spinner:#f6c177,info:#9ccfd8,separator:#403d52
	--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"

nerdfetch
#source ~/.config/zsh/git.zsh
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Aliases
alias fucking="sudo"

# yay aliases
alias install="yay -S --noconfirm"
update ()
{
    yay -Syu --noconfirm
    flatpak update
}
alias uninstall="yay -Rns --noconfirm"
alias search="yay -Ss"

# ls aliases
alias ls="eza -a --icons=auto"
alias ll="ls -lh --git --git-repos"
alias tree='eza --tree --git-ignore'
# declutter screen and ls
cls() {
    clear
    ls
}
cll() {
    clear
    ll
}

# better cd
cd() {
    z $1 #zoxide is cooler than cd
	check_directory_for_new_repository
    ls # I have never seen anyone ever do a cd without also doing ls
}

# cd into a directory I just made
mcd() {
    mkdir -p $1
    cd $1
}

# cd aliases
alias b="cd .."
alias bb="cd ../.."
alias bbb="cd ../../.."
alias bbbb="cd ../../../.."
alias p="cd -"

# aliases for terminal apps
alias vim="nvim"
alias lzg='lazygit'
alias yz='yazi'
alias tp="btop"

# tmux aliases
alias tm='tmux'
alias tma='tmux attach'
alias tls='tmux ls'

# update mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# typo aliases
alias cim='vim'
alias sl="ls"
alias xs="cd"

# options
unsetopt menu_complete
unsetopt flowcontrol

setopt prompt_subst
setopt always_to_end
setopt append_history
setopt auto_menu
setopt complete_in_word
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history

autoload -U compinit 
compinit
_comp_options+=(globdots)

bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

# plugins
source /usr/share/zsh/plugins/fzf-tab-git/fzf-tab.plugin.zsh
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh
source /usr/share/zsh/plugins/zsh-autoswitch-virtualenv/zsh-autoswitch-virtualenv.plugin.zsh
source /usr/share/zsh/plugins/zsh-auto-notify/auto-notify.plugin.zsh
source /usr/share/zsh/plugins/zsh-autopair/autopair.zsh
source /usr/share/zsh/plugins/zsh-directory-history/zsh-directory-history.zsh
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
AUTO_NOTIFY_IGNORE+=("lazygit" "crontab -e" "yazi" "tmux attach" "tmux" "tms" "cmatrix" "sudoedit" "git log")

if [[ -f /etc/bash.command-not-found ]]; then
    . /etc/bash.command-not-found
fi

zstyle ':completion:*' menu select

# history substring search options
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
