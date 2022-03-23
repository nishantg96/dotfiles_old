# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/krekik/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_COLORIZE_TOOL=chroma
ZSH_COLORIZE_STYLE="colorful"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting z colored-man-pages colorize pip python thefuck sudo)

source $ZSH/oh-my-zsh.sh



# Example aliases
alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"

# >>> conda initialize >>>
__conda_setup="$('/home/krekik/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/krekik/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/krekik/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/krekik/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="/usr/local/cuda/bin:$PATH"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/home/krekik/Nishant/TensorRT-8.2.0.6/lib"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/lib"
export PATH="$PATH:/usr/local/bin"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig"

export PYTHONPATH="$PYTHONPATH:/home/krekik/HIR-demonstration/openpose/build/python"

source /opt/ros/noetic/setup.zsh
source /home/krekik/Demonstration-ws/devel/setup.zsh

alias cls="clear"
alias update="sudo apt update"
alias upgrade="sudo apt upgrade"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source $(dirname $(gem which colorls))/tab_complete.sh
alias ls="colorls --sd"
alias lc='colorls -lA --sd'
alias killgazebo="killall -9 gazebo & killall -9 gzserver  & killall -9 gzclient"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export K4A_MAX_LIBUSB_POOL=80000000
