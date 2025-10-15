# zmodload zsh/zprof
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

# install zinit and source zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# initialize completions
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit


###### ZSH PLUGINS ######
# load zsh plugins from oh-my-zsh lazily
zstyle ':omz:plugins:nvm' lazy yes

zinit light "zsh-users/zsh-autosuggestions"
zinit light "zsh-users/zsh-history-substring-search"
zinit light "zsh-users/zsh-syntax-highlighting"
zinit light "ntnyq/omz-plugin-pnpm"
zinit light "Aloxaf/fzf-tab"
# OMZ plugins
zinit snippet OMZP::git
zinit snippet OMZP::npm
zinit snippet OMZP::nvm
zinit snippet OMZP::docker
zinit snippet OMZP::eza
zinit snippet OMZP::aws


#############################################
#### Terminal Prompt (Look and feel) ########
# starship
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init zsh)"
###############################


# ####### General options ###########
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
HISTFILE=$HOME/.zsh_history
HISTSIZE=200000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=#8AADF4,bold'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='fg=#F5BDE6,bold'


###################################
###############CONFIG##############
###################################

# Homebrew on MacOS: Uncomment the following 2 lines for
# export PATH="$HOME/.local/bin:$PATH"
# eval $(/opt/homebrew/bin/brew shellenv)


# Uncomment the following lines for pnpm
# export PNPM_HOME="$HOME/Library/pnpm"
# export PATH="$PNPM_HOME:$PATH"
# export COREPACK_ENABLE_STRICT="0"

# Android SDK on macOS: Uncomment the following lines
# export ANDROID_HOME=$HOME/Library/Android/sdk
# export PATH=$PATH:$ANDROID_HOME/platform-tools

# Go development on MacOS: Uncomment the following lines
# export PATH="$HOME/go/bin:$PATH"
# alias learn-go="tour"

# Bun on MacOS: Uncomment the following lines
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"

# zoxide: cd command on steroids
eval "$(zoxide init --cmd cd zsh)"
# zoxide end


# fzf
# CTRL + R for reverse search and CTRL + T for fuzzy search
# catppuccin theme in fzf
export FZF_DEFAULT_OPTS=" \
--color=bg+:#363A4F,bg:#24273A,spinner:#F4DBD6,hl:#ED8796 \
--color=fg:#CAD3F5,header:#ED8796,info:#C6A0F6,pointer:#F4DBD6 \
--color=marker:#B7BDF8,fg+:#CAD3F5,prompt:#C6A0F6,hl+:#ED8796 \
--color=selected-bg:#494D64 \
--color=border:#6E738D,label:#CAD3F5"
source <(fzf --zsh)
# fzf end

# carapace: adds completions for cli command arguments (example: ```git checkout <tab>```)
export CARAPACE_BRIDGES='zsh,bash' # optional
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
zstyle ':completion:*:git:*' group-order 'alias commands' 'main commands' 'external commands'
source <(carapace _carapace)

# terraform completion
# autoload -U +X bashcompinit && bashcompinit
# complete -o nospace -C /opt/homebrew/bin/terraform terraform



#########################
# ###### ALIASES ########
#########################

# docker
alias dcrm="docker container rm"

#general
# alias vim='nvim'
alias docs='compgen -c | fzf | xargs man'
alias ls='ls --color'
alias ip='curl checkip.amazonaws.com'
alias weather-in='(){ echo getting weather in at $1. ; curl http://wttr.in/"$1" ;}'

# rust
alias learn-rust="rustup docs --book"
# rust end

# git
alias gpull="git pull"
alias gpush="git push"
alias gpod="git pull origin development"
alias gcd="git checkout development"
alias gcm="git checkout master"
alias push-branch='git push origin $(git rev-parse --abbrev-ref HEAD)'
alias apply-latest='git stash apply stash@{0}'
alias stash-all='git stash -u'
# git worktrees: useful for multi-branch development
alias spawn='(){ echo Adding worktree $1. ; git worktree add ../"$1" ;}'
alias list-spawns='git worktree list'
alias despawn='(){ echo Removing worktree at $1. ; git worktree remove -f "$1" ;}'
# git end

# dynamoDB
# dynamo should be downloaded and unzipped to ~/dynamodb (see https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DynamoDBLocal.DownloadingAndRunning.html)
# alias dynamo-local="java -Djava.library.path=$HOME/dynamodb/DynamoDBLocal_lib -jar $HOME/dynamodb/DynamoDBLocal.jar -sharedDb"

# zprof