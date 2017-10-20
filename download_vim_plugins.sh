#!/bin/bash

HOME_DIR=~

function print_message()
{
  echo "####################"
  echo $1
  echo "####################"
}

# Install pathogen
print_message "Install pathogen"
mkdir -p $HOME_DIR/.vim/autoload $HOME_DIR/.vim/bundle
curl -LSso $HOME_DIR/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Install solarized colors
print_message "Install solarized"
cd $HOME_DIR/.vim/bundle
git clone git://github.com/altercation/vim-colors-solarized.git

# Install fugitive
print_message "Install fugitive"
cd $HOME_DIR/.vim/bundle
git clone https://github.com/tpope/vim-fugitive.git
vim -u NONE -c "helptags vim-fugitive/doc" -c q

# Install lightline
print_message "Install lightline"
git clone https://github.com/itchyny/lightline.vim $HOME_DIR/.vim/bundle/lightline.vim
