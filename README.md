# Setup on Ubuntu

1. Make symlinks for `~/.vim` and `~/.vimrc`

```
# run from within repo
ln -s `pwd`/.vim ${HOME}/.vim
ln -s `pwd`/.vimrc ${HOME}/.vimrc
```

2. `cd` into repo, then set up submodule for Vundle

```
git submodule init
git submodule update
```

3. Run `PluginUpdate` and `PluginInstall`, from either command line or Vim

```
vim +PluginUpdate +PluginInstall
```

4. [Install desired patched NERD font](https://github.com/ryanoasis/nerd-fonts#patched-fonts) and set in terminal

5. Install Exuberant Ctags (used by tagbar)

```
sudo apt install exuberant-ctags
```

6. [Prevent quotes from being concealed in JSON files](https://github.com/Yggdroot/indentLine/issues/140):

```
$ sudo vi
  :e $VIMRUNTIME/syntax/json.vim
  :g/if has('conceal')/s//& \&\& 0/
  :x!
```
