# "----------------------------------------
# " Preztoの導入による設定
# "----------------------------------------
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# "----------------------------------------
# " 自分で書いた設定
# "----------------------------------------

# HomebrewでgitのPATH指定をしている                                                                              
export PATH="/usr/local/opt/git/bin:$PATH"                                                                       
export GIT_EDITOR=nvim
eval "$(rbenv init -)"                                                                                           

# nvmインストール時の設定PATH                                                                                    
# export NVM_DIR="$HOME/.nvm"                                                                                     
#  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm                          
#  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# rbenv initの設定PATH
eval "$(rbenv init - zsh)"

# Vim→NeoVimへエイリアスの設定
alias vi="nvim"
alias vim="nvim"
alias view="nvim -R"

# Zshの設定
setopt no_beep
setopt auto_pushd
setopt pushd_ignore_dups
setopt auto_cd
setopt hist_ignore_dups
setopt share_history
setopt inc_append_history

export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000

# alias
alias lsa="ls -a"
alias lsl="ls -l"
alias so="source"
alias g="git"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
