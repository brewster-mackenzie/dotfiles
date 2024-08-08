#!/bin/bash

COLOR="1f2335ff"
GREETER_TEXT="󰌾"
VERIF_TEXT="verifying credentials"
WRONG_TEXT="incorrect username or password"
INSIDE_COLOR="565f89ff"
RING_COLOR="ff9364ff"
INSIDEVER_COLOR="ff757fff"
RINGVER_COLOR="ff007cff"
KEYHL_COLOR="c53b53ff"
BSHL_COLOR="c53b53ff"
INSIDEVER_COLOR="9d7cd8ff"
INSIDEWRONG_COLOR="c53b53ff"
TEXT_COLOR="c3e88dff"
FONT="ProggyClean Nerd Font"

i3lock --nofork --ignore-empty-password -k  \
-c $COLOR \
--greeter-text="$GREETER_TEXT" \
--verif-text="$VERIF_TEXT" \
--wrong-text="$WRONG_TEXT" \
--inside-color="$INSIDE_COLOR" \
--ring-color="$RING_COLOR" \
--insidever-color="$INSIDEVER_COLOR" \
--ringver-color="$RINGVER_COLOR" \
--keyhl-color="$KEYHL_COLOR" \
--bshl-color="$BSHL_COLOR" \
--insidever-color="$INSIDEVER_COLOR" \
--insidewrong-color="$INSIDEWRONG_COLOR" \
--layout-color="$TEXT_COLOR" \
--time-color="$TEXT_COLOR" \
--date-color="$TEXT_COLOR" \
--verif-color="$TEXT_COLOR" \
--wrong-color="$TEXT_COLOR" \
--greeter-color="$TEXT_COLOR" \
--bar-indicator \
--greeter-font="$FONT" \
--time-font="$FONT" \
--date-font="$FONT" \
--layout-font="$FONT" \
--verif-font="$FONT" \
--wrong-font="$FONT" \
--greeter-pos="tx:ty-50"