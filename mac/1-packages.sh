#!/bin/bash

# Install homebrew:
"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install casks:
brew install --cask $(cat packages/casks)

# Install formulae 
brew install --formulae $(cat packages/formulae)

# Install AWS CLI
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"\nsudo installer -pkg AWSCLIV2.pkg -target
