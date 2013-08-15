# Dotfiles for VIM/Conky/etc.

## F.A.Q.

Q: What i can find there?  
A: You can find there my settings for VIM/conky/etc. programms  

Q: Can i steal this?  
A: Of course, you can use this easily  

## How to install my VIM settings

1. Installing VIM lastest version (skip this step, if already installed):  
``` 
sudo add-apt-repository ppa:fcwu-tw/ppa 
```  
```
sudo apt-get update   
```  
```
sudo apt-get install vim
```
2. Clone my repository somewhere and copy settings:   
```
git clone https://github.com/Relrin/dotfiles.git ~/Downloads/
```  
```
cp -r ~/Downloads/dotfiles/vim/* ~/.vim/
```  
```
cp ~/Downloads/dotfiles/vim/.vimrc ~/
```  
3. Run VIM and get fun ;)


