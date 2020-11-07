
alias zshrc="vim $HOME/.zshrc"
alias vimrc="vim $HOME/.vimrc"
alias tmuxrc="vim $HOME/.tmux.conf"
alias aliasrc="vim $ZSH_CUSTOM/aliases.zsh"
alias i3rc="vim $HOME/.config/i3/config"
alias polyrc="vim $HOME/.config/polybar/config"
alias rangerrc="vim $HOME/.config/ranger/rc.conf"
alias ncmpcpprc="vim $HOME/.ncmpcpp/config"

alias xx="exit"
alias src="source $HOME/.zshrc"

# fasd related
alias v='f -e vim' # quick opening files with vim
alias m='f -e cmus' # quick opening files with cmus
alias o='a -e xdg-open' # quick opening files with xdg-open

# open file explorer
alias ff='pcmanfm'

# tmux
alias tls='tmux list-sessions'
alias tks='tmux kill-server'


# Dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Rm vim tmp files
alias rmv='rm -rf ~/.vim-tmp/* && rm -rf ~/.vim-tmp/.*'
alias i3rc="vim $HOME/.config/i3/config"

alias install="sudo apt-get install"

alias cons="php bin/console " 
alias sy="symfony "

# Suffix alias 
# alias -s [file-extension]=[name-of-app]
alias -s php=vim
alias -s css=vim
alias -s scss=vim
alias -s twig=vim
alias -s txt=vim


# Global alias
alias -g G=" | grep"


# Open vim session
alias vss="vim -S ~/.vim/vim-sessions/"
alias r="ranger"
