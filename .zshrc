# 補完機能
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# emacsキーバインド
bindkey -e

# 履歴共有
setopt share_history

alias ls='ls -FG'
alias be="bundle exec"

export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
export XDG_CONFIG_HOME=~/.config
eval "$(pyenv init -)"
eval "$(rbenv init -)"

fpath=(~/.zsh $fpath)
 
if [ -f ${HOME}/.zsh/git-completion.zsh ]; then
        zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.zsh
fi
 
if [ -f ${HOME}/.zsh/git-prompt.sh ]; then
        source ${HOME}/.zsh/git-prompt.sh
fi
 
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto
cdls ()
{
    \cd "$@" && ls
}
alias cd="cdls"
autoload colors
colors
local p_chdir="%B%F{blue}[%~]%f%b"$'\n'
local p_gitRepo=$(__git_ps1 " (%s)")\$
# local p_info="%n@%m"

setopt PROMPT_SUBST ; PS1='
%{${fg[cyan]}%}%n@%m%{${reset_color}%}
%{${fg[blue]}%}%~%{${reset_color}%}
%{${fg[red]}%}$(__git_ps1 " (%s)")%{${reset_color}%} 
(·:ﾟдﾟ:·)ﾊｧﾊｧ
$ '

