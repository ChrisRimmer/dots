export PATH=~/bin/:$PATH
export EDITOR='/usr/bin/vim'

. ~/.config/zsh/antigen.zsh

if [[ $UID -eq 0 ]]; then
    local user_host='%{$terminfo[bold]$fg[red]%}%n@%m%{$reset_color%}'
    local user_symbol='#'
else
    local user_host='%{$terminfo[bold]$fg[green]%}%n@%m%{$reset_color%}'
    local user_symbol='$'
fi

alias zshrc="$EDITOR ~/.zshrc && source ~/.zshrc"
alias vimrc="$EDITOR ~/.vimrc"

export prompt="
%(?.%F{120}.%F{160})╭─%F{038}%n%f@%F{038}%m%f:%F{038}%~%f
%(?.%F{120}.%F{160})╰─>%f"
alias ls="ls --color"

function bin {
	$@ &> /dev/null &!
}

function ytdl {
	youtube-dl -x "ytsearch1: $*" -o "~/music/%(title)s.%(ext)s" -f bestaudio
}

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%b'

eval $(thefuck --alias)
alias gst='git status'
alias gap='git add -p'
alias gdc='git diff --cached'
alias gd='git diff'
alias c=clear
alias gundo='/git checkout -p --'
