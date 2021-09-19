# Setup on Ubuntu

1. Make symlinks for `~/.vim` and `~/.vimrc`

```
# run from within repo
ln -s `pwd`/.vim ${HOME}/.vim
ln -s `pwd`/.vimrc ${HOME}/.vimrc
```

2. Open `vim`, allow `vim-plug` to automatically install, then install plugins using `:PlugInstall`

3. [Install desired patched NERD font](https://github.com/ryanoasis/nerd-fonts#patched-fonts) and set in terminal

4. Install Exuberant Ctags (used by tagbar)

```
sudo apt install exuberant-ctags
```

5. [Prevent quotes from being concealed in JSON files](https://github.com/Yggdroot/indentLine/issues/140):

```
$ sudo vi
  :e $VIMRUNTIME/syntax/json.vim
  :g/if has('conceal')/s//& \&\& 0/
  :x!
```
