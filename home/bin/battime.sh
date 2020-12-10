#!/usr/bin/sh

FULL=$(cat /sys/class/power_supply/BAT0/uevent | grep POWER_SUPPLY_CHARGE_FULL= | cut -d= -f2)
echo "Full: $FULL"
NOW=$(cat /sys/class/power_supply/BAT0/uevent | grep POWER_SUPPLY_CHARGE_NOW= | cut -d= -f2)
echo "Now: $NOW"
REMAIN=$(bc <<< "$FULL - $NOW")

echo "Remain: $REMAIN"
