#!/usr/bin/env bash

export GITHUB_USERNAME=lt-brlara

export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH

function command_exists {
  #this should be a very portable way of checking if something is on the path
  #usage: "if command_exists foo; then echo it exists; fi"
  type "$1" &> /dev/null
}

function install_brew {
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

function chezmoi_get {
  sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply $GITHUB_USERNAME
}

if command_exists apt;
then 
  sudo apt-get update;
  sudo apt-get install build-essential procps curl file git zsh;
else echo "WARN: apt package-manager not found, moving on...";
fi

if command_exists yum;
then sudo yum groupinstall 'Development Tools';
sudo yum install procps-ng curl file git zsh;
else echo "WARN: yum package-manager not found, moving on..."
fi

if command_exists brew; 
then echo "INFO: Brew detected, moving on...";
else echo "WARN: Brew not detected, installing..."; 
install_brew; 
fi

if [ -f $HOME/Brewfile ]; 
then echo "INFO: Brewfile found, installing listed software."; 
  brew bundle ; 
else echo "WARN: No Brewfile found."; 
fi

if command_exists chezmoi; 
then echo "INFO: Grabbing dotfiles from $GITHUB_USERNAME"; 
  chezmoi_get; 
else echo "WARN: chezmoi not installed, cannot pull dotfiles from $GITHUB_USERNAME";
fi

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

chsh -s /bin/zsh

echo "INFO: Setup complete! Be sure to run 'zsh'!"
