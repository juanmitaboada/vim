#!/bin/bash

# djmoch/vim-makejob

base='
Raimondi/delimitMate
honza/vim-snippets
tpope/vim-surround
szw/vim-tags
scrooloose/nerdtree
vim-airline/vim-airline
SirVer/ultisnips
airblade/vim-gitgutter
tpope/vim-commentary
leafgarland/typescript-vim
majutsushi/tagbar
pangloss/vim-javascript
tpope/vim-dispatch
mileszs/ack.vim
tpope/vim-repeat
kien/ctrlp.vim
mhinz/vim-signify
w0rp/ale
plasticboy/vim-markdown
justmao945/vim-clang
jlanzarotta/bufexplorer
hari-rangarajan/CCTree
sudar/vim-arduino-syntax
sudar/vim-arduino-snippets
Valloric/YouCompleteMe
fisadev/vim-isort
psf/black
tpope/vim-pathogen
rust-lang/rust.vim
ziglang/zig.vim
MaskRay/ccls
prabirshrestha/vim-lsp
normen/vim-pio
coddingtonbear/neomake-platformio
aesnyder/vim-radon
'
# You complete me:
# Valloric/YouCompleteMe
# d98f896ada495c3687007313374b2f945a2f2fb4

# Local vim... (it asks the user everytime you open a file)
# LucHermitte/lh-vim-lib
# LucHermitte/local_vimrc

# Golang - https://pmihaylov.com/vim-for-go-development/
# tpope/vim-pathogen

# Make sure basic packages are installed
for url in $base ; do
    user="`echo $url | cut -d "/" -f 1`"
    repo="`echo $url | cut -d "/" -f 2`"
    if [[ ! -e $repo ]] ; then
        git clone https://github.com/$user/$repo
    fi
done

# Now go for the upgrade

cwd="`pwd`"
elements="`/bin/ls`"

for element in $elements ; do
    cd $cwd
    if [[ -d $element ]] ; then
        cd $element
        if [[ -d .git ]] ; then
           echo "Updating ${element}..."
           git pull
           echo
        fi
    fi
done
cd $cwd

# Recompile YoyCompleteMe
echo ""
echo "====================== ---> Updating YouCompleteMe <--- ================"
echo ""
cd YouCompleteMe/
echo "Updating submodules..."
git submodule update --init --recursive
echo "Recompiling submodules..."
./install.py --clang-completer
cd ..
