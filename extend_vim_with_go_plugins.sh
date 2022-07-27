#!/usr/bin/env bash

set -euo pipefail

function print_message()
{
  echo "####################"
  echo $1
  echo "####################"
}

sudo snap install gopls --classic
sudo snap install go --classic
sudo snap install universal-ctags

# Install tagbar
print_message "Install tagbar"
cd ~/.vim/bundle
git clone https://github.com/majutsushi/tagbar

# Install vim-go
print_message "Install vim-go"
cd ~/.vim/bundle
git clone https://github.com/fatih/vim-go

# Install gotags go binary
go install github.com/jstemmer/gotags@latest

# Append .profile with PATH update
if ! grep -q "go/bin" ${HOME}/.profile; then
    cat <<EOF >>${HOME}/.profile

# (added by extend_vim_with_go_plugins.sh)
# set PATH so it includes user's go bin for using golang binaries
if [ -d "\$HOME/go/bin" ] ; then
    PATH="\$HOME/go/bin:\$PATH"
fi
EOF
fi

# Append .vimrc with gotagbar
if ! grep -q "tagbar_type_go" ${HOME}/.vimrc; then
    cat <<EOF >>${HOME}/.vimrc

" gotags integration
let g:tagbar_type_go = {
        \ 'ctagstype' : 'go',
        \ 'kinds'     : [
                \ 'p:package',
                \ 'i:imports:1',
                \ 'c:constants',
                \ 'v:variables',
                \ 't:types',
                \ 'n:interfaces',
                \ 'w:fields',
                \ 'e:embedded',
                \ 'm:methods',
                \ 'r:constructor',
                \ 'f:functions'
        \ ],
        \ 'sro' : '.',
        \ 'kind2scope' : {
                \ 't' : 'ctype',
                \ 'n' : 'ntype'
        \ },
        \ 'scope2kind' : {
                \ 'ctype' : 't',
                \ 'ntype' : 'n'
        \ },
        \ 'ctagsbin'  : 'gotags',
        \ 'ctagsargs' : '-sort -silent'
\ }
EOF
fi
