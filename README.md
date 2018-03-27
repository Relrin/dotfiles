# Dotfiles for VIM/Conky/etc.

## F.A.Q.

Q: What can I find here?  
A: You can find here my settings for VIM/conky/etc. programms

Q: Can I use this for my own purposes?  
A: Of course, you can use it easily

## How to install my VIM settings

1) Installing VIM lastest version (skip this step, if already installed):
```bash
sudo add-apt-repository ppa:fcwu-tw/ppa
sudo apt-get update
sudo apt-get install vim
```

2) Install [powerline-fonts](https://github.com/Lokaltog/powerline-fonts) for vim-airline

3) Install Vundle plugin
```bash
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

4) Clone my repository somewhere and copy settings:
```bash
git clone https://github.com/Relrin/dotfiles.git ~/Downloads/dotfiles/
cp -r ~/Downloads/dotfiles/vim/* ~/.vim/
mv ~/Downloads/dotfiles/vim/.vimrc ~/
```

5) Run VIM and enter:
```bash
:PluginInstall
```

6) Restart VIM and get fun ;)

## How to install Sublime Text settings

1) Copy my settings for Sublime Text 3 into settings folder (but first of all don't forget to make a backup of old preferences):
```bash
git clone https://github.com/Relrin/dotfiles.git ~/Downloads/
# for example, Mac OS X using ~/Library/Application Support/Sublime Text 3/Packages/ folder
cd ~/Downloads/
cp -r ~/Downloads/dotfiles/sublime/Packages/* ~/Library/Application Support/Sublime Text 3/Packages/
```

2) Get list of packages from [requirements.txt](https://raw.githubusercontent.com/Relrin/dotfiles/master/sublime/requirements.txt) and install via [PackageControl](https://packagecontrol.io/)

3) Restart Sublime Text 3 and get fun ;)

## Screenshots

VIM:
  ![alt text](https://raw.githubusercontent.com/Relrin/dotfiles/master/screenshots/vim.png)
Sublime Text 3:
  ![alt text](https://raw.githubusercontent.com/Relrin/dotfiles/master/screenshots/sublime.png)
