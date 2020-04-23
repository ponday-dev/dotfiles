# --------------------------------------------------------------------------------
# language
# --------------------------------------------------------------------------------

export LANG=ja_JP.UTF-8

# --------------------------------------------------------------------------------
# options
# --------------------------------------------------------------------------------

setopt prompt_subst           # PROMPT変数内で変数参照
setopt print_eight_bit        # 補完候補リストの日本語を正しく表示
setopt no_beep                # beepを鳴らさない
setopt no_flow_control        # Ctrl+S/Ctrl+Q によるフロー制御を使わないようにする
setopt ignore_eof             # ^Dでログアウトしないようにする
setopt interactive_comments   # コマンドラインでも # 以降をコメントして扱う
setopt auto_pushd             # 普通のcdでもスタックに入れる
setopt pushd_ignore_dups      # ディレクトリスタックに同じディレクトリを入れない
setopt share_history          # 履歴を共有
setopt hist_ignore_all_dups   # 重複するヒストリを持たない
setopt hist_reduce_blanks     # 履歴から冗長な空白を除く
setopt extended_glob          # ~foo以外にマッチする機能を使わない

# ------------------------------------------------------------------------------
# key bind
# ------------------------------------------------------------------------------

# 履歴検索
bindkey '^R' history-incremental-pattern-search-backward
# 行頭まで削除
bindkey "^U" backward-kill-line

# ------------------------------------------------------------------------------
# aliases
# ------------------------------------------------------------------------------

alias ls='ls -F -G'       # lsをハイライト
alias dc='docker-compose' # 標準のdcコマンドは潰す
alias lg='lazygit'
alias fzf='fzf --reverse'

# git
alias gc='git checkout -b'
alias gp='git branch -a | rg -e '\''remotes/origin/(?!HEAD)'\'' --pcre2 | sed '\''s/remotes\/origin\///'\'' | fzf --height 30% | xargs git pull origin'
alias gs='git branch | fzf --height 30% | xargs git checkout'
alias gr='git branch | fzf --height 30% | xargs git branch -d'
alias gb='git branch'

# --------------------------------------------------------------------------------
# zinit
# --------------------------------------------------------------------------------

if [ -e ~/.zinit/bin/zinit.zsh ]; then
    . ~/.zinit/bin/zinit.zsh

    zinit light zsh-users/zsh-autosuggestions
    zinit wait lucid atload"zicompinit; zicdreplay" blockf for zsh-users/zsh-completions
fi

# --------------------------------------------------------------------------------
# editors
# --------------------------------------------------------------------------------

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'
export LESS='-F -g -i -M -R -S -w -X -z-4'

# ------------------------------------------------------------------------------
# history configurations
# ------------------------------------------------------------------------------

export HISTFILE=~/.zsh_history
export HISTSIZE=100
export SAVEHIST=100

# ------------------------------------------------------------------------------
# completion configurations
# ------------------------------------------------------------------------------

autoload -Uz compinit && compinit -u

# 補完時に大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# sudoの後に補完を使えるように
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/bin /sbin/˙ /bin /usr/X11R6/bin
# psコマンドでプロセス名を補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'
# 補完候補を矢印キーで移動できるように
zstyle ':completion:*:default' menu select

# ------------------------------------------------------------------------------
# color configurations
# ------------------------------------------------------------------------------

autoload -Uz colors && colors

# ------------------------------------------------------------------------------
# words configurations
# ------------------------------------------------------------------------------

autoload -Uz select-word-style
select-word-style default

# ------------------------------------------------------------------------------
# prompt
# ------------------------------------------------------------------------------

# Git情報を表示するためにvcs_infoを利用
autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{118}●"
zstyle ':vcs_info:git:*' unstagedstr "%F{166}●"
zstyle ':vcs_info:git:*' formats '(%F{81}%b%f%u%c%f)'
zstyle ':vcs_info:git:*' actionformats '(%F{81}%b%f%u%c)(%F{118}%a%f)'

export PROMPT='
%F{135}%n %fat %F{166}%m %fin %F{118}%~%f ${vcs_info_msg_0_}
$ '

# --------------------------------------------------------------------------------
# asdf
# --------------------------------------------------------------------------------

. /usr/local/opt/asdf/asdf.sh

# --------------------------------------------------------------------------------
# path
# --------------------------------------------------------------------------------

path=(
    /usr/local/bin/git(N-/) # Git (Install via Homebrew)
    ~/.cargo/bin(N-/) # Cargo (Ignore if it could not  be found)
    $path
)

typeset -gU path

