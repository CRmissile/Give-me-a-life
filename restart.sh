#!/bin/sh
# Marc Tönsing - V1.1 - 18.05.2018
# Minecraft Server restart and pi reboot.
screen -Rd minecraft1 -X stuff "say Server is restarting in 30 seconds! $(printf '\r')"
sleep 23s
screen -Rd minecraft1 -X stuff "say Server is restarting in 7 seconds! $(printf '\r')"
sleep 1s
screen -Rd minecraft1 -X stuff "say Server is restarting in 6 seconds! $(printf '\r')"
sleep 1s
screen -Rd minecraft1 -X stuff "say Server is restarting in 5 seconds! $(printf '\r')"
sleep 1s
screen -Rd minecraft1 -X stuff "say Server is restarting in 4 seconds! $(printf '\r')"
sleep 1s
screen -Rd minecraft1 -X stuff "say Server is restarting in 3 seconds! $(printf '\r')"
sleep 1s
screen -Rd minecraft1 -X stuff "say Server is restarting in 2 seconds! $(printf '\r')"
sleep 1s
screen -Rd minecraft1 -X stuff "say Server is restarting in 1 second! $(printf '\r')"
sleep 1s
screen -Rd minecraft1 -X stuff "say Closing server...$(printf '\r')"
screen -Rd minecraft1 -X stuff "stop $(printf '\r')"
sleep 15s
echo "Restarting now."
sudo /sbin/reboot