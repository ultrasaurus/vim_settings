Here are my vim settings, which I drop into my home folder
These are mostly from Adam Wolff, my long time ago vim mentor with some modifications over the years
I use MacVim, which I love (gvim on Windows, which is also quite good)
in my .bashrc, I have:
```
alias mvim="/Applications/MacVim.app/Contents/MacOS/MacVim"
alias vi=mvim
```

I used to use vim settings for bash (set -o vi), but it kills people when I'm pairing, so I've removed it

Feel free to borrow any of these settings if they help you.

```
cd ~
git clone git@github.com:ultrasaurus/vim_settings.git
ln -s ~/vim_settings/.vimrc ~/.vimrc
ln -s ~/vim_settings/.vim ~/.vim
```


