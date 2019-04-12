export PATH=~/bin/:$PATH
export EDITOR='/usr/bin/vim'

alias zshrc="$EDITOR ~/.zshrc && source ~/.zshrc"
alias vimrc="$EDITOR ~/.vimrc"

export prompt="
%(?.%F{120}.%F{160})╭─%F{038}%n%f@%F{038}%m%f:%F{038}%~%f
%(?.%F{120}.%F{160})╰─>%f "
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

