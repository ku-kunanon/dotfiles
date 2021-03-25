setopt prompt_subst

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

PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{cyan}%~%f%b $(git_branch_name)
%# '
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_251.jdk/Contents/Home
export PATH=$PATH:$HOME/dev/bin/apache-maven-3.6.3/bin
export NVM_DIR="$HOME/.nvm"

alias vim="nvim"
alias ls="exa -s extension"
alias ll="exa -ls extension"

alias bb1='(cd "$HOME/dev/wplan/scb-wealth-portal/wealthportal" && mvn clean install -DskipTests -Pfull-build -Pclean-database)'
alias bb2='(cd "$HOME/dev/wplan/scb-wealth-portal/wealthportal" && sh run.sh)'
alias bb3='(cd "$HOME/dev/wplan/scb-wealth-portal/wealthportal/statics/collection" && mvn clean install -Psetup-collections -DskipTests && mvn install -Psetup-collections -Dcollection.name=collection-cxp-universal -Dcollection.version=1.0.0 && sh build_deploy.sh )'

function load_nvm { 
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
}
