#!/bin/sh

timestamp() {
        date +"[%Y-%m-%d %T] "
}

# Set CPU temperature then fan should turn on
VALUE=60

# Set GPIO pin where is fan powering
PIN=9

# Set logging file
LOGDIR=”/var/log/fan.log”

# Get CPU temperature
# You can use alternative files:
#   /sys/devices/virtual/thermal/thermal_zone0/temp
#   /sys/devices/virtual/thermal/thermal_zone1/temp
#   /sys/class/thermal/thermal_zone0/temp
#   /sys/class/thermal/thermal_zone1/temp
TEMP=$(cat /sys/devices/virtual/thermal/thermal_zone1/temp)

# Set pin as output
gpio mode $PIN out

# Read current pin status
STATUS=$(gpio read $PIN)


# Check if some of variable are not empty
if [ $STATUS == "" ] || [ $TEMP == "" ]
then
        exit 1
fi

# Do the simple magic
if [ $TEMP -ge $VALUE ] && [ $STATUS -eq 0 ]
then
        gpio write $PIN 0
        echo `timestamp` "[ON] Fan started at $TEMP°C" >> $LOGDIR
elif [ $TEMP -le $VALUE ] && [ $STATUS -eq 1 ]
then
        gpio write $PIN 1
        echo `timestamp` "[OFF] Fan stopped at $TEMP°C" >> $LOGDIR
fi
