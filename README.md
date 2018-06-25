# Setup on Ubuntu

1. Make symlinks for `~/.vim` and `~/.vimrc`

```
$ ln -s ${HOME}/vim-config/.vim ${HOME}/.vim
$ ln -s ${HOME}/vim-config/.vimrc ${HOME}/.vimrc
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

4. Install powerline fonts from https://github.com/powerline/fonts, then set chosen font in term emulator settings

5. Install Exuberant Ctags (used by tagbar)

```
sudo apt install exuberant-ctags
```

# TODO

- [ ] Setup script
- [ ] Make oldfiles searchable
- [ ] `autochdir`
- [ ] Smart file searching (for file completion etc)
- [ ] Resolve inverted vsplit window width adjustment
- [ ] Make buf numbers consecutive