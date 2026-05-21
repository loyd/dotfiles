## Oh My Zsh

ZSH=/usr/share/oh-my-zsh/
ZSH_THEME=custom
ZSH_CUSTOM=$HOME/.config/oh-my-zsh
#DISABLE_UNTRACKED_FILES_DIRTY="true"

zstyle ':omz:update' mode disabled
# WA for https://github.com/ohmyzsh/ohmyzsh/issues/12328
zstyle ':omz:alpha:lib:git' async-prompt no

plugins=(git dirhistory history-substring-search auto-notify fzf-tab zsh-fzf-history-search)

eval "$(zoxide init zsh)"

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## Env

export PATH="$HOME/bin:$HOME/.cargo/bin:$PATH"
export EDITOR=nvim
export BROWSER=brave
export GIT_EXTERNAL_DIFF=difft
export INSTA_DIFF_TOOL='difft --override *.snap:yaml --color always'

## Settings

unsetopt share_history
unsetopt inc_append_history
setopt append_history

export AUTO_NOTIFY_THRESHOLD=1

## Aliases

alias e="$EDITOR"
alias c="cargo"
alias bat="bat --theme gruvbox-material --style numbers,changes"
alias ll="eza -lh --icons --group-directories-first"
alias la="ll -A"
alias tree="eza --tree --icons --git-ignore --group-directories-first"

alias grbmup='gcm && gl && gco - && grbm'
alias grbdup='gcd && gl && gco - && grbd'
alias gdm='gd $(git_main_branch)'

alias ssh='TERM=xterm-256color ssh'

OPENCODE_ALLOW_ALL='{"permission":{"*":"allow"}}'
alias oc="env OPENCODE_CONFIG_CONTENT='$OPENCODE_ALLOW_ALL' fence -p 4000 -- opencode --port 4000"

# Worktrunk integration

if command -v wt >/dev/null 2>&1; then eval "$(command wt config shell init zsh)"; fi

alias wsc='wt switch --create --execute=oc'
