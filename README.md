# vim-tid
A tiddler syntax file for the VIM editor.

## Installation

### Unix

Install `vim.tid` into `~/.vim/syntax/` 

Append the following lines your `.vimrc` file:

    au BufRead,BufNewFile *.tid set filetype=tid
    au! Syntax tid source ~/.vim/syntax/tid.vim

**Note:** You may need to turn on syntax highlighting via your `.vimrc` file:

    syntax on


