parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(git::\1)/'
}
export PS1="\[\033]0;\h \w \$(parse_git_branch) \007\][\[\033[01;35m\]\h \[\033[01;34m\]\w \[\033[31m\]\$(parse_git_branch)\[\033[00m\]]$ "

alias ls='ls -G'
alias ll='ls -al'
alias cdboxen='cd /opt/boxen/repo'

export JAVA_HOME=`/usr/libexec/java_home`
export TERM=xterm-256color
export PATH=$HOME/bin:$PATH
export DOTFILES_REPO=$HOME/.dotfiles

[ -f $DOTFILES_REPO/maven/colorize ] && source $DOTFILES_REPO/maven/colorize
[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi
