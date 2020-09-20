# dot-vim

## Overview

This is a simple BASH script to automate VIM plugin installations and my rc file.
All plugins are assumed to be in `.vim/bundle` directory.

## Prerequisite

* cURL
* vim-gui-common
* vim-runtime
* ack-grep

## Usage

1. Run install script
> install.sh

2. Copy generated files and directories
> mv working-dir/.vim $HOME/.vim && mv working-dir/.vimrc $HOME/.vimrc

