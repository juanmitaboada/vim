#!/bin/bash

logfile="$(pwd)/update.log"
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
psf/black:stable
tpope/vim-pathogen
ziglang/zig.vim
MaskRay/ccls
prabirshrestha/vim-lsp
normen/vim-pio
coddingtonbear/neomake-platformio
juanmitaboada/vim-radon
itspriddle/vim-shellcheck
rhysd/vim-clang-format
tpope/vim-unimpaired
github/copilot.vim
rust-lang/rust.vim
'

# === Other plugins ===

# djmoch/vim-makejob
# madox2/vim-ai             # ChatGPT
# dense-analysis/neural     # Multi-language AI code completion

# Local vim... (it asks the user everytime you open a file)
# LucHermitte/lh-vim-lib
# LucHermitte/local_vimrc

# Golang - https://pmihaylov.com/vim-for-go-development/
# tpope/vim-pathogen

# === Not used ===
# leafgarland/typescript-vim

# =====================

# Log function
function log {
    element="$1"
    action="$2"
    commit="$3"
    timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    printf "%-20s %-30s %-10s %s\n" "${timestamp}" "${element}" "${action}" "${commit}" >> "$logfile"
}

# Make sure basic packages are installed
commit=""
for info in $base ; do
    # Split info into URL and branch
    url="$(echo "$info" | awk -F: '{print $1}')"
    branch="$(echo "$info" | awk -F: '{print $2}')"

    # Get user and repo
    user="$(echo "$url" | awk -F/ '{print $1}')"
    repo="$(echo "$url" | awk -F/ '{print $2}')"

    commit=""

    # Clone the repo
    if [[ ! -e $repo ]] ; then
        git clone "https://github.com/$user/$repo"
        commit=$(git log | head -n 1)
        log "${user}/${repo}" "Cloned" "${commit}"

        # Checkout the branch
        if [[ -n $branch ]] ; then
            cd "$repo" || exit
            git checkout --track "origin/$branch"
            cd ..
            commit=$(git log | head -n 1)
            log "${repo}" "Checkout to origin/$branch" "${commit}"
        fi

    fi
done

# Now go for the upgrade, get the list of directories and update them
cwd="$(pwd)"
elements="$(/bin/ls)"
for element in $elements ; do
    cd "$cwd" || exit
    if [[ -d $element ]] ; then
        cd "$element" || exit
        if [[ -d .git ]] ; then
            echo "Updating ${element}..."
            git pull
            commit=$(git log | head -n 1)
            log "${element}" "Pulled" "${commit}"
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
if grep -q "file-filter=" ale/autoload/ale/handlers/cppcheck.vim ; then
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
