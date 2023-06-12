# zmodload zsh/zprof

export LANG=ja_JP.UTF-8

# --------------------------------
# oh-my-zsh setting
# --------------------------------
export ZSH="$HOME/.oh-my-zsh"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# --------------------------------
# theme
# --------------------------------
eval "$(starship init zsh)"

# --------------------------------
# general settings
# --------------------------------
setopt no_beep
setopt auto_pushd
setopt pushd_ignore_dups
setopt auto_cd
setopt hist_ignore_dups
setopt share_history
setopt inc_append_history
export SAVEHIST=10000

# --------------------------------
# cmd alias
# --------------------------------
alias r="exec $SHELL -l"
alias zshrc="nvim ~/.zshrc"
alias ohmyz="nvim ~/.oh-my-zsh"

alias h="cd ~/"
alias u="cd ../"
alias uu="cd ../../"
alias uuu="cd ../../../"
alias p="popd"

alias w="cd ~/workspace"
alias dot="cd ~/dotfiles"

alias c="clear"
alias o="open ."
alias q="exit"

alias scan="sudo arp-scan -I en0 -l"

# --------------------------------
# nvim alias
# --------------------------------
alias v="nvim"
alias va="nvim ."
alias nconf="cd ~/dotfiles/.config/nvim/ && nvim init.lua"

alias obc="cd ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Obsidian/Vault && nvim"

# --------------------------------
# fool proofs
# --------------------------------
alias rm="rm -iv"
function rm(){
        DIR=`eval echo '$'$#`
        OPTION=${@%*$DIR} 
    if [[ $OPTION =~ r && $OPTION =~ f ]]; then 
        echo "rm -rf: remove directory $DIR? [y,n]"
        read yesnojudge
        case "$yesnojudge" in
            "y")
                command rm $@
                ;;
            "n")
                :
                ;;
            ?)
                echo INVAILED OPTION
                ;;
        esac
    else
        command rm $@
    fi
}

# --------------------------------
# JavaScript / TypeScript
# --------------------------------
alias nt="tree -I node_modules"
alias tset="code . & echo '{"\""name"\"": "\""ts-rome-template"\"","\""version"\"": "\""1.0.0"\"","\""description"\"": "\"""\"","\""main"\"": "\""index.ts"\"","\""scripts"\"": {"\""start"\"": "\""npx tsx index.ts"\""},"\""keywords"\"": [],"\""author"\"": "\"""\"","\""license"\"": "\""ISC"\""}' > package.json && pnpm install -D rome typescript tsx @types/node && npx rome init && mkdir .vscode && touch .vscode/settings.json && echo '{"\""[typescript]"\"": {"\""editor.formatOnSave"\"": true,"\""editor.defaultFormatter"\"": "\""rome.rome"\""}}' > .vscode/settings.json & touch index.ts && echo 'console.log("\""hi from tsx"\"");' > index.ts && npx rome format --write package.json .vscode/settings.json && pnpm run start"
alias pup="pnpm add -g pnpm"

# --------------------------------
# Node project shortcut
# --------------------------------
alias s="nr start"
alias d="nr dev"
alias b="nr build"

alias t="nr test"
alias tw="nr test --watch"

alias lint="nr lint"
alias lintf="nr lint:fix"

alias sb='nr storybook'

alias ep="ni -D @fsouza/prettierd eslint_d"
alias dep="nun @fsouza/prettierd eslint_d"

# -------------------------------- #
# Git
# -------------------------------- #

alias lg='lazygit'
alias gtr='cd "$(git rev-parse --show-toplevel)"'

alias gcl='git clone'
alias gst='git stash -u'

alias gco='git checkout'
alias gcob='git checkout -b'

alias gb='git branch'
alias gbd='git branch -d'

alias gc='git commit'
alias gcm='git commit -m'
alias gcam='git add -A && git commit -m'

alias grsh='git reset --soft HEAD^'
alias gt='git tree'

source ~/.zshenv

function gitmain() {
  git config --global user.name $GIT_NAME_1
  git config --global user.email $GIT_EMAIL_1
}

function gitsub() {
  git config --global user.name $GIT_NAME_2
  git config --global user.email $GIT_EMAIL_2
}

# -------------------------------- #
# profiler
# -------------------------------- #
# https://zenn.dev/yutakatay/articles/zsh-neovim-speedcheck
function nvim-startuptime() {
  local file=$1
  local total_msec=0
  local msec
  local i
  for i in $(seq 1 10); do
    msec=$({(TIMEFMT='%mE'; time nvim --headless -c q $file ) 2>&3;} 3>/dev/stdout >/dev/null)
    msec=$(echo $msec | tr -d "ms")
    echo "${(l:2:)i}: ${msec} [ms]"
    total_msec=$(( $total_msec + $msec ))
  done
  local average_msec
  average_msec=$(( ${total_msec} / 10 ))
  echo "\naverage: ${average_msec} [ms]"
}

function nvim-startuptime-slower-than-default() {
  local file=$1
  local time_file_rc
  time_file_rc=$(mktemp "_nvim_startuptime_rc.txt")
  rm -f "_nvim_startuptime_rc.txt"
  local time_rc
  time_rc=$(nvim --headless --startuptime ${time_file_rc} -c "quit" $file > /dev/null && tail -n 1 ${time_file_rc} | cut -d " " -f1)

  local time_file_norc
  time_file_norc=$(mktemp "_nvim_startuptime_norc.txt")
  rm -f "_nvim_startuptime_norc.txt"
  local time_norc
  time_norc=$(nvim --headless --noplugin -u NONE --startuptime ${time_file_norc} -c "quit" $file > /dev/null && tail -n 1 ${time_file_norc} | cut -d " " -f1)

  echo "my vimrc: ${time_rc}s\ndefault neovim: ${time_norc}s\n"
  local result
  result=$(scale=3 echo "${time_rc} / ${time_norc}" | bc)
  echo "${result}x slower your Neovim than the default."
}

function nvim-profiler() {
  local file=$1
  local time_file
  time_file=$(mktemp "_nvim_startuptime.txt")
  rm -f "_nvim_startuptime.txt"
  echo "output: $time_file"
  time nvim --headless --startuptime $time_file -c q $file
  tail -n 1 $time_file | cut -d " " -f1 | tr -d "\n" && echo " [ms]\n"
  cat $time_file | sort -n -k 2 | tail -n 20
}

# -------------------------------- #
# other tools
# -------------------------------- #
alias scan="sudo arp-scan -I en0 -l"

###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

if type complete &>/dev/null; then
  _npm_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -n : -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    if ! IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${words[@]}" \
                           2>/dev/null)); then
      local ret=$?
      IFS="$si"
      return $ret
    fi
    IFS="$si"
    if type __ltrim_colon_completions &>/dev/null; then
      __ltrim_colon_completions "${words[cword]}"
    fi
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    if ! IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)); then

      local ret=$?
      IFS="$si"
      return $ret
    fi
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###

export PNPM_HOME="/Users/cyamy/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# zprof
