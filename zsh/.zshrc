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
# other tools
# -------------------------------- #
alias scan="sudo arp-scan -I en0 -l"