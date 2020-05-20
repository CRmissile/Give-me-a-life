# Minecraft Server startup script using screen
echo "Starting Minecraft server.  To view window type screen -r minecraft1."
echo "To minimize the window and let the server run in the background, press Ctrl+A then Ctrl+D"
cd /home/yann/minecraft1/
/usr/bin/screen -dmS minecraft1 /usr/bin/java -jar -Xms3865M -Xmx3865M /home/yann/minecraft1/spigot-1.14.4.jar