#!/bin/bash

# Install homebrew:
"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install gsed
brew install gsed

# Install casks:
brew install --cask visual-studio-code \
	firefox \
	dbeaver-community \
	iterm2 \
	spotify \ 

# Install formulae 
brew install --formulae tmux \ 
	pyenv \
	pyenv-virtualenv \ 

# Install AWS CLI
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"\nsudo installer -pkg AWSCLIV2.pkg -target


