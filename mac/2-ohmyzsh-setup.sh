#!/bin/bash

# Install ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install Powerline fonts:
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts

# Configure .zshrc

# Set theme to agnoster
gsed -i 's/"robbyrussell"/"agnoster"/' ~/.zshrc

# Set plugins
gsed -i 's/(git)/(colorize colored-man-pages copyfile git jsontools zsh-autosuggestions)/g' ~/.zshrc

# Update zsh autosuggest highlight color
echo "ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=23'" >> ~/.zshrc

# pynenv configuration
tee -a ~/.zshrc << END
# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/shims:$PATH"
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
#if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi    
END

# Configure MacOS to use gnu-sed by default
echo 'PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"' >> ~/.zshrc

# Reload the .zshrc file
source ~/.zshrc
