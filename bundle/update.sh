#!/bin/bash

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
brentyi/isort.vim
psf/black
tpope/vim-pathogen
rust-lang/rust.vim
ziglang/zig.vim
MaskRay/ccls
prabirshrestha/vim-lsp
normen/vim-pio
coddingtonbear/neomake-platformio
aesnyder/vim-radon
itspriddle/vim-shellcheck
rhysd/vim-clang-format
tpope/vim-unimpaired
'

# === Other plugins ===

# djmoch/vim-makejob
# github/copilot.vim        # Copilot
# madox2/vim-ai             # ChatGPT
# dense-analysis/neural     # Multi-language AI code completion

# You complete me:
# Valloric/YouCompleteMe
# d98f896ada495c3687007313374b2f945a2f2fb4

# Local vim... (it asks the user everytime you open a file)
# LucHermitte/lh-vim-lib
# LucHermitte/local_vimrc

# Golang - https://pmihaylov.com/vim-for-go-development/
# tpope/vim-pathogen

# =====================

# Make sure basic packages are installed
for url in $base ; do
    user="$(echo "$url" | cut -d "/" -f 1)"
    repo="$(echo "$url" | cut -d "/" -f 2)"
    if [[ ! -e $repo ]] ; then
        git clone "https://github.com/$user/$repo"
    fi
done

# Now go for the upgrade

cwd="$(pwd)"
elements="$(/bin/ls)"

for element in $elements ; do
    cd "$cwd" || exit
    if [[ -d $element ]] ; then
        cd "$element" || exit
        if [[ -d .git ]] ; then
           echo "Updating ${element}..."
           git pull
           echo
        fi
    fi
done
cd "$cwd" || exit

# Recompile YoyCompleteMe
echo ""
echo "====================== ---> Updating YouCompleteMe <--- ================"
echo ""
cd YouCompleteMe/ || exit
echo "Updating submodules..."
git submodule update --init --recursive
echo "Recompiling submodules..."
./install.py --clang-completer
cd ..

# Verify ALE CPPCHECK plugin status
if grep -q "file-filter" ale/autoload/ale/handlers/cppcheck.vim ; then
    echo ""
    echo "======================== ---> Check ALE CPPCHECK <--- =================="
    echo ""
    echo "WARNING: ALE CPPCHECK handler contains file-filter entry, it may fail and won't show errors on VIM!"
    echo "Please edit: ale/autoload/ale/handlers/cppcheck.vim"
    echo "And replace: \\   ? '--project=' . ale#Escape(l:json_path[len(l:dir) + 1: ]) . ' --file-filter=' . ale#Escape(bufname(a:buffer))"
    echo "with:        \\   ? '--project=' . ale#Escape(l:json_path[len(l:dir) + 1: ])"
    exit 1
fi
exit 0
