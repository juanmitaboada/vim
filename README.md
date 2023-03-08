# My VIM configuration

I work daily with vim from I was a child, and this is my actual vim configuration.

## Installation

1. Go to your home folder, clone this repository and rename it to .vim::

    `cd ~ && git clone https://github.com/juanmitaboada/vim && mv vim .vim`

2. Install dependencies (it will request your sudo password)::

    `~/.vim/vim_install_plugins.sh`

3. Let install all plugins::

   `cd ~/.vim/bundle/ && ./update.sh`

4. You are ready to go


## Shortcuts


There are plenty of shortcuts but this are the basic ones:

| Shortcut        | Description                                                                                                 | Provided by     |
|:---------------:|:------------------------------------------------------------------------------------------------------------|:---------------:|
| *               | Search forward word under the cursor                                                                        | vim             |
| n               | Search next word using same criteria                                                                        | vim             |
| <Shift>+n       | Search previous word using same criteria                                                                    | vim             |
| #               | Search backward word under the cursor                                                                       | vim             |
| K               | Search for the word inside man                                                                              | vim             |
| gd              | Go to first definition of the element under the cursor                                                      | vim             |
| <F2>            | Start writting and ultisnips will fill the basic skeleton (check examples)                                  | ultisnips       |
| <F3>            | Tagbar panel (on/off)                                                                                       | tagbar          |
| <F4>            | NERD Tree (on/off)                                                                                          | nerdtree        |
| <F8>            | Save current session on current folder                                                                      | vim             |
| <Alt>+<up>      | Show all buffers                                                                                            | BufferExplorer  |
| <Alt>+<down>    | Close current buffer                                                                                        | vim             |
| <Alt>+<left>    | Move to previous buffer                                                                                     | vim             |
| <Alt>+<right>   | Move to next buffer                                                                                         | vim             |
| <Ctrl>+<up>     | Move current line/block up                                                                                  | vim             |
| <Ctrl>+<down>   | Move current line/block down                                                                                | vim             |
| <Ctrl>+<right>  | Indent current line/block one level                                                                         | vim             |
| <Ctrl>+<left>   | Unindent current line/block one level                                                                       | vim             |
| <Ctrl>+P colors | Search for files with the word "colors" in all the project                                                  | ctrlp           |
| <Enter>         | Go to function definition                                                                                   | ctags           |
| <Backspace>     | Go back from function definition                                                                            | ctags           |
| :TagsGenerate!  | Will generate one or more tags files                                                                        | vim-tags        |
| :7,17Commentary | Coment/Uncomment from line 7 to line 17 both included                                                       | Commentary      |
| :Ack colors     | Search everywhere in the project for the word "colors"                                                      | Ack             |


#### Ultistnips

if::

    if condition:
        pass

ife::

    if condition:
        pass
    else:
        pass

ei::

    elif condition:
        ...

el::

    else:
        ...

for::

    for item in iterable:
        pass

wl::

    while condition:
        ...

cl::

    class ClassName(object):
        """doctstring for ClassName"""
        def __init__(self, args):
            super(ClassName, self).__init__()
            self.arg = arg

def::

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
| [ALE](https://github.com/w0rp/ale)                                              | ALE (https://github.com/Asynchronous Lint Engine) is a plugin providing linting (https://github.com/syntax checking and semantic errors)    |
| [Arduino Snippets](https://github.com/sudar/vim-arduino-snippets)               | Snippets files for Arduino                                                                                                                  |
| [Arduino Syntax](https://github.com/sudar/vim-arduino-syntax)                   | Syntax file and get syntax highlighting for Arduino functions                                                                               |
| [Black](https://github.com/psf/black)                                           | Uncompromising Python code formatter                                                                                                        |
| [Bufexplorer](https://github.com/jlanzarotta/bufexplorer)                       | Quickly and easily switch between buffers                                                                                                   |
| [CCLS](https://github.com/MaskRay/ccls)                                         | Ccls, which originates from cquery, is a C/C++/Objective-C language server                                                                  |
| [CCTree](https://github.com/hari-rangarajan/CCTree)                             | Plugin generates symbol dependency tree (https://github.com/aka call tree, call graph) in real-time                                         |
| [Clang](https://github.com/justmao945/vim-clang)                                | Use of clang to parse and complete C/C++ source files                                                                                       |
| [Commentary](https://github.com/tpope/vim-commentary)                           | Comment stuff out                                                                                                                           |
| [CtrlP](https://github.com/kien/ctrlp.vim)                                      | Full path fuzzy file, buffer, mru, tag, ... finder                                                                                          |
| [DelimitMate](https://github.com/Raimondi/delimitMate)                          | This plug-in provides automatic closing of quotes, parenthesis, brackets, etc.                                                              |
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
| [Radon](https://github.com/aesnyder/vim-radon)                                  | Show cyclomatic complexity of Python code                                                                                                   |
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
