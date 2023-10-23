# Battery is here bcause the ICON_COLOR doesn't play well with all background colors

PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

if [ $PERCENTAGE = "" ]; then
  exit 0
fi

case ${PERCENTAGE} in
  [8-9][0-9] | 100)
    ICON=""
    ICON_COLOR=0xFFFEFEFE
    ;;
  [6-7][0-9])
    ICON=""
    ICON_COLOR=0xFFFEFEFE
    ;;
  [3-5][0-9])
    ICON=""
    ICON_COLOR=0xFFFEFEFE
    ;;
  [1-2][0-9])
    ICON=""
    ICON_COLOR=0xfff5a97f
    ;;
  [0-9])
    ICON=""
    ICON_COLOR=0xffed8796
    ;;
esac

if [[ $CHARGING != "" ]]; then
  ICON=""
  ICON_COLOR=0xff99ff66
fi

sketchybar --set $NAME \
  icon=$ICON \
  label="${PERCENTAGE}%" \
  icon.color=${ICON_COLOR}