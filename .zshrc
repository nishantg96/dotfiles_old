if [ "$TMUX" = "" ]; then tmux a || tmux; fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_COLORIZE_TOOL=chroma
ZSH_COLORIZE_STYLE="colorful"

export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true
plugins=(git zsh-autosuggestions z colored-man-pages colorize pip python sudo zsh-nvm)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

setopt no_nomatch

####################################################### ALIASES ############################################

alias cls="clear"
alias update="sudo apt update"
alias upgrade="sudo apt upgrade"
alias update-upgrade="sudo apt update && sudo apt upgrade"
alias spotws="cd /home/ngajjar/spotws && source devel/setup.zsh"
alias killgazebo="killall -9 gazebo & killall -9 gzserver  & killall -9 gzclient"
alias ls="exa --icons --color=always"
alias la="exa -lmh --icons"
alias files='pcmanfm'
alias spotpy='source ~/venvs/spotpy/bin/activate'

alias r1s='export ROS_DISTRO="melodic" && source /opt/ros/melodic/setup.zsh'
alias r2s='export ROS_DISTRO="eloquent" && source /opt/ros/eloquent/setup.zsh'

######################################################## EXPORTS ############################################
export DISPLAY=$(ip route|awk '/^default/{print $3}'):0.0

export CUDA_HOME=/usr/local/cuda
export PATH=${CUDA_HOME}/bin:/home/ngajjar/.local/bin:${PATH}
export LD_LIBRARY_PATH=${CUDA_HOME}/lib64:$LD_LIBRARY_PATH


export ROBOT_IP=192.168.80.3

export ROBOT_SDK_LOGIN=admin
export ROBOT_SDK_PASSWORD=Punktewolke2019

# export ROBOT_SDK_LOGIN=replyuser
# export ROBOT_SDK_PASSWORD=replyuser123

export BOSDYN_CLIENT_USERNAME=admin
export BOSDYN_CLIENT_PASSWORD=Punktewolke2019

# export BOSDYN_CLIENT_USERNAME=replyadmin
# export BOSDYN_CLIENT_PASSWORD=replyadmin123

export ZSH_COMPDUMP="~/.oh-my-zsh/log/.zshcomp"
if [ $(pwd) = "/mnt/c/Windows/System32" ]; then cd ~; fi