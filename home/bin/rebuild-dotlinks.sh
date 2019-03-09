for file in `ls -A --color=never ~/.dots/home/`; do ln -s ~/.dots/home/$file ~/$file; done;
