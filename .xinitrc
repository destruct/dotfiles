source ~/.fehbg &

conky &
#conky -c ~/.conkyrc_song &
#conky -c ~/.conkyrc_clock &
xset +fp $HOME/.fonts &
#xscreensaver &
lal &

aplay ~/.opening_theme.wav &
urxvtd -q -o -f &

exec openbox


