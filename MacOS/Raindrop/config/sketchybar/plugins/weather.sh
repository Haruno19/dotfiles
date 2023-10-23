sketchybar --set $NAME \
  label="..." \
  icon.color=0xFFFEFEFE

# fetch weather data
WEATHER_JSON=$(curl -s "https://wttr.in/?format=j1")

# Fallback if empty
if [ -z $WEATHER_JSON ]; then
  sketchybar --set $NAME label="No data"
  return
fi

TEMPERATURE=$(echo $WEATHER_JSON | jq '.current_condition[0].temp_C' | tr -d '"')
WEATHER_DESCRIPTION=$(echo $WEATHER_JSON | jq '.current_condition[0].weatherDesc[0].value' | tr -d '"' | sed 's/\(.\{16\}\).*/\1.../')

case $(echo $WEATHER_JSON | jq '.current_condition[0].weatherCode' | tr -d '"') in
  113)
    ICON=
    ;;
  116 | 119 | 122)
    ICON=󰅟
    ;;
  143 | 248 | 260)
    ICON=
    ;;
  179 | 182 | 185 | 281 | 284 | 311 | 314 | 317 | 350 | 362 | 362 | 374 | 377)
    ICON=
    ;;
  176 | 263 | 266 | 293 | 296 | 299 | 302 | 305 | 308 | 353 | 356 | 359)
    ICON=
    ;;
  200 | 386 | 389)
    ICON=
    ;;
  392)
    ICON=
    ;;
  *)
    ICON=
    ;;
  
esac

sketchybar --set $NAME \
  label="$TEMPERATURE$(echo '°')C " \
  icon="$ICON"