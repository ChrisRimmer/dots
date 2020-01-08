# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd extendedglob nomatch
unsetopt beep notify
bindkey -v
# End of lines configured by zsh-newuser-install

export TERM=xterm-256color
export PATH=~/bin/:$PATH
export EDITOR='/usr/bin/vim'
export VISUAL=vim

autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line
zle -N predict-on

alias zshrc="$EDITOR ~/.zshrc && source ~/.zshrc"
alias vimrc="$EDITOR ~/.vimrc"

PROMPT="%(?.%F{46}.%F{196})%n@%m:~ %f"
alias ls="ls --color"

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

# Git aliases
alias gap='git add -p'
alias gcm='git commit -m'
alias gd='git diff'
alias gdc='git diff --cached'
alias gst='git status'
alias gundo='git checkout -p --'
alias gunst='git reset HEAD -p'

alias c=clear

pipe_buf=$(getconf PIPE_BUF /)
function pad() {
    # redirect stderr (file descriptor 2) to /dev/null to get rid of noise
    dd conv=block cbs=$pipe_buf obs=$pipe_buf 2>/dev/null
}
function unpad() {
    dd conv=unblock cbs=$pipe_buf ibs=$pipe_buf 2>/dev/null
}

