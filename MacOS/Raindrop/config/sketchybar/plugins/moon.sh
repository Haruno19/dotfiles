sketchybar --set $NAME \
  label="..." \
  icon.color=0xFFFEFEFE

# fetch weather data
WEATHER_JSON=$(curl -s "https://wttr.in/?format=j1")

# Fallback if empty
if [ -z $WEATHER_JSON ]; then
  sketchybar --set $NAME label="Unknown" icon="$ICON"
  return
fi

MOON_PHASE=$(echo $WEATHER_JSON | jq '.weather[0].astronomy[0].moon_phase' | tr -d '"')
MOON_ILLUMINATION=$(echo $WEATHER_JSON | jq '.weather[0].astronomy[0].moon_illumination' | tr -d '"')

case ${MOON_PHASE} in
  "New Moon")
    ICON=
    ;;
  "Waxing Crescent")
    ICON=
    ;;
  "First Quarter")
    ICON=
    ;;
  "Waxing Gibbous")
    ICON=
    ;;
  "Full Moon")
    ICON=
    ;;
  "Waning Gibbous")
    ICON=
    ;;
  "Last Quarter")
    ICON=
    ;;
  "Waning Crescent")
    ICON=
    ;;
esac

sketchybar --set $NAME \
  label="$MOON_ILLUMINATION%" icon=$ICON