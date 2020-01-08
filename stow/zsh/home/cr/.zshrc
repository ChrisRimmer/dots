export ZSH="/home/cr/.oh-my-zsh"
ZSH_THEME="cr"

HYPHEN_INSENSITIVE="true"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# CR configuration
export LANG=en_GB.UTF-8

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd extendedglob nomatch
unsetopt beep notify
bindkey -v

bindkey '' history-incremental-pattern-search-backward

export TERM=xterm-256color
export PATH=~/bin/:$PATH
export EDITOR='/usr/bin/vim'
export VISUAL=nvim

autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line
zle -N predict-on

alias zshrc="$EDITOR ~/.zshrc && source ~/.zshrc"
alias vimrc="$EDITOR ~/.vimrc"


function ytdl {
	youtube-dl -x "ytsearch1: $*" -o "~/music/%(title)s.%(ext)s" -f bestaudio
}

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

eval $(thefuck --alias)

# General aliases
alias vim=nvim

# Git aliases
alias gap='git add -p'
alias gcm='git commit -m'
alias gd='git diff'
alias gdc='git diff --cached'
alias gst='git status'
alias gundo='git checkout -p --'
alias gunst='git reset HEAD -p'

pipe_buf=$(getconf PIPE_BUF /)
function pad() {
    # redirect stderr (file descriptor 2) to /dev/null to get rid of noise
    dd conv=block cbs=$pipe_buf obs=$pipe_buf 2>/dev/null
}
function unpad() {
    dd conv=unblock cbs=$pipe_buf ibs=$pipe_buf 2>/dev/null
}

# Fix home/del/end
# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        printf '%s' "${terminfo[smkx]}"
    }
    function zle-line-finish () {
        printf '%s' "${terminfo[rmkx]}"
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi

#Startx Automatically
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
    startx
    logout
fi
