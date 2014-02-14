#/bin/sh
export LANG=en_US.UTF-8
source ~/.fehbg &
xset fp+ $HOME/.fonts 
xset fp rehash 
xrdb -merge $HOME/.Xresources &
xmodmap $HOME/.Xmodmap & 
xsetroot -cursor_name left_ptr &
urxvtd -f -q -o &


exec herbstluftwm 
