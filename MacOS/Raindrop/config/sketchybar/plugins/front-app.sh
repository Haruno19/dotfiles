ICON_COLOR=0xFFFEFEFE

case $INFO in
  "Code")
    ICON_PADDING_RIGHT=2
    ICON_COLOR=0xff22a1f0
    ICON=󰨞
    ;;
  "Discord")
    ICON_COLOR=0xff5b5bf5
    ICON=󰙯
    ;;
  "Finder")
    ICON_COLOR=0xFFFEFEFE
    ICON=󰉋
    ;;
  "Messages")
    ICON=󰍦
    ;;
  "Notion")
    ICON_COLOR=0xffe0e0e0
    ICON=󰬕
    ;;
  "Preview")
    ICON_COLOR=0xff137DF8
    ICON=
    ;;
  "Spotify")
    ICON_COLOR=0xff24D44E
    ICON=
    ;;
  "iTerm2")
    ICON_COLOR=0xffe0e0e0
    ICON=
    ;;
  "Safari")
    ICON_COLOR=0xffe0e0e0
    ICON=
    ;;
  "GitHub Desktop")
    ICON_COLOR=0xFF9761c9
    ICON=
    ;;
  *)
    ICON_COLOR=0xFFFEFEFE
    ICON=﯂
    ;;
esac

sketchybar --set $NAME \
  icon=$ICON icon.color=$ICON_COLOR \
  label="$INFO"
