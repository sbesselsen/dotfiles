# User configuration
alias k='kubectl'
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

# Make my own scripts accessible on the path.
export PATH="$PATH:$HOME/.dotfiles/scripts:$HOME/.dotfiles-private/scripts"
export EDITOR=nvim

# Bind Ctrl+A and Ctrl+E
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

function kctxreset() {
  for VAR in $(env | grep KUBIE_ | sed 's/=.*$//'); do
    unset $VAR
  done
  unset KUBECONFIG
}

function asp() {
  if [[ -z "$1" ]]; then
    unset AWS_DEFAULT_PROFILE AWS_PROFILE AWS_EB_PROFILE AWS_PROFILE_REGION
    echo AWS profile cleared.
    return
  fi

  local -a available_profiles
  available_profiles=($(aws_profiles))
  if [[ -z "${available_profiles[(r)$1]}" ]]; then
    echo "${fg[red]}Profile '$1' not found in '${AWS_CONFIG_FILE:-$HOME/.aws/config}'" >&2
    echo "Available profiles: ${(j:, :)available_profiles:-no profiles found}${reset_color}" >&2
    return 1
  fi

  export AWS_DEFAULT_PROFILE=$1
  export AWS_PROFILE=$1
  export AWS_EB_PROFILE=$1

  export AWS_PROFILE_REGION=$(aws configure get region)
}

function aws_profiles() {
  aws --no-cli-pager configure list-profiles 2> /dev/null && return
  [[ -r "${AWS_CONFIG_FILE:-$HOME/.aws/config}" ]] || return 1
  grep --color=never -Eo '\[.*\]' "${AWS_CONFIG_FILE:-$HOME/.aws/config}" | sed -E 's/^[[:space:]]*\[(profile)?[[:space:]]*([^[:space:]]+)\][[:space:]]*$/\2/g'
}
function _aws_profiles() {
  reply=($(aws_profiles))
}
compctl -K _aws_profiles asp

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
