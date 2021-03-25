setopt prompt_subst

export NVM_DIR="$HOME/.nvm"
export DOTFILES=$HOME/dotfiles

function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo '- ('$branch')'
  fi
}

function load_nvm { 
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
}

source $DOTFILES/work
source $DOTFILES/aliases


PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{cyan}%~%f%b $(git_branch_name)
%# '



