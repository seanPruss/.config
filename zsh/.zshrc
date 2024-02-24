uwufetch -i
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
export EDITOR="nvim"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/local/lib"
export FZF_DEFAULT_OPTS="
	--color=fg:#908caa,bg:#191724,hl:#ebbcba
	--color=fg+:#e0def4,bg+:#26233a,hl+:#ebbcba
	--color=border:#403d52,header:#31748f,gutter:#191724
	--color=spinner:#f6c177,info:#9ccfd8,separator:#403d52
	--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
# Add flags to existing aliases.
alias fucking="sudo"
alias install="yay -S"
# alias update="yay -Syu"
update ()
{
    yay -Syu
    flatpak update
}
alias uninstall="yay -Rns"
alias ls="eza -a --icons=auto"
alias sl="ls"
alias ll="ls -lh"
# Define aliases.
foo() {
    z $1
    ls
}
alias cd="foo"
mcd() {
    mkdir -p $1
    cd $1
}
cls() {
    clear
    ls
}
cll() {
    clear
    ll
}
alias tree='ls --tree'
alias b="cd .."
alias bb="cd ../.."
alias bbb="cd ../../.."
alias bbbb="cd ../../../.."
alias p="cd -"
alias pp="cd -2"
alias ppp="cd -3"
alias pppp="cd -4"
alias vim="nvim"
# Git aliases
alias gc='git commit -m'
alias gco='git checkout'
alias ga='git add'
alias gb='git branch'
alias gba='git branch --all'
alias gbd='git branch -D'
alias gcp='git cherry-pick'
alias gd='git diff -w'
alias gds='git diff -w --staged'
alias grs='git restore --staged'
alias gst='git rev-parse --git-dir > /dev/null 2>&1 && git status || ls'
alias gu='git reset --soft HEAD~1'
alias gpr='git remote prune origin'
alias gpl='git pull'
alias grd='git fetch origin && git rebase origin/master'
alias gbb='git-switchbranch'
alias gbf='git branch | head -1 | xargs' # top branch
alias gl=pretty_git_log
alias gla=pretty_git_log_all
#alias gl="git log --graph --format=format:'%C(bold blue)%h%C(reset) - %C(white)%s%C(reset) %C(green)%an %ar %C(reset) %C(bold magenta)%d%C(reset)'"
#alias gla="git log --all --graph --format=format:'%C(bold blue)%h%C(reset) - %C(white)%s%C(reset) %C(bold magenta)%d%C(reset)'"
alias git-current-branch="git branch | grep \* | cut -d ' ' -f2"
alias grc='git rebase --continue'
alias gra='git rebase --abort'
alias gec='git status | grep "both modified:" | cut -d ":" -f 2 | trim | xargs nvim -'
alias gcan='gc --amend --no-edit'

alias gp="git push"
alias gpf='git push --force-with-lease'

alias gbdd='git-branch-utils -d'
alias gbuu='git-branch-utils -u'
alias gbrr='git-branch-utils -r -b develop'
alias gg='git branch | fzf | xargs git checkout'
alias gup='git branch --set-upstream-to=origin/$(git-current-branch) $(git-current-branch)'

alias gnext='git log --ancestry-path --format=%H ${commit}..master | tail -1 | xargs git checkout'
alias gprev='git checkout HEAD^'
alias lzg='lazygit'
alias yz='yazi'

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
source ~/.config/zsh/fzf-tab/fzf-tab.plugin.zsh
source ~/.config/zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.config/zsh/zsh-you-should-use/you-should-use.plugin.zsh
source ~/.config/zsh/zsh-autoswitch-virtualenv/autoswitch_virtualenv.plugin.zsh
source ~/.config/zsh/zsh-auto-notify/auto-notify.plugin.zsh
AUTO_NOTIFY_IGNORE+=("lazygit" "crontab -e" "yazi" "spotify-launcher")

zstyle ':completion:*' menu select

# history substring search options
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
