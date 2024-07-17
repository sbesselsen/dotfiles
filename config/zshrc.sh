# User configuration
alias kns="kubie ns"
alias kctx="kubie ctx"
alias awsenv='asp'
alias awscreds='eval $(aws-temp-creds)'
alias ls='eza'
alias man='tldr'
alias cd='z'
alias cat='bat'
alias vi='nvim'

cdr() {
  root_dir="$(git rev-parse --show-toplevel)"
  if [[ "$1" = "-l" ]]; then
    ls $root_dir
  else
    cd $root_dir/$1
  fi
}

DIR="$(dirname $0)"

# Make my own scripts accessible on the path.
export PATH="$PATH:$DIR/../scripts"
export EDITOR=nvim

function kctxreset() {
  for VAR in $(env | grep KUBIE_ | sed 's/=.*$//'); do
    unset $VAR
  done
  unset KUBECONFIG
}

setopt HIST_IGNORE_SPACE

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# asdf to manage versions
. "$HOME/.asdf/asdf.sh"

# Lima BEGIN
# Make sure iptables and mount.fuse3 are available
PATH="$PATH:/usr/sbin:/sbin"
export PATH
# Lima END
