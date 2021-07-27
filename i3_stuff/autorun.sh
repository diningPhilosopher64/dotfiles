#xrandr --output DP-0 --off --output DP-1 --off --output DP-2 --mode 2560x1440 --pos 1920x0 --rotate normal --output DP-3 --off --output HDMI-0 --mode 1600x900 --pos 4480x270 --rotate normal --output eDP-1-1 --mode 1920x1080 --pos 0x180 --rotate normal


xrandr --output eDP-1-1 --mode 1920x1080 --pos 0x180 --rotate normal --output DP-2 --mode 2560x1440 --pos 1920x0 --rotate normal --output HDMI-0 --mode 1600x900 --pos 4480x270 --rotate normal --output DP-0 --off --output DP-1 --off  --output DP-3 --off 


pgrep redshift | xargs kill -9 

redshift &

nitrogen --restore

compton &

