#!/bin/bash

REPO_DIR=${HOME}/vim-config

if [ -e "${REPO_DIR}" ] ; then
    cd ${HOME}
    ln -s ${REPO_DIR}/.vim ${HOME}/.vim
    ln -s ${REPO_DIR}/.vimrc ${HOME}/.vimrc

    cd ${REPO_DIR}
    git submodule init
    git submodule update
    vim +PluginUpdate +PluginInstall

    echo "$0 install powerline fonts from https://github.com/powerline/fonts, then set chosen font in term emulator settings"
fi

