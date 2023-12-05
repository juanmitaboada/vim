# My VIM configuration

I have worked daily with vim since childhood, and this is my actual vim configuration.

## Screenshots

Gitgutter + Linting + Inline warnings and errors

![gitgutter_errors_linting](https://user-images.githubusercontent.com/1763207/223777379-99211f11-a42b-4af9-87a2-c1a364452a5f.png)

Buffer Explorer:

![bufferexplorer](https://user-images.githubusercontent.com/1763207/223777381-400b8df9-20b5-4df1-a119-08602fa01ce0.png)

Ack:

![ack](https://user-images.githubusercontent.com/1763207/223777382-1169f499-594f-4c76-9181-9f19fed55424.png)

Tagbar and Nerdtree:

![tagbar_nerdtree](https://user-images.githubusercontent.com/1763207/223777377-5af92be9-43c0-4013-8115-bd17b1981016.png)

Radeon and Control+P:

![radeon_controlp](https://user-images.githubusercontent.com/1763207/223777370-574460c7-cd52-4906-83b0-50ab78e44a8d.png)

## Installation

Before you go, make sure you make a backup of your current vim configuration, go to your home folder and rename both .vim folder and .vimrc file to a different name:

    cd ~ && mv .vimrc .vimrc.backup && mv .vim .vim.backup

Let's install:

1. Go to your home folder, clone this repository, and rename it to .vim:

    `cd ~ && git clone https://github.com/juanmitaboada/vim && mv vim .vim`

2. Link .vimrc into your home folder:

    `ln -s .vim/.vimrc`

3. Install dependencies (it will request your sudo password):

    `~/.vim/vim_install_plugins.sh`

4. Let's install all plugins:

   `cd ~/.vim/bundle/ && ./update.sh`

5. You are ready to go


## Shortcuts


There are plenty of shortcuts but, these are the basic ones:

| Shortcut        | Description                                                                                                 | Provided by     |
|:---------------:|:------------------------------------------------------------------------------------------------------------|:---------------:|
| *               | Search forward word under the cursor                                                                        | vim             |
| n               | Search next word using the same criteria                                                                    | vim             |
| Shift+n         | Search the previous word using the same criteria                                                            | vim             |
| #               | Search backward word under the cursor                                                                       | vim             |
| K               | Search for the word inside man                                                                              | vim             |
| gd              | Go to the first definition of the element under the cursor                                                  | vim             |
| F2              | Start writing and, ultisnips will fill the basic skeleton (check examples)                                  | ultisnips       |
| F3              | Tagbar panel (on/off)                                                                                       | tagbar          |
| F4              | NERD Tree (on/off)                                                                                          | nerdtree        |
| F8              | Save the current session on the current folder                                                              | vim             |
| Ctrl+J          | Beautify the buffer using JSON format                                                                       | vim             |
| Alt+up          | Show all buffers                                                                                            | BufferExplorer  |
| Alt+down        | Close current buffer                                                                                        | vim             |
| Alt+left        | Move to previous buffer                                                                                     | vim             |
| Alt+right       | Move to next buffer                                                                                         | vim             |
| Ctrl+up         | Move current line/block up                                                                                  | vim             |
| Ctrl+down       | Move current line/block down                                                                                | vim             |
| Ctrl+right      | Indent current line/block one level                                                                         | vim             |
| Ctrl+left       | Unindent current line/block one level                                                                       | vim             |
| Ctrl+P colors   | Search for files with the word "colors" in all the project                                                  | ctrlp           |
| Enter           | Go to function definition                                                                                   | ctags           |
| Backspace       | Go back from function definition                                                                            | ctags           |
| :TagsGenerate!  | Will generate one or more tags files                                                                        | vim-tags        |
| :7,17Commentary | Comment/Uncomment from line 7 to line 17 both included                                                      | Commentary      |
| :Ack colors     | Search everywhere in the project for the word "colors"                                                      | Ack             |


#### Ultistnips

if:

    if condition:
        pass

ife:

    if condition:
        pass
    else:
        pass

ei:

    elif condition:
        ...

el:

    else:
        ...

for:

    for item in iterable:
        pass

wl:

    while condition:
        ...

cl:

    class ClassName(object):
        """doctstring for ClassName"""
        def __init__(self, args):
            super(ClassName, self).__init__()
            self.arg = arg

def:

    def function(arg1):
        """TODO: Docstring for function.

        :arg1: TODO
        :returns: TODO

        """



## Bundles in use

| Bundle                                                                          | Description                                                                                                                                 |
|:-------------------------------------------------------------------------------:|:--------------------------------------------------------------------------------------------------------------------------------------------|
| [Ack](https://github.com/mileszs/ack.vim)                                       | Search tool with an enhanced results list                                                                                                   |
| [Airline](https://github.com/vim-airline/vim-airline)                           | Lean & mean status/tabline for Vim that's light as air                                                                                      |
| [ALE](https://github.com/w0rp/ale)                                              | ALE (Asynchronous Lint Engine) is a plugin providing linting (sytax checking and semantic errors)                                           |
| [Arduino Snippets](https://github.com/sudar/vim-arduino-snippets)               | Snippets files for Arduino                                                                                                                  |
| [Arduino Syntax](https://github.com/sudar/vim-arduino-syntax)                   | Syntax file and get syntax highlighting for Arduino functions                                                                               |
| [Black](https://github.com/psf/black)                                           | Uncompromising Python code formatter                                                                                                        |
| [Bufexplorer](https://github.com/jlanzarotta/bufexplorer)                       | Quickly and easily switches between buffers                                                                                                 |
| [CCLS](https://github.com/MaskRay/ccls)                                         | Ccls, which originates from cquery, is a C/C++/Objective-C language server                                                                  |
| [CCTree](https://github.com/hari-rangarajan/CCTree)                             | Plugin generates a symbol dependency tree (aka call tree, call graph) in real-time                                                          |
| [Clang](https://github.com/justmao945/vim-clang)                                | Use of clang to parse and complete C/C++ source files                                                                                       |
| [Commentary](https://github.com/tpope/vim-commentary)                           | Comment stuff out                                                                                                                           |
| [CtrlP](https://github.com/kien/ctrlp.vim)                                      | Full path fuzzy file, buffer, mru, tag, ... finder                                                                                          |
| [DelimitMate](https://github.com/Raimondi/delimitMate)                          | This plug-in provides automatic closing of quotes, parentheses, brackets, etc.                                                              |
| [Dispatch](https://github.com/tpope/vim-dispatch)                               | Leverage the power of Vim's compiler plugins without being bound by synchronicity                                                           |
| [Gitgutter](https://github.com/airblade/vim-gitgutter)                          | Shows a git diff in the sign column                                                                                                         |
| [ISort](https://github.com/fisadev/vim-isort)                                   | Sort python imports                                                                                                                         |
| [Javascript](https://github.com/pangloss/vim-javascript)                        | Syntax highlighting and improved indentation for JavaScript                                                                                 |
| [LSP](https://github.com/prabirshrestha/vim-lsp)                                | Async Language Server Protocol                                                                                                              |
| [Markdown](https://github.com/plasticboy/vim-markdown)                          | Syntax highlighting, matching rules and mappings for the original Markdown and extensions                                                   |
| [NerdTree](https://github.com/scrooloose/nerdtree)                              | File system explorer                                                                                                                        |
| [Pathogen](https://github.com/tpope/vim-pathogen)                               | Makes it super easy to install plugins and runtime files                                                                                    |
| [Platform.io](https://github.com/normen/vim-pio)                                | This is a collection of helper commands to ease the use of PlatformIO                                                                       |
| [Platform.io Neomake](https://github.com/coddingtonbear/neomake-platformio)     | Easily configure neomake to recognize your PlatformIO project's include path                                                                |
| [Radon](https://github.com/rubik/vim-radon)                                     | Show the cyclomatic complexity of Python code (we will use a slightly modified version at juanmitaboada/vim-radon)                          |
| [Repeat](https://github.com/tpope/vim-repeat)                                   | Remaps . in a way that plugins can tap into it                                                                                              |
| [Rust](https://github.com/rust-lang/rust.vim)                                   | Rust file detection, syntax highlighting, formatting, Syntastic integration, and more                                                       |
| [Signify](https://github.com/mhinz/vim-signify)                                 | Uses the sign column to indicate added, modified and removed lines in a file that is managed by a VCS                                       |
| [Snippets](https://github.com/honza/vim-snippets)                               | Snippets files for various programming languages                                                                                            |
| [Surround](https://github.com/tpope/vim-surround)                               | Is all about "surroundings": parentheses, brackets, quotes, XML tags, and more                                                              |
| [Tagbar](https://github.com/majutsushi/tagbar)                                  | Provides an easy way to browse the tags of the current file and get an overview of its structure                                            |
| [Tags](https://github.com/szw/vim-tags)                                         | The Ctags generator                                                                                                                         |
| [Typescript](https://github.com/leafgarland/typescript-vim)                     | Syntax file and other settings for TypeScript                                                                                               |
| [Ultisnips](https://github.com/SirVer/ultisnips)                                | The ultimate solution for snippets                                                                                                          |
| [YouCompleteMe](https://github.com/Valloric/YouCompleteMe)                      | A code-completion engine                                                                                                                    |
| [Zig](https://github.com/ziglang/zig.vim)                                       | File detection and syntax highlighting for the zig programming language                                                                     |

## Author

[Juanmi Taboada](https://juanmitaboada.github.io/)
