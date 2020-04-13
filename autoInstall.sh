#!/bin/bash
terminer="Installation terminer"

echo "Ce script va vous permettre d'installer un ensemble de logiciel après une installation"
echo "Vous souhaiter installer quoi [all/qtcreator/java-jdk-8/java-jdk-11] ?"

read input

if [ $input == "all" ]; then
	echo "Installation de tous les paquets demander.."
	sudo apt update -y
	sudo apt full-upgrade -y
	sudo apt install chromium-browser filezilla git vlc -y
	wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
	sudo apt deb teamviewer_amd64.deb -y
	rm teamviewer_amd64.deb
	sudo apt install -f -y
	sudo apt update
	sudo apt install openssh-{server,client} -y
	sudo apt update
	echo $terminer

elif [ $input == "qtcreator" ]; then
	echo "Installation des paquets pour qtcreator.."
	sudo apt update -y
	sudo apt full-upgrade -y
	sudo apt install qtcreator qt5-default qtbase5-dev -y
	sudo apt update
	echo $terminer

elif [ $input == "java-jdk-8" ]; then
	echo "Installation des paquets pour openjdk-8.."
	sudo apt update -y
	sudo apt full-upgrade -y
	sudo apt install openjdk-8-jdk -y
	sudo apt update
	echo $terminer

elif [ $input == "java-jdk-11" ]; then
	echo "Installation des paquets pour openjdk-11.."
	sudo apt update -y
	sudo apt full-upgrade -y
	sudo apt install openjdk-11-jdk -y
	sudo apt update
	echo $terminer

else
	echo "Rien a installer !"

fi
