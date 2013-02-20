satrapa-dotvimrc
================

My personal vim configuration. To install all the bundles you only need to delete your .vim directory.
First time you execute vim, vundle and all .vimrc bundles will be autoinstalled.




To configure Powerline bundle, maybe you need to patch your font.
If you're using Ubuntu 12.10 and Ubuntu Mono Font (like me), you can do:

cd ~/.fonts/
cp /usr/share/fonts/truetype/ubuntu-font-family/UbuntuMono-R.ttf .
~/.vim/bundle/powerline/font/fontpatcher.py UbuntuMono-R.ttf
rm UbuntuMono-R.ttf
mv Ubuntu\ Mono\ for\ Powerline.otf UbuntuMonoforPowerline.otf
fc-cache -vf

Then, select Ubuntu Mono for Powerline as your terminal font
(Edit -> Profile Preferences -> General)

More info about this on: https://github.com/Lokaltog/powerline
