# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#
# ~/.zshrc
#

# Path to your oh-my-zsh installation.
# export ZSH=${HOME}/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# export ZSH_THEME="jonathan"
# source $ZSH/oh-my-zsh.sh

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
source ~/.zsh/history.zsh

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/opt/android-sdk/tools:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:${HOME}/.bin/:$PATH:${HOME}/.local/bin"
export GOPATH=~/go
# export MANPATH="/usr/local/man:$MANPATH"




# PROMPT="%{$fg[yellow]%}%n%{$reset_color%}@%{$fg[yellow]%}%m %{$fg_no_bold[cyan]%}%1~ %# %{$reset_color%}"

bindkey -v
bindkey "^R" history-incremental-search-backward
alias shutdown='sudo shutdown'
alias cp="cp -i"
alias grep='grep --color=tty -d skip'
#alias rg='ranger'
alias open='xdg-open'
alias clip="xclip -selection c"
alias ls="ls --color"
alias l="ls -la"
alias python="python3"
# if type nvim > /dev/null 2>&1; then
#     alias vim='nvim'
# fi

export VISUAL="vim"

# Signal CMD-Mode
# ~/.oh-my-zsh/themes/jonathan.zsh-theme, line 136: replace "> $PR_NO_COLOUR ' " with "> $LPROMPT$PR_NO_COLOUR ' "
# precmd() {
#     [ -z "$NETNS" ] && RPROMPT="%{$fg[cyan]%}◀%{$reset_color%}" || RPROMPT="%{$fg[cyan]%}◀%{$fg[green]%} ($NETNS)%{$reset_color%}"
#     LPROMPT="%{$fg[cyan]%}▶%{$reset_color%}"
# }
# zle-keymap-select() {
#     [ -z "$NETNS" ] && RPROMPT="%{$fg[cyan]%}◀%{$reset_color%}" || RPROMPT="%{$fg[cyan]%}◀%{$fg[green]%} ($NETNS)%{$reset_color%}"
#     LPROMPT="%{$fg[cyan]%}▶%{$reset_color%}"
#     [[ $KEYMAP = vicmd ]] && LPROMPT="%{$fg[magenta]%}▼%{$reset_color%}" && RPROMPT="%{$fg[magenta]%}▼%{$fg[green]%} $NETNS%{$reset_color%}"
#     () { return $__prompt_status }
#     zle reset-prompt
# }
# zle-line-init() {
#      typeset -g __prompt_status="$?"
# }
# zle -N zle-keymap-select
# zle -N zle-line-init

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Completion
zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
autoload -U compinit && compinit

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# source ${HOME}/.private
#
# START https://github.com/belak/zsh-utils
[[ ! -d "$HOME/.antigen" ]] && git clone https://github.com/zsh-users/antigen.git "$HOME/.antigen"
source "$HOME/.antigen/antigen.zsh"

antigen theme romkatv/powerlevel10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Set the default plugin repo to be zsh-utils
# antigen use belak/zsh-utils

# Specify completions we want before the completion module
antigen bundle zsh-users/zsh-completions

# Specify plugins we want
antigen bundle editor
antigen bundle history
antigen bundle prompt
antigen bundle utility
antigen bundle completion

# Vi Mode
antigen bundle jeffreytse/zsh-vi-mode

# Specify additional external plugins we want
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

# Load everything
antigen apply

# Set any settings or overrides here
# prompt belak
bindkey -e
# END https://github.com/belak/zsh-utils
