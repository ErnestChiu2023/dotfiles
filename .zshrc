# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # ust remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# alias dotfiles='/usr/bin/git --git-dir=/Users/ernestchiu/.dotfiles/ --work-tree=/Users/ernestchiu'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


#  Enable key repeat
# -------------------------
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
# speed up past what system preferences allows
defaults write -g KeyRepeat -int 1

. /opt/homebrew/opt/asdf/etc/bash_completion.d/asdf.bash

. /opt/homebrew/opt/asdf/libexec/asdf.sh

. /opt/homebrew/opt/asdf/etc/bash_completion.d/asdf.bash

. /opt/homebrew/opt/asdf/libexec/asdf.sh

. /opt/homebrew/opt/asdf/etc/bash_completion.d/asdf.bash

. /opt/homebrew/opt/asdf/libexec/asdf.sh

export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# add ssh key for github
ssh-add --apple-use-keychain ~/.ssh/id_rsa 2> /dev/null

# Updates docker images
alias udock="docker compose run --no-deps --rm web /bin/bash -c \"bundle && yarn\""

# Restart docker containers
alias rdock="docker-compose up --build --force-recreate -d --scale scheduler=0 --scale worker=0"
alias rdocka="docker-compose up --build --force-recreate -d"

# Lazy docker alias
alias lzd='lazydocker'

# run eslint
alias es="p eslint --fix"

# run tslint
alias ts="yarn run tsc-strict"

# resync mutagen
alias msync="mutagen sync resume $(mutagen sync list|grep Identifier|sed -e 's/Identifier: //')"

# better ls
alias ls="eza"

# zoxide better cd
eval "$(zoxide init zsh)"
alias cd="z"
alias cdi="zi"

# clear terminal
alias c="clear"

#  CLI management
# -------------------------
alias reload="exec zsh"
alias r="reload"

# Git Aliases 
alias gs="git status"
alias gpm="git pull origin master"
alias grm="git rebase master"
alias gp="git push"
alias ga="git commit --amend --no-edit"
alias gc="git commit"
alias gb="git --no-pager branch -vv"
alias gch--="git checkout -- ."
#  fzf
# -------------------------
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Use rg as default find command
export FZF_DEFAULT_COMMAND='rg --files --hidden'
# NOTE: Not recommended to add --preview to FZF default options
export FZF_DEFAULT_OPTS='--inline-info --multi --reverse'

function gcb() { git checkout -b $USER/"$@"; } # make new branch with ust ticket name -- eg. 'gcb ORION-699'

# FZF git branch
function _gbr() {
  local branch
  branch=$(echo "$(gb -a)" | fzf --exit-0 --select-1 --query="$1 !^remotes" --no-multi --height 35% --no-hscroll --nth=1 --ansi --preview="git --no-pager log -150 --compact-summary --pretty=format:%s '..{2}'") &&
  echo "$branch" | sed "s/^*//" | awk '{print $1}' | sed "s/.* //"
}
# Check out the selected branch
function gch() {
  local branch
  branch=$(_gbr "$1")
  [[ ! -z "$branch" ]] && git checkout "$branch"
}
unalias gbd
# Delete the selected branch
function gbd() {
  local branch
  branch=$(_gbr "$1")
  [[ ! -z "$branch" ]] && git branch -D "$branch"
}
unalias gd
# Diff the selected branch against the current branch
function gd() {
  local branch
  branch=$(_gbr "$1")
  [[ ! -z "$branch" ]] && git diff "$branch"...
}
# display the files changed between the selected branch and the current branch
function changed() {
  local branch
  branch=$(_gbr "$1")
  [[ ! -z "$branch" ]] && git --no-pager diff --name-only "$branch"...
}


# Sets up config alias for us to use git in config file
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# ========================
#  fzf
# ========================
#
# https://github.com/junegunn/fzf/wiki/Examples
# 
# e -- edit
# e [FUZZY PATTERN] - Open the selected file with the default editor
function e() {
  IFS=$'\n' files=($(fzf --exit-0 --select-1 --query="$1" --multi --ansi --preview="bat --style=numbers --color=always --line-range=:100 {1}"))
  [[ -n "$files" ]] && ${EDITOR:-nvim} "${files[@]}"
}
