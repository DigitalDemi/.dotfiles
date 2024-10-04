# start tmux session
if command -v tmux &> /dev/null && [[ -z "$TMUX" ]]
then
    tmux new-session -c $PWD
fi
# neofetch
fastfetch
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
source ~/scripts/jdk-switch/jdk-switch.plugin.zsh
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
alias ls="ls --color=auto"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# My perosnal alias
alias ll="ls -a"
alias vim="nvim"
alias g="git"
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=cyan,bg=#ff00ff,bold" 
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
source ~/scripts/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/scripts/zsh-completion/zsh-completions.plugin.zsh
source ~/scripts/zsh-autosuggestion/zsh-autosuggestions.zsh
source ~/scripts/fzf-zsh-plugin/fzf-zsh-plugin.plugin.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/nvm/init-nvm.sh

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:~/go/bin
export PATH=$PATH:~/.local/bin/stack

# bun completions
[ -s "/home/demi/.bun/_bun" ] && source "/home/demi/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

bindkey -v

export PATH=$PATH:~/scripts/tmux-tools

bindkey -s ^F "tmux-sessionizer\n"

[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

export ANDROID_HOME="/home/demi/Android/Sdk"
export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools"


# pnpm
export PNPM_HOME="/home/demi/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
