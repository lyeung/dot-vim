#!/usr/bin/env bash
WORKING_DIR=./working-dir
DOT_VIM_DIR="$WORKING_DIR/.vim"
DOT_VIMRC_DIR="$WORKING_DIR/.vimrc"

function init_dot_vim_dir {
  dot_vim_dir=$1
  mkdir -p $dot_vim_dir/autoload && mkdir -p $dot_vim_dir/bundle

  # install pathogen
  curl -LSso $dot_vim_dir/autoload/pathogen.vim https://tpo.pe/pathogen.vim

  # install plugins from plugin_urls.txt to working dir
  while read line; do
    echo "installing $line"
    plugin_dir=$(echo "$line" | sed 's/.*\/\(.*\)$/\1/')
    echo "plugin dir ${plugin_dir}"
    git clone $line "${dot_vim_dir}/bundle/${plugin_dir}"
  done < 'plugin-urls.txt'
}

# copy dot-vimrc to working-dir .vimrc
function init_dot_vimrc {
  dot_vimrc_dir=$1
  cp dot-vimrc $dot_vimrc_dir

}

init_dot_vim_dir $DOT_VIM_DIR
init_dot_vimrc $DOT_VIMRC_DIR

echo 'Run: mv working-dir/.vim $HOME/.vim && mv working-dir/.vimrc $HOME/.vimrc'
