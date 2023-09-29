INTERNAL_MONITOR=$(xrandr | awk '/\ connected/ && /[[:digit:]]x[[:digit:]].*+/{print $1}' | awk '/e/{print $1}')
EXTERNAL_MONITOR=$(xrandr | awk '/\ connected/ && /[[:digit:]]x[[:digit:]].*+/{print $1}' | awk '!/e/{print $1}')

monitor_add() {
  # Move first 5 desktops to external monitor
  for desktop in $(bspc query -D --names -m "$INTERNAL_MONITOR" | sed 5q); do
    bspc desktop "$desktop" --to-monitor "$EXTERNAL_MONITOR"
  done

  # Remove default desktop created by bspwm
  bspc desktop Desktop --remove

  # reorder monitors
  bspc wm -O "$INTERNAL_MONITOR"  "$EXTERNAL_MONITOR" 
}

monitor_remove() {
  # Add default temp desktop because a minimum of one desktop is required per monitor
  bspc monitor "$EXTERNAL_MONITOR" -a Desktop

  # Move all desktops except the last default desktop to internal monitor
  for desktop in $(bspc query -D -m "$INTERNAL_MONITOR");	do
    bspc desktop "$desktop" --to-monitor "$EXTERNAL_MONITOR"
  done

  # delete default desktops
  bspc desktop Desktop --remove

  # reorder desktops
  bspc monitor "$INTERNAL_MONITOR" -d 1 2 3 4 5 6 7 8 9 10
}

if [[ $(xrandr -q | grep "${EXTERNAL_MONITOR} connected") &&  ! -z $EXTERNAL_MONITOR ]]; then
  notify-send "Found multiple monitors"
  # set xrandr rules for docked setup
  xrandr --output "$INTERNAL_MONITOR" --mode 1920x1200 --rate 60 --pos 0x1071 --rotate normal --output "$EXTERNAL_MONITOR" --primary --mode 3440x1440 --rate 100 --pos 1920x0 --rotate normal

  if [[ $(bspc query -D -m "${EXTERNAL_MONITOR}" | wc -l) -ne 5 ]]; then
    monitor_add
  fi
  bspc wm -O "$INTERNAL_MONITOR"  "$EXTERNAL_MONITOR" 
else
  # set xrandr rules for mobile setup
  xrandr --output "$INTERNAL_MONITOR" --primary --mode 1920x1200 --rate 60 --pos 0x0 --rotate normal --output "$EXTERNAL_MONITOR" --off
  if [[ $(bspc query -D -m "${INTERNAL_MONITOR}" | wc -l) -ne 10 ]]; then
    monitor_remove
  fi
fi


## Start FEH wallpaper service
source ~/.fehbg &


## Start Polybars
killall -q polybar
# Wait until the processes have been shut down
# while pgrep -x polybar >/dev/null; do sleep 1; done
while pgrep -u $UID -x polybar > /dev/null; do sleep 2; done

# Launch
if [[ $(xrandr -q | grep "${EXTERNAL_MONITOR} connected") ]]; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload left & MONITOR=$m polybar --reload center & MONITOR=$m polybar --reload right &
  done
else
  polybar --reload left & polybar --reload center & polybar --reload right &
fi

notify-send "Reloaded BSPWM and initialized Polybars"
echo "Bar launched..."


# UDEV  [75007.484175] change   /devices/platform/evdi.0/drm/card2 (drm)
# ACTION=change
# DEVPATH=/devices/platform/evdi.0/drm/card2
# SUBSYSTEM=drm
# HOTPLUG=1
# DEVNAME=/dev/dri/card2
# DEVTYPE=drm_minor
# SEQNUM=19677
# USEC_INITIALIZED=6605134
# ID_PATH=platform-evdi.0
# ID_PATH_TAG=platform-evdi_0
# ID_FOR_SEAT=drm-platform-evdi_0
# MAJOR=226
# MINOR=2
# DEVLINKS=/dev/dri/by-path/platform-evdi.0-card
# TAGS=:snap_snap-store_ubuntu-software:uaccess:snap_snap-store_snap-store:seat:snap_snap-store_ubuntu-software-local-file:master-of-seat:

