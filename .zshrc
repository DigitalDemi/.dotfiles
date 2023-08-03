# start tmux session
if command -v tmux &> /dev/null && [[ -z "$TMUX" ]]
then
    tmux new-session -c $PWD
fi
# neofetch
neofetch
# gpg fix
GPG_TTY=$(tty)
export GPG_TTY
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# Personal Soruce
source ~/scripts/zsh-z.plugin.zsh
source ~/scripts/gpg-agent.plugin.zsh
# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle :compinstall filename '/home/demi/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
# bindkey -v
# End of lines configured by zsh-newuser-install
#
# Dotfiles management, using bare repo
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# My perosnal alias
alias ll="ls -a"
alias vim="nvim"
alias g="git"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=cyan,bg=#ff00ff,bold" 
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
source ~/scripts/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/scripts/zsh-completions/zsh-completions.plugin.zsh
source ~/scripts/zsh-autosuggestions/ zsh-autosuggestions.zsh
