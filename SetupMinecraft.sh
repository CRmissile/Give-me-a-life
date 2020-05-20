#!/bin/bash
# Original Minecraft Server Installation Script - James A. Chambers - https://www.jamesachambers.com.
# Changes and simplifications by Marc Tönsing
# V1.1 - Dec 15th 2019
# GitHub Repository: https://github.com/mtoensing/RaspberryPiMinecraft

echo "Minecraft Server installation script by Yann CR missile"
echo "Have fun"

if [ -d "minecraft1" ]; then
  echo "Directory minecraft1 already exists!  Exiting... "
  exit 1
fi

echo "Updating packages..."
sudo apt-get update

echo "Installing latest Java OpenJDK 11..."
sudo apt-get install openjdk-11-jre-headless -y

echo "Installing screen... "
sudo apt-get install screen -y

echo "Installing git..."
sudo apt-get install git

echo "Creating minecraft server directory..."
mkdir minecraft1
cd minecraft1

echo "Getting Spigot 1.14.4 Minecraft server..."
wget -O spigot-1.14.4.jar https://cdn.getbukkit.org/spigot/spigot-1.14.4.jar

echo "Getting BuildTools"
wget -O BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar

echo "Updating BuildTools for 1.14.4"
java -Xmx512M -jar BuildTools.jar --rev 1.14.4

echo "Building the Minecraft server... "
java -jar -Xms800M -Xmx800M spigot-1.14.4.jar

echo "Accepting the EULA... "
echo eula=true > eula.txt

echo "Grabbing start.sh from repository... "
wget -O start.sh https://raw.githubusercontent.com/CRmissile/Give-me-a-life/minecraft-with-user-yann/start.sh
chmod +x start.sh

echo "Oh wait. Checking for total memory available..."
TotalMemory=$(awk '/MemTotal/ { printf "%.0f\n", $2/1024 }' /proc/meminfo)
if [ $TotalMemory -lt 3000 ]; then
  echo "Sorry, have to grab low spec start.sh from repository... "
  wget -O start.sh https://raw.githubusercontent.com/CRmissile/Give-me-a-life/minecraft-with-user-yann/start_lowspec.sh
fi

echo "Grabbing restart.sh from repository... "
wget -O restart.sh https://raw.githubusercontent.com/CRmissile/Give-me-a-life/minecraft-with-user-yann/restart.sh
chmod +x restart.sh

echo "Enter a name for your server "
read -p 'Server Name: ' servername
echo "server-name=$servername" >> server.properties
echo "motd=$servername" >> server.properties

echo "Setup is complete. To run the server go to the minecraft directory and type ./start.sh"
echo "Don't forget to set up port forwarding on your router. The default port is 25565"